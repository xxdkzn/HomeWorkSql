-- Количество исполнителей в каждом жанре:
SELECT g.name, COUNT(p.id) AS performer_count
FROM performers p
JOIN genres g ON p.genreld = g.id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов:
SELECT COUNT(*) AS track_count
FROM tracks t
JOIN albums a ON t.albumld = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому:
SELECT a.title, AVG(t.duration) AS avg_duration
FROM albums a
JOIN tracks t ON a.id = t.albumld
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году:
SELECT p.pseudonym
FROM performers p
LEFT JOIN performers_albums pa ON p.id = pa.performer_id
LEFT JOIN albums a ON pa.album_id = a.id
WHERE a.release_year <> 2020 OR a.release_year IS NULL
GROUP BY p.pseudonym;

-- Названия сборников, в которых присутствует конкретный исполнитель (например, Travis Scott):
SELECT mwe.string
FROM music_website_erd mwe
JOIN albums_tracks at ON mwe.pk = at.album_id
JOIN tracks t ON at.track_id = t.id
JOIN albums a ON t.albumld = a.id
JOIN performers_albums pa ON a.id = pa.album_id
JOIN performers p ON pa.performer_id = p.id
WHERE p.pseudonym = 'Travis Scott'
GROUP BY mwe.string;