SELECT
	artist.name AS artista,
	album.name AS album,
	COUNT(followers.user_id) AS pessoas_seguidoras
FROM SpotifyClone.Artista AS artist
INNER JOIN SpotifyClone.Album AS album ON artist.artist_id = album.artist_id
INNER JOIN SpotifyClone.Seguidores AS followers ON artist.artist_id = followers.artist_id
GROUP BY artista, album ORDER BY pessoas_seguidoras DESC, artist.name ASC, album.name ASC;
