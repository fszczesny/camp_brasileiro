-- Arquivo pra adicionar as consultas que iremos criar para a etapa 2 do trabalho

-- [CASOS DE USO]
-- Listar classificação do campeonato - OK
-- Listar artilheiros -OK
-- Listar lideres em assitencias - OK
-- Listar lideres em cartões amarelos - OK
-- Listar lideres em cartões vermelhos - OK
-- Listar jogadores com maior número de partidas jogadas - OK
-- Exibe todas partidas - OK
-- Exibe todas partidas de um determinado time - OK
-- Exibe melhor visitante - TODO
-- Exibe melhor mandante - TODO
-- Exibe pior visitante - TODO
-- Exibe pior mandante - TODO
-- Consulta comissão tecnica de todos os times - TODO
-- Consulta comissão tecnica de determinado time - TODO
-- Exibe publico das partidas - OK
-- Consulta estatistica das partidas que tiveram jogadores explusos - OK
-- Exibe jogadores de determinado time no dpt médico - OK
-- Exibe número de jogadores de cada time no dpt médico - OK
-- Exibe os times que tem mais de N jogadores no dpt - OK

-- 10 consultas requeridas pela especificação do trabalho
-- Retorna nome do time e número de jogadores no DM
SELECT T.nome, count(D.nome) FROM dadosjogador D INNER JOIN "time" T ON D.id_time = T.id_time NATURAL JOIN dm GROUP BY T.id_time;

-- Retorna nome do time com mais de N = 2 jogadores no DM
SELECT T.nome FROM dadosjogador D INNER JOIN "time" T ON D.id_time = T.id_time NATURAL JOIN dm m GROUP BY T.id_time HAVING COUNT(D.nome) > 2;

-- Retorna os jogadores de determinado time no DM
SELECT DJ.nome, DP.lesao, DP.data_lesao, DP.previsao_dias FROM dm DP INNER JOIN dadosjogador DJ ON DJ.id_jogador = DP.id_jogador INNER JOIN "time" T on T.id_time = DJ.id_time WHERE t.nome = 'Grêmio';

-- Retorna os dados das partidas que tiveram jogadores expulsos
SELECT * from partida WHERE NOT EXISTS (SELECT * FROM partida NATURAL JOIN estatisticas WHERE cartoes_vermelhos_mand <> 0 OR cartoes_vermelhos_visit <> 0)

-- Retorna publico das partidas data, nome dos times e ordena por publico crescente
SELECT ES.apelido, E.publico, T1.nome, T2.nome, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN estadio ES ON ES.id_estadio = P.id_estadio INNER JOIN "time" T1 on T1.id_time = P.time_mandante INNER JOIN "time" T2 ON T2.id_time = p.time_visitante ORDER BY E..publico DESC;

-- Exibe historico de partidas
SELECT T1.nome, p.gols_mandante, T2.nome, p.gols_visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN "time" T1 on T1.id_time = P.time_mandante INNER JOIN "time" T2 ON T2.id_time = p.time_visitante ORDER BY P.data_partida asc;

-- Exibe historico de partidas de determinado time
SELECT T1.nome, p.gols_mandante, T2.nome, p.gols_visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN "time" T1 on T1.id_time = P.time_mandante INNER JOIN "time" T2 ON T2.id_time = p.time_visitante WHERE T1.nome = 'Inter' OR T2.nome = 'Inter' ORDER BY P.data_partida asc;


-- Consultas Extras para funcionalidades basicas
-- Exibe classificação do campeonato
SELECT nome, pontuacao, partidas, vitorias, empates, derrotas, cartoes_amarelos, cartoes_vermelhos, gols_pro, gols_contra from "time" ORDER BY pontuacao, vitorias, empates, gols_pro DESC;

-- Exibe classificação de artilheiros
SELECT D.nome, T.nome, D.gols from dadosjogador D INNER JOIN "time" t ON t.id_time = D.id_time ORDER BY gols DESC;

-- Exibe classificação de lider em assistencias
SELECT D.nome, T.nome, D.assistencias from dadosjogador D INNER JOIN "time" t ON t.id_time = D.id_time ORDER BY assistencias DESC;

-- Exibe jogadores punidos com artão amarelo
SELECT D.nome, T.nome, D.cartoes_amarelos from dadosjogador D INNER JOIN "time" t ON t.id_time = D.id_time ORDER BY cartoes_amarelos DESC;

-- Exibe jogadores punidos com artão vermelho
SELECT D.nome, T.nome, D.cartoes_vermelhos from dadosjogador D INNER JOIN "time" t ON t.id_time = D.id_time ORDER BY cartoes_vermelhos DESC;

-- Exibe jogadores com maior número de partidas jogadas
SELECT D.nome, T.nome, D.num_partidas from dadosjogador D INNER JOIN "time" t ON t.id_time = D.id_time ORDER BY num_partidas DESC;
