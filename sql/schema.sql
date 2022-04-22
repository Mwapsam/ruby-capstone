CREATE DATABASE capstone;

CREATE TABLE genres (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE music_albums (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    on_spotify BOOLEAN NOT NULL,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Create a table for books
CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(255),
  book_title VARCHAR(255),
  cover_state VARCHAR(255),
  published_date DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

-- Create a table for labels
CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255),
  color VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE author(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        first_name TEXT,
        last_name TEXT
);

CREATE TABLE game(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        multiplayer BOOLEAN,
        last_played_at DATE,
        publish_date DATE,
        archived BOOLEAN,
        genre_id INTEGER,
        source_id INTEGER,
        author_id INTEGER,
        label_id INTEGER,
        FOREIGN KEY(genre_id) REFERENCES genre(id),
        FOREIGN KEY(source_id) REFERENCES source(id),
        FOREIGN KEY(author_id) REFERENCES author(id),
        FOREIGN KEY(label_id) REFERENCES label(id)
);