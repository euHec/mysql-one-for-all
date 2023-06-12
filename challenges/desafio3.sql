SELECT
	user.name AS pessoa_usuaria,
  COUNT(history.song_id) AS musicas_ouvidas,
  ROUND(SUM(songs.duration_seconds)/60, 2) AS total_minutos
FROM SpotifyClone.Usuário AS user
INNER JOIN SpotifyClone.Histórico AS history ON user.user_id = history.user_id
INNER JOIN SpotifyClone.Canções AS songs ON history.song_id = songs.song_id
GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria;