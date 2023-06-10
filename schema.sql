CREATE DATABASE catalog;

CREATE TABLE item (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id VARCHAR(50),
  author_id VARCHAR(50),
  label_id VARCHAR(50),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id),
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE
);

CREATE TABLE author (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE books (
    id  INT,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE album (
   id INT PRIMARY KEY REFERENCES item(id),
   genre VARCHAR(50),
   author VARCHAR(50),
   label VARCHAR(50),
   source VARCHAR(50),
   on_spotify VARCHAR(50),
   publish_date DATE,
   archived BOOL
);

CREATE TABLE genre (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);
