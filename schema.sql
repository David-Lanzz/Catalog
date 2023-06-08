CREATE DATABASE catalog;

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
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
