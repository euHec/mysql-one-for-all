SELECT songs.name AS cancao, COUNT(history.song_id) AS reproducoes
FROM SpotifyClone.Canções AS songs
INNER JOIN SpotifyClone.Histórico AS history ON songs.song_id = history.song_id
GROUP BY cancao ORDER BY reproducoes DESC, cancao ASC LIMIT 2;
