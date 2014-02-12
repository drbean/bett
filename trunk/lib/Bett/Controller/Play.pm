package Bett::Controller::Play;
use Moose;
use namespace::autoclean;

use List::MoreUtils qw/any/;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Bett::Controller::Play - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


#=head2 index
#
#=cut
#
#sub index :Path :Args(0) {
#    my ( $self, $c ) = @_;
#    $c->stash( config => $c->config );
#    $c->stash( template => 'exchange.tt2' );
#}

=cut

=head2 setup

Session and WH, YN, Tag standing.

=cut

sub setup :Chained('/') :PathPart('play') :CaptureArgs(1) {
	my ($self, $c, $mycourse) = @_;
        my $player = $c->session->{player_id};
	my $league = $c->session->{league};
	my $exercise = $c->session->{exercise};
	my $gameover;
	for my $allcourse ( 'WH', 'YN', 'Tag' ) {
		my $standing = $c->model("DB::$allcourse")
			->find({ player => $player,
			exercise => $exercise,
			league => $league });
		$c->stash($allcourse => $standing);
		$gameover++ if ( $standing->questionchance < 0 or
			$standing->answerchance < 0 );
		$gameover++ if ( $standing->score >=
			$c->config->{$allcourse}->{win} );
	}
	my $questions = $c->model('DB::Question')->search({
		league => $league,
		exercise => $exercise,
		});
	$c->stash(questions => $questions);
	$c->stash(course => $mycourse);
	$c->stash(player => $player);
	$c->stash(exercise => $exercise);
	$c->stash(league => $league);
	if ( $gameover ) {
		$c->stash(gameover => $gameover);
		$c->detach('exchange');
	}
}

=head2 wordschars

=cut

sub wordschars :Chained('setup') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $exercise = $c->stash->{exercise};
	my @chars = $c->model('DB::Character')->
		search({ exercise => $exercise})->
		get_column("string")->all;
	s/_(\w)/ \u$1/g foreach @chars;
	s/\b(\w)/\u$1/g foreach @chars;
	$c->stash->{ characters } = \@chars;
	$c->stash->{words} = 
		$c->model('DB::Word')->find(
		{exercise => $exercise})->string;
}

=head2 try

Course, question, answer and Questioner's course and answer. Errors from haskell's Questioner: expectedcourse contains  unknown words and theanswer shows Questioner unhandles it.

=cut

sub try :Chained('wordschars') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $ex = $c->stash->{exercise};
	if ( $c->request->params ) {
		my $course = $c->stash->{course};
		my $question = $c->request->params->{question};
		$question ||= '';
		my $myanswer = $c->request->params->{answer};
		my $tries = $c->model('DB::Try')->search({
			league => $c->stash->{league},
			exercise => $c->stash->{exercise},
			player => $c->stash->{player},
			});
		$tries->create({
				try => ($tries->get_column('try')->max() + 1),
				quoted => $question,
				answer => $myanswer,
			});
		my $check =
qx"echo \"$question\" | /var/www/cgi-bin/bett/bin/Transfer_$ex";
		my ($lexed, $expectedcourse, $theanswer) =
						(split /\n/, $check); 
		my $unknown_field = qr/Questioner_$ex: unknown words: /;
		my $unknown;
		($unknown = $expectedcourse) =~ s/^$unknown_field(.*)$/$1/
			if $expectedcourse =~ $unknown_field;
		$c->stash( lexed => $lexed || '');
		$c->stash( unknown => $unknown || '');
		$c->stash( question => $question );
		$c->stash( myanswer => $myanswer );
		$c->stash( theanswer => $theanswer );
		$c->stash( expectedcourse => $expectedcourse );
	}
}

=head2 evaluate

=cut

sub evaluate :Chained('try') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $ex = $c->stash->{exercise};
	my %translate = ( WH => 'WH-question',
		YN	=> 'YN-question',
		Tag	=> 'Tag question',
		S	=> 'Sentence (True-False question)' );
	my $course = $c->stash->{course};
	my $expectedcourse = $c->stash->{expectedcourse};
	my $unknown = $c->stash->{unknown};
	my $question = $c->stash->{question};
	my $theanswer = $c->stash->{theanswer};
	my $myanswer = $c->stash->{myanswer};
	my ($thewhanswers, @thewhanswers);
	my $grammatical = "Grammatical";
	if ( $expectedcourse eq 'WH' ) {
		$thewhanswers = $theanswer;
		@thewhanswers = split / /, $theanswer;
		$myanswer =~ s/_/ /g;
		s/_/ /g for @thewhanswers;
	}
	if ( $question eq '' )
	{
		$c->stash->{error_msg} =
			"Enter a question and answer.";
		$c->stash->{nothing} = 1;
	}
	elsif ( $unknown ) {
		$unknown =~ tr/"/'/;
		$c->stash->{error_msg} = "The question '$question' contained unknown words, $unknown. Use only the words from the list.";
		# $c->stash( unknown => $unknown );
	}
	elsif ( $theanswer =~ m/^Questioner_$ex: / ) {
        $c->stash->{error_msg} = "The question, '$question' was a correct question, but Bett doesn't know the answer. Report the problem to Dr Bean.";
        $c->stash->{unhandled} = $theanswer;
    }
	elsif ( $course and ($expectedcourse ne 'Unparseable') and ($course ne $expectedcourse ) ) {
			$c->stash->{error_msg} =
"'$question' is not a $translate{$course}. It's a $translate{$expectedcourse}. Try again.";
			$c->stash->{wrongcourse} = $course;
	}
    elsif ( $expectedcourse eq 'Unparseable' ) {
            $c->stash->{error_msg} = "'$question' is not grammatical. Try again.";
            $c->stash->{err} = "question";
            $grammatical = 'Unparseable';
            }
    elsif ( @thewhanswers and not any { $_ eq $myanswer } @thewhanswers ) {
            $c->stash->{error_msg} =
"The question, '$question' was grammatical, but '$myanswer' is not the answer, nor one of the answers to '$question'. " .
    "The answer(s) is/are: '$thewhanswers'.";
            $c->stash->{err} = "answer";
    }
    elsif ( @thewhanswers and any { $_ eq $myanswer } @thewhanswers ) {

            $c->stash->{status_msg} = "'$myanswer' is a correct answer to '$question'. " .
    "The full list of correct answers is: '$thewhanswers'.";
            $c->stash->{thewhanswers} = \@thewhanswers;
    }
    elsif ( $theanswer and $myanswer ne $theanswer ) {
            $c->stash->{error_msg} =
"The question, '$question' was grammatical, but the answer to '$question' is not '$myanswer,', it's '$theanswer'. Try again.";
            $c->stash->{err} = "answer";
    }
    elsif ( $myanswer eq $theanswer ) {
              $c->stash->{status_msg} = "The question, '$question' was a grammatical question, and your answer, $myanswer was the correct answer to that question."
	}


	#elsif ( $parsed ) {
	#	$c->stash->{status_msg} = "The question, '$question' was a grammatical question.";
	#	# $c->stash( unknown => 'No illegal words' );
	#}
	#elsif ( not $parsed and not $unknown ) {
	#	$c->stash->{error_msg} = "'$question' is not grammatical. Try again.";
	#	$c->stash( err => "question" );
	#	# $c->stash( unknown => 'No illegal words' );
	#	# $c->stash( parsed => 'No parse' );
	#}
	else {
		$c->stash->{error_msg} = "Bett is having problems. Please report the problem to Dr Bean. Expected course: $expectedcourse, answer: $theanswer,";
	}
	$c->stash->{grammatical} = $grammatical unless $unknown;
}

=head2 question

New/old questions, answers

=cut

sub question :Chained('evaluate') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $exercise= $c->stash->{exercise };
	my $league= $c->stash->{ league };
	my $course = $c->stash->{course};
	my $oldquestion = $c->stash->{question};
	my $grammatical = ( $c->stash->{grammatical} eq "Grammatical" ) ? 'True': 'False';
	my $questions = $c->stash->{questions};
	my $question = $questions->find({
		lexed => $c->stash->{lexed} || $oldquestion
		});
	if ( $question ) {
		$c->stash->{error_msg} .= " But '$oldquestion' is already in the question database. Try again.";
		$c->stash->{oldquestion} = $question;
	}
	elsif ( not $c->stash->{unknown} and not $c->stash->{nothing} ) {
		$questions->create({
			lexed => $c->stash->{lexed} || $oldquestion,
			quoted => $c->stash->{question},
			course => $c->stash->{course},
			player => $c->stash->{player},
			grammatical => $grammatical,
		});
	}
	$c->stash( questions => $questions );
	
}

=head2 update

=cut

sub update :Chained('question') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $player = $c->stash->{ player };
	my $exercise= $c->stash->{exercise };
	my $league= $c->stash->{ league };
	my $course = $c->stash->{course};
	my $cOURSE = ucfirst ( lc $course );
	my $standing = $c->stash->{$course};
	my $err = $c->stash->{err};
	my $unknown = $c->stash->{unknown};
	my $unhandled = $c->stash->{unhandled};
	my $tries = $standing->try;
	my $score = $standing->score;
	my $questions = $standing->questionchance;
	my $answers = $standing->answerchance;
	my $myanswer = $c->stash->{myanswer};
	my $thewhanswers = $c->stash->{thewhanswers};
	if ( $c->stash->{nothing} ) { 1 }
	elsif ( $err and $err eq 'question' ) {
		$standing->update({
			try => ++$tries,
			questionchance =>
				--$questions,
			});
	}
	elsif ( $err and $err eq 'answer' ) {
		$standing->update({
			try => ++$tries,
			answerchance =>
				--$answers,
			});
	}
	elsif ( $c->stash->{oldquestion} or $c->stash->{wrongcourse} )
	{
		$standing->update({ try => ++$tries });
	}
	elsif ( $c->stash->{lexed} ) {
		$standing->update({
			try => ++$tries,
			score => ++$score,
			});
	}
	else {
		die "Questions left: $questions, error $err, answers left: $answers,";
		$c->stash->{error_msg} = "Impossible question, or answer!";
	}
}

=head2 exchange

GAME OVER, or loop back to REPL.

=cut

sub exchange :Chained('update') :PathPart('') :Args(0) {
	my ( $self, $c ) = @_;
	my $course = $c->stash->{course};
	my $win = $c->config->{$course}->{win};
	$c->stash->{win} = $win;
	my $standing = $c->stash->{$course};
	my $questions = $c->stash->{questions};
	my @goodqns = $questions->search({grammatical => 1})->all;
	my @badqns = $questions->search({ grammatical => 0})->all;
	$c->stash(goodqn => \@goodqns);
	$c->stash(badqn => \@badqns);
			#[{ quoted => "fdsfds", player => 'N9741065'}]);
	if ( $standing->questionchance < 0 or 
		$standing->answerchance < 0 ) {
		$c->stash->{ template } = 'over.tt2';
		$c->stash->{ result } = 'loss';
	}
	elsif ( $standing->score >= $win ) {
		$c->stash->{ template } = 'over.tt2';
		$c->stash->{ result } = 'win';
	}
	elsif ( $c->stash->{gameover} ) {
		$c->stash->{ template } = 'over.tt2';
	}
	else {
		$c->stash->{ config } = $c->config;
		$c->stash->{ course } = $course;
		$c->stash->{ template } = 'play.tt2';
	}
	$c->stash( status => $c->stash->{ status_msg } || "No status message" );
	$c->stash( error => $c->stash->{ error_msg } || "No error message" );
	$c->stash( unknown => $c->stash->{ unknown } || 'No illegal words' );
	$c->stash( grammatical => $c->stash->{ grammatical } || 'No parse' );
}

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
