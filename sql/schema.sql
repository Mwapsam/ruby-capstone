CREATE DATABASE catalog_of_things;
CREATE TABLE author(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        first_name TEXT,
        last_name TEXT
);
CREATE TABLE source(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        "name" TEXT
);
CREATE TABLE label(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        title TEXT,
        color TEXT
);
CREATE TABLE genre(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        "name" TEXT
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

CREATE TABLE movie(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        silent BOOLEAN,
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
CREATE TABLE book(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        cover_state TEXT,
        publisher TEXT,
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

CREATE TABLE music(
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        "name" TEXT,
        on_spotify BOOLEAN,
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