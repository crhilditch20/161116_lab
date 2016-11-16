DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums(
  id SERIAL8 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 references artists(id)
);

CREATE TABLE songs(
  id SERIAL8 primary key,
  title VARCHAR(255),
  duration time,
  cost FLOAT8,
  album_id INT8 references albums(id)
);

