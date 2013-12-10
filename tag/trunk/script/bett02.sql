--
-- Add users and role tables, along with a many-to-many join table
--
PRAGMA foreign_keys = ON;

CREATE TABLE player (
        id            TEXT PRIMARY KEY,
        name      TEXT,
        password      TEXT
);

CREATE TABLE league (
        id        TEXT PRIMARY KEY,
        name      TEXT,
        field     TEXT,
	genre	TEXT
);

CREATE TABLE member (
        league  TEXT REFERENCES league(id) ON DELETE CASCADE ON UPDATE CASCADE,
        player  TEXT REFERENCES player(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (player, league)
);

CREATE TABLE role (
        id   INTEGER PRIMARY KEY,
        role TEXT
);

CREATE TABLE rolebearer (
        player TEXT REFERENCES player(id) ON DELETE CASCADE ON UPDATE CASCADE,
        role INTEGER REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (player, role)
);

CREATE TABLE genre (
        id   INTEGER PRIMARY KEY,
        genre TEXT
);

CREATE TABLE leaguegenre (
        league TEXT REFERENCES league(id) ON DELETE CASCADE ON UPDATE CASCADE,
        genre TEXT REFERENCES genre(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (league, genre)
);

CREATE TABLE word (
	exercise TEXT PRIMARY KEY,
	string TEXT
);

CREATE TABLE character (
        entity   TEXT,
	string TEXT,
	exercise TEXT,
	PRIMARY KEY (entity,exercise)
);

CREATE TABLE question (
        player TEXT
        lexed   TEXT,
	league TEXT,
	exercise TEXT,
	course TEXT,
	quoted TEXT,
	grammar BOOL,
	answer TEXT,
        PRIMARY KEY (lexed, exercise, league)
		);

CREATE TABLE wh (
        exercise TEXT,
        player TEXT,
	league TEXT,
	try INT,
	score INT,
	questionchance INT,
	answerchance INT,
        PRIMARY KEY (player, league, exercise)
		);


CREATE TABLE yn (
        exercise TEXT,
        player TEXT,
	league TEXT,
	try INT,
	score INT,
	questionchance INT,
	answerchance INT,
        PRIMARY KEY (player, league, exercise)
		);


CREATE TABLE s (
        exercise TEXT,
        player TEXT,
	league TEXT,
	try INT,
	score INT,
	questionchance INT,
	answerchance INT,
        PRIMARY KEY (player, league, exercise)
		);

CREATE TABLE questioncourse (
	question TEXT,
	player	TEXT,
	league	TEXT,
	exercise	TEXT,
	course	TEXT,
	PRIMARY KEY (question, player, league, exercise)
	);


CREATE TABLE play (
        question TEXT,
	answer TEXT,
        player TEXT REFERENCES member(player) ON DELETE CASCADE ON UPDATE CASCADE,
	league TEXT,
	course TEXT,
	try INT,
	score INT,
	questionchance INT,
	answerchance INT,
	exercise TEXT,
        PRIMARY KEY (player, league, course, question, exercise)
		);


--
-- Load up some initial test data
--
INSERT INTO player VALUES (1, 'test01', 'mypass');
INSERT INTO player VALUES (2, 'test02', 'mypass');
INSERT INTO player VALUES (3, 'test03', 'mypass');
INSERT INTO role VALUES (1, 'user');
INSERT INTO role VALUES (2, 'admin');
INSERT INTO rolebearer VALUES (1, 1);
INSERT INTO rolebearer VALUES (1, 2);
INSERT INTO rolebearer VALUES (2, 1);
INSERT INTO rolebearer VALUES (3, 1);
