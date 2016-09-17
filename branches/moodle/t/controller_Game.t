use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Bett';
use Bett::Controller::Game;

ok( request('/game')->is_success, 'Request should succeed' );
done_testing();
