-- Название и продолжительность самого длительного трека:
SELECT name, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут:
SELECT name
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно:
SELECT string
FROM music_website_erd
WHERE pk IN (
SELECT pk
FROM music_website_erd
WHERE pk BETWEEN '1' AND '4'
);

-- Исполнители, чьё имя состоит из одного слова:
SELECT pseudonym
FROM performers
WHERE pseudonym NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»:
SELECT name
FROM tracks
WHERE name LIKE '%мой%' OR name LIKE '%my%';