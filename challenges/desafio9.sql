SELECT
	COUNT(user_id) AS musicas_no_historico
FROM SpotifyClone.Histórico
WHERE user_id = 1;
