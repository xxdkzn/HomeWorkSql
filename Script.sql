-- Создание таблицы "genres"
CREATE TABLE genres (
id VARCHAR PRIMARY KEY,
name VARCHAR
);

-- Добавление 3 жанров
INSERT INTO genres (id, name) VALUES
('1', 'Drill'),
('2', 'Rap'),
('3', 'Pop');

-- Создание таблицы "performers"
CREATE TABLE performers (
id VARCHAR PRIMARY KEY,
pseudonym VARCHAR,
genreld VARCHAR,
FOREIGN KEY (genreld) REFERENCES genres(id)
);

-- Добавление 4 исполнителей
INSERT INTO performers (id, pseudonym, genreld) VALUES
('1', 'Central Cee', '1'),
('2', 'Lil Uzi Vert', '2'),
('3', 'Chief Keef', '3'),
('4', 'Travis Scott', '1');

-- Создание таблицы "performers_albums"
CREATE TABLE performers_albums (
performer_id VARCHAR,
album_id VARCHAR,
FOREIGN KEY (performer_id) REFERENCES performers(id),
FOREIGN KEY (album_id) REFERENCES albums(id),
PRIMARY KEY (performer_id, album_id)
);

-- Создание таблицы "Music_Website_ERD"
CREATE TABLE music_website_erd (
string VARCHAR,
pk VARCHAR
);

-- Добавление 4 сборников
INSERT INTO music_website_erd (string, pk) VALUES
('Сборник 1', '1'),
('Сборник 2', '2'),
('Сборник 3', '3'),
('Сборник 4', '4');

-- Создание таблицы "albums"
CREATE TABLE albums (
id VARCHAR PRIMARY KEY,
title VARCHAR,
release_year INTEGER CHECK (release_year >= 1900),
artistld VARCHAR
);

-- Добавление 3 альбомов
INSERT INTO albums (id, title, release_year, artistld) VALUES
('1', 'Utopia', 2023, '4'),
('2', 'Wild West', 2022, '3'),
('3', 'Pink Tape', 2024, '2');

-- Создание таблицы "tracks"
CREATE TABLE tracks (
id VARCHAR PRIMARY KEY,
name VARCHAR,
duration INTEGER CHECK (duration > 0),
albumld VARCHAR
);

-- Добавление 6 треков
INSERT INTO tracks (id, name, duration, albumld) VALUES
('1', 'Doja', 180, '1'),
('2', 'Sprinter', 210, '2'),
('3', 'Meltdown', 240, '1'),
('4', 'Sirens', 195, '3'),
('5', 'Love Sosa', 165, '2'),
('6', 'Faneto', 220, '2');

-- Создание таблицы "performers_genres"
CREATE TABLE performers_genres (
performer_id VARCHAR,
genre_id VARCHAR,
FOREIGN KEY (performer_id) REFERENCES performers(id),
FOREIGN KEY (genre_id) REFERENCES genres(id),
PRIMARY KEY (performer_id, genre_id)
);

-- Заполнение таблицы связей исполнителей с жанрами
INSERT INTO performers_genres (performer_id, genre_id) VALUES
('1', '1'),
('2', '2'),
('3', '1'),
('4', '2'),
('4', '3');

-- Создание таблицы "albums_tracks"
CREATE TABLE albums_tracks (
album_id VARCHAR,
track_id VARCHAR,
FOREIGN KEY (album_id) REFERENCES albums(id),
FOREIGN KEY (track_id) REFERENCES tracks(id),
PRIMARY KEY (album_id, track_id)
);

-- Заполнение таблицы связей альбомов с треками
INSERT INTO albums_tracks (album_id, track_id) VALUES
('1', '1'),
('1', '3'),
('2', '2'),
('2', '5'),
('2', '6'),
('3', '4');

-- Заполнение таблицы связей исполнителей с альбомами
INSERT INTO performers_albums (performer_id, album_id) VALUES
('3', '2'),
('2', '3'),
('4', '1'),
('1', '2');