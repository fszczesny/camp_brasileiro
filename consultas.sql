-- Arquivo pra adicionar as consultas que iremos criar para a etapa 2 do trabalho

-- Retorna nome do time e número de jogadores no DM
SELECT T.nome, count(D.nome) FROM dadosjogador D INNER JOIN "time" T ON D.id_time = T.id_time NATURAL JOIN dm GROUP BY T.id_time;

-- Retorna nome do time com mais de N = 2 jogadores no DM
SELECT T.nome FROM dadosjogador D INNER JOIN "time" T ON D.id_time = T.id_time NATURAL JOIN dm m GROUP BY T.id_time HAVING COUNT(D.nome) > 2;

-- Retorna os dados das partidas que tiveram jogadores expulsos
SELECT * from partida WHERE NOT EXISTS (SELECT * FROM partida NATURAL JOIN estatisticas WHERE cartoes_vermelhos_mand <> 0 OR cartoes_vermelhos_visit <> 0)