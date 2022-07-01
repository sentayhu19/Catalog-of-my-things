-- Create Database
CREATE DATABASE catalog_of_things;
DROP IF EXISTS music_albums, genres, movies, sources, authors, games;

-- Items
CREATE TABLE items(
    id VARCHAR(100) NOT NULL PRIMARY KEY,
    genre_id VARCHAR(100),
    author_id VARCHAR(100),
    label_id VARCHAR(100),
    source_id VARCHAR(100),
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id),
    FOREIGN KEY (source_id) REFERENCES sources (id),
);

-- Albums
CREATE TABLE music_albums(
    id VARCHAR(100) not null primary key,
    archived boolean,
    publish_date date,
    on_spotify boolean
);

-- Movies
CREATE TABLE movies(
    id VARCHAR(100) NOT NULL PRIMARY KEY,
    silent BOOLEAN
);

-- Games
CREATE TABLE games(
    id VARCHAR(100) NOT NULL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
)

-- Sources
CREATE TABLE sources(
    id VARCHAR(100) NOT NULL,
    name VARCHAR(255),
    PRIMARY KEY(id)
);

-- Genres
CREATE TABLE genres(
    id VARCHAR(100) not null primary key,
    name varchar(255)
);

-- Authors
CREATE TABLE authors(
    id VARCHAR(100) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY(id)
)

-- CREATE TABLE labels 
CREATE TABLE labels (
    id VARCHAR(100) NOT NULL,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

-- CREATE TABLE books 
CREATE TABLE books (
    id VARCHAR(100) NOT NULL,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(id) REFERENCES item(id)
);
