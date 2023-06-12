SELECT user.name AS pessoa_usuaria, IF(MAX(YEAR(history.date)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.Usuário AS user
INNER JOIN SpotifyClone.Histórico AS history ON user.user_id = history.user_id
GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria;
