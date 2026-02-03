CREATE TABLE IF NOT EXISTS genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS musician(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL 
);

CREATE TABLE IF NOT EXISTS album(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS track(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    duration VARCHAR NOT NULL,
    album_id INTEGER REFERENCES album(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS collect(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE genre_musician(
	musician_id INTEGER REFERENCES musician(id),
	genre_id INTEGER REFERENCES genre(id),
	PRIMARY KEY (genre_id, musician_id)
);

CREATE TABLE musician_album(
	musician_id INTEGER  REFERENCES musician(id),
	album_id INTEGER REFERENCES album(id),
	PRIMARY KEY (musician_id, album_id)
);

CREATE TABLE track_collect(
	track_id INTEGER REFERENCES track(id),
	collect_id INTEGER REFERENCES collect(id),
	PRIMARY KEY (track_id, collect_id)
);