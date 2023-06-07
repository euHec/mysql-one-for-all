SELECT
	(SELECT COUNT(*) FROM SpotifyClone.Canções) AS cancoes,
	(SELECT COUNT(*) FROM SpotifyClone.Artista) AS artistas,
    (SELECT COUNT(*)FROM SpotifyClone.Album) AS albuns;