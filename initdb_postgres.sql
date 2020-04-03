-- Gochan PostgreSQL/SQLite startup/update script
-- DO NOT DELETE

CREATE TABLE IF NOT EXISTS DBPREFIXannouncements (
	id SERIAL,
	subject VARCHAR(45) NOT NULL DEFAULT '',
	message TEXT NOT NULL CHECK (message <> ''),
	poster VARCHAR(45) NOT NULL CHECK (poster <> ''),
	timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXappeals (
	id SERIAL,
	ban INT NOT NULL CHECK (ban <> 0),
	message TEXT NOT NULL CHECK (message <> ''),
	timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	denied BOOLEAN DEFAULT FALSE,
	staff_response TEXT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXbanlist (
	id SERIAL,
	allow_read BOOLEAN DEFAULT TRUE,
	ip VARCHAR(45) NOT NULL DEFAULT '',
	name VARCHAR(255) NOT NULL DEFAULT '',
	name_is_regex BOOLEAN DEFAULT FALSE,
	filename VARCHAR(255) NOT NULL DEFAULT '',
	file_checksum VARCHAR(255) NOT NULL DEFAULT '',
	boards VARCHAR(255) NOT NULL DEFAULT '*',
	staff VARCHAR(50) NOT NULL DEFAULT '',
	timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	expires TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	permaban BOOLEAN NOT NULL DEFAULT TRUE,
	reason VARCHAR(255) NOT NULL DEFAULT '',
	type SMALLINT NOT NULL DEFAULT 3,
	staff_note VARCHAR(255) NOT NULL DEFAULT '',
	appeal_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	can_appeal BOOLEAN NOT NULL DEFAULT true,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXboards (
	id SERIAL,
	list_order SMALLINT NOT NULL DEFAULT 0,
	dir VARCHAR(45) NOT NULL CHECK (dir <> ''),
	type SMALLINT NOT NULL DEFAULT 0,
	upload_type SMALLINT NOT NULL DEFAULT 0,
	title VARCHAR(45) NOT NULL CHECK (title <> ''),
	subtitle VARCHAR(64) NOT NULL DEFAULT '',
	description VARCHAR(64) NOT NULL DEFAULT '',
	section INT NOT NULL DEFAULT 1,
	max_file_size INT NOT NULL DEFAULT 4718592,
	max_pages SMALLINT NOT NULL DEFAULT 11,
	default_style VARCHAR(45) NOT NULL DEFAULT '',
	locked BOOLEAN NOT NULL DEFAULT FALSE,
	created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	anonymous VARCHAR(45) NOT NULL DEFAULT 'Anonymous',
	forced_anon BOOLEAN NOT NULL DEFAULT FALSE,
	max_age INT NOT NULL DEFAULT 0,
	autosage_after INT NOT NULL DEFAULT 200,
	no_images_after INT NOT NULL DEFAULT 0,
	max_message_length INT NOT NULL DEFAULT 8192,
	embeds_allowed BOOLEAN NOT NULL DEFAULT TRUE,
	redirect_to_thread BOOLEAN NOT NULL DEFAULT TRUE,
	require_file BOOLEAN NOT NULL DEFAULT FALSE,
	enable_catalog BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY (id),
	UNIQUE (dir)
);
ALTER TABLE DBPREFIXboards
	ALTER COLUMN default_style TYPE VARCHAR(45),
	ALTER COLUMN default_style SET DEFAULT '';

CREATE TABLE IF NOT EXISTS DBPREFIXembeds (
	id SERIAL,
	filetype VARCHAR(3) NOT NULL,
	name VARCHAR(45) NOT NULL,
	video_url VARCHAR(255) NOT NULL,
	width SMALLINT NOT NULL,
	height SMALLINT NOT NULL,
	embed_code TEXT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXinfo (
	name VARCHAR(45) NOT NULL,
	value TEXT NOT NULL,
	PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS DBPREFIXlinks (
	id SERIAL,
	title VARCHAR(45) NOT NULL,
	url VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXposts (
	id SERIAL,
	boardid INT NOT NULL,
	parentid INT NOT NULL DEFAULT '0',
	name VARCHAR(50) NOT NULL,
	tripcode VARCHAR(10) NOT NULL,
	email VARCHAR(50) NOT NULL,
	subject VARCHAR(100) NOT NULL,
	message TEXT NOT NULL,
	message_raw TEXT NOT NULL,
	password VARCHAR(45) NOT NULL,
	filename VARCHAR(45) NOT NULL DEFAULT '',
	filename_original VARCHAR(255) NOT NULL DEFAULT '',
	file_checksum VARCHAR(45) NOT NULL DEFAULT '',
	filesize INT NOT NULL DEFAULT 0,
	image_w SMALLINT NOT NULL DEFAULT 0,
	image_h SMALLINT NOT NULL DEFAULT 0,
	thumb_w SMALLINT NOT NULL DEFAULT 0,
	thumb_h SMALLINT NOT NULL DEFAULT 0,
	ip VARCHAR(45) NOT NULL DEFAULT '',
	tag VARCHAR(5) NOT NULL DEFAULT '',
	timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	autosage BOOLEAN NOT NULL DEFAULT FALSE,
	deleted_timestamp TIMESTAMP,
	bumped TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	stickied BOOLEAN NOT NULL DEFAULT FALSE,
	locked BOOLEAN NOT NULL DEFAULT FALSE,
	reviewed BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (boardid,id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXreports (
	id SERIAL,
	board VARCHAR(45) NOT NULL,
	postid INT NOT NULL,
	timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ip VARCHAR(45) NOT NULL,
	reason VARCHAR(255) NOT NULL,
	cleared BOOLEAN NOT NULL DEFAULT FALSE,
	istemp BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXsections (
	id SERIAL,
	list_order SMALLINT NOT NULL DEFAULT 0,
	hidden SMALLINT DEFAULT 0,
	name VARCHAR(45) NOT NULL,
	abbreviation VARCHAR(10) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXsessions (
	id SERIAL,
	name CHAR(16) NOT NULL,
	sessiondata VARCHAR(45) NOT NULL,
	expires TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DBPREFIXstaff (
	id SERIAL,
	username VARCHAR(45) NOT NULL,
	password_checksum VARCHAR(120) NOT NULL,
	rank SMALLINT NOT NULL,
	boards VARCHAR(128) NOT NULL DEFAULT '*',
	added_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_active TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE (username)
);
ALTER TABLE DBPREFIXstaff
	DROP COLUMN IF EXISTS salt;

CREATE TABLE IF NOT EXISTS DBPREFIXwordfilters (
	id SERIAL,
	search VARCHAR(75) NOT NULL CHECK (search <> ''),
	change_to VARCHAR(75) NOT NULL DEFAULT '',
	boards VARCHAR(128) NOT NULL DEFAULT '*',
	regex BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (id)
);
