CREATE TABLE book (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(100),
    cover_state VARCHAR(4),
    publish_date DATE,
    archived BOOLEAN,
    genre_id INT REFERENCES genre (id),
    source_id INT REFERENCES source (id),
    author_id INT REFERENCES author (id),
    label_id INT REFERENCES label (id),
);