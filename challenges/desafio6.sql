SELECT
	MIN(p.price) AS faturamento_minimo,
	MAX(p.price) AS faturamento_maximo,
	ROUND(AVG(p.price), 2) AS faturamento_medio,
	SUM(p.price) AS faturamento_total
FROM SpotifyClone.Planos AS p
INNER JOIN SpotifyClone.Usuário AS u ON p.plan_id = u.plan_id;
