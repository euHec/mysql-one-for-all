SELECT
	artist.name AS artista,
	album.name AS album
FROM SpotifyClone.Artista AS artist
INNER JOIN SpotifyClone.Album AS album ON artist.artist_id = album.artist_id
where artist.name = 'Elis Regina'
ORDER BY album ASC;
