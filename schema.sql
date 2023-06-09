CREATE DATABASE catalog;

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id), ,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE
);

CREATE TABLE author (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
  archived BOOLEAN
);

CREATE TABLE book (
  id INT PRIMARY KEY REFERENCES item(id), ,
  publish_date DATE,
  publisher VARCHAR(50),
  cover_state VARCHAR(50)
);

CREATE TABLE label (
  id INT SERIAL PRIMARY KEY,
  title VARCHAR(50),
  color VARCHAR(50)
);
