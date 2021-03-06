-- Cria estadios
INSERT into estadio VALUES(DEFAULT, 'Arena', 'Arena do Grêmio', 60540, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Beira-Rio', 'Estádio José Pinheiro Borda', 50892, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Maracanã', 'Estádio Jornalista Mário Filho', 78838, 'Rio de Janeiro', 'RJ');
INSERT into estadio VALUES(DEFAULT, 'Morumbi', 'Estádio Cícero Pompeu de Toledo', 62000, 'São Paulo', 'SP');

-- Cria times
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Grêmio', 'RS', 'azul, preto e branco', 'Porto Alegre', 1);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Inter', 'RS', 'vermelho e branco', 'Porto Alegre', 2);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Flamengo', 'RJ', 'vermelho e preto', 'Rio de Janeiro', NULL);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('São Paulo', 'SP', 'branco, vermelho e preto', 'São Paulo', 4);

-- Cria arbitros
INSERT into pessoa VALUES(10000000001, 'Marcelo de Lime Henrique', 10000000001, '1979-09-07');
INSERT into arbitro VALUES(100001, 'RJ', 10000000001);
INSERT into pessoa VALUES(11111111111, 'Raphael Claus', 11111111111, '1979-09-06');
INSERT into arbitro VALUES(111111, 'SP', 11111111111);
INSERT into pessoa VALUES(22222222222, 'Anderson Daronco', 22222222222, '1981-01-05');
INSERT into arbitro VALUES(222222, 'RS', 22222222222);
INSERT into pessoa VALUES(33333333333, 'Wilton Pereira Sampaio', 33333333333, '1981-12-28');
INSERT into arbitro VALUES(333333, 'GO', 33333333333);
INSERT into pessoa VALUES(44444444444, 'Sandro Meira Ricci', 44444444444, '1974-09-06');
INSERT into arbitro VALUES(444444, 'DF', 44444444444);
INSERT into pessoa VALUES(55555555555, 'Ana Paula Oliveira', 55555555555, '1978-01-05');
INSERT into arbitro VALUES(555555, 'SP', 55555555555);
INSERT into pessoa VALUES(66666666666, 'Salvio Spinola', 66666666666, '1968-12-28');
INSERT into arbitro VALUES(666666, 'BA', 66666666666);
INSERT into pessoa VALUES(77777777777, 'Leonardo Gacciba', 77777777777, '1978-12-28');
INSERT into arbitro VALUES(777777, 'RS', 77777777777);


-- Tecnicos
INSERT into pessoa VALUES(88888888888, 'Tiago Nunes', 88888888888, '1980-09-15');
INSERT into futebolista (id_pessoa, id_time) VALUES(88888888888, 1);
INSERT into tecnico (id_futebolista) VALUES(1);
INSERT into pessoa VALUES(99999999999, 'Miguel Angel Ramirez', 99999999999, '1984-10-23');
INSERT into futebolista (id_pessoa, id_time) VALUES(99999999999, 2);
INSERT into tecnico (id_futebolista) VALUES(2);
INSERT into pessoa VALUES(11111122222, 'Rogério Ceni', 11111122222, '1977-07-27');
INSERT into futebolista (id_pessoa, id_time) VALUES(11111122222, 3);
INSERT into tecnico (id_futebolista) VALUES(3);
INSERT into pessoa VALUES(11111133333, 'Crespo', 11111133333, '1987-08-25');
INSERT into futebolista (id_pessoa, id_time) VALUES(11111133333, 4);
INSERT into tecnico (id_futebolista) VALUES(4);

-- Auxiliares
INSERT into pessoa VALUES(11111144444, 'Evandro Fornari', 11111144444, '1964-06-10');
INSERT into futebolista (id_pessoa, id_time) VALUES(11111144444, 1);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(5, 1);
INSERT into pessoa VALUES(11111155555, 'Anselmi', 11111155555, '1963-11-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(11111155555, 2);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(6, 2);
INSERT into pessoa VALUES(11111166666, 'Charles Hembert', 11111166666, '1974-07-12');
INSERT into futebolista (id_pessoa, id_time) VALUES(11111166666, 3);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(7, 3);
INSERT into pessoa VALUES(11111177777, 'Alejandro Kohan', 11111177777, '1975-07-12');
INSERT into futebolista (id_pessoa, id_time) VALUES(11111177777, 4);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(8, 4);

--Jogadores

-- Grêmio
INSERT into pessoa VALUES(12222222222, 'Breno', 12222222222, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(12222222222, 1);
INSERT into jogador (id_futebolista) VALUES(9);
INSERT into pessoa VALUES(13333333333, 'Rafinha', 13333333333, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(13333333333, 1);
INSERT into jogador (id_futebolista) VALUES(10);
INSERT into pessoa VALUES(14444444444, 'Walter Kannemann', 14444444444, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(14444444444, 1);
INSERT into jogador (id_futebolista) VALUES(11);
INSERT into pessoa VALUES(15555555555, 'Pedro Geromel', 15555555555, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(15555555555, 1);
INSERT into jogador (id_futebolista) VALUES(12);
INSERT into pessoa VALUES(16666666666, 'Cortez', 16666666666, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(16666666666, 1);
INSERT into jogador (id_futebolista) VALUES(13);
INSERT into pessoa VALUES(17777777777, 'Rafael Santos', 17777777777, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(17777777777, 1);
INSERT into jogador (id_futebolista) VALUES(14);
INSERT into pessoa VALUES(18888888888, 'Matheus Henrique', 18888888888, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(18888888888, 1);
INSERT into jogador (id_futebolista) VALUES(15);
INSERT into pessoa VALUES(19999999999, 'Pinares', 19999999999, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(19999999999, 1);
INSERT into jogador (id_futebolista) VALUES(16);
INSERT into pessoa VALUES(11222222222, 'Ferreirinha', 11222222222, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(11222222222, 1);
INSERT into jogador (id_futebolista) VALUES(17);
INSERT into pessoa VALUES(11333333333, 'Alisson', 11333333333, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(11333333333, 1);
INSERT into jogador (id_futebolista) VALUES(18);
INSERT into pessoa VALUES(11444444444, 'Diego Souza', 11444444444, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(11444444444, 1);
INSERT into jogador (id_futebolista) VALUES(19);
INSERT into pessoa VALUES(11555555555, 'Rodriguez', 11555555555, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(11555555555, 1);
INSERT into jogador (id_futebolista) VALUES(20);

-- Inter
INSERT into pessoa VALUES(22222222221, 'Danilo Fernandes', 22222222221, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(22222222221, 2);
INSERT into jogador (id_futebolista) VALUES(21);
INSERT into pessoa VALUES(23333333333, 'Heitor', 23333333333, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(23333333333, 2);
INSERT into jogador (id_futebolista) VALUES(22);
INSERT into pessoa VALUES(24444444444, 'Zé Gabriel', 24444444444, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(24444444444, 2);
INSERT into jogador (id_futebolista) VALUES(23);
INSERT into pessoa VALUES(25555555555, 'Victor Cuesta', 25555555555, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(25555555555, 2);
INSERT into jogador (id_futebolista) VALUES(24);
INSERT into pessoa VALUES(26666666666, 'Moises', 26666666666, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(26666666666, 2);
INSERT into jogador (id_futebolista) VALUES(25);
INSERT into pessoa VALUES(27777777777, 'Rodrigo Dourado', 27777777777, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(27777777777, 2);
INSERT into jogador (id_futebolista) VALUES(26);
INSERT into pessoa VALUES(28888888888, 'Edenilson', 28888888888, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(28888888888, 2);
INSERT into jogador (id_futebolista) VALUES(27);
INSERT into pessoa VALUES(29999999999, 'Taison', 29999999999, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(29999999999, 2);
INSERT into jogador (id_futebolista) VALUES(28);
INSERT into pessoa VALUES(22222222211, 'Palacios', 22222222211, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(22222222211, 2);
INSERT into jogador (id_futebolista) VALUES(29);
INSERT into pessoa VALUES(22333333333, 'Thiago Galhardo', 22333333333, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(22333333333, 2);
INSERT into jogador (id_futebolista) VALUES(30);
INSERT into pessoa VALUES(22444444444, 'Yuri Alberto', 22444444444, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(22444444444, 2);
INSERT into jogador (id_futebolista) VALUES(31);
INSERT into pessoa VALUES(22555555555, 'Rodrigo Moledo', 22555555555, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(22555555555, 2);
INSERT into jogador (id_futebolista) VALUES(32);

-- Flamengo
INSERT into pessoa VALUES(32222222222, 'Diego Alves', 32222222222, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(32222222222, 3);
INSERT into jogador (id_futebolista) VALUES(33);
INSERT into pessoa VALUES(33333333331, 'Isla', 33333333331, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(33333333331, 3);
INSERT into jogador (id_futebolista) VALUES(34);
INSERT into pessoa VALUES(34444444444, 'Gustavo Henrique', 34444444444, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(34444444444, 3);
INSERT into jogador (id_futebolista) VALUES(35);
INSERT into pessoa VALUES(35555555555, 'Rodrigo Caio', 35555555555, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(35555555555, 3);
INSERT into jogador (id_futebolista) VALUES(36);
INSERT into pessoa VALUES(36666666666, 'Filipe Luis', 36666666666, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(36666666666, 3);
INSERT into jogador (id_futebolista) VALUES(37);
INSERT into pessoa VALUES(37777777777, 'Gerson', 37777777777, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(37777777777, 3);
INSERT into jogador (id_futebolista) VALUES(38);
INSERT into pessoa VALUES(38888888888, 'Rodrigo Arão', 38888888888, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(38888888888, 3);
INSERT into jogador (id_futebolista) VALUES(39);
INSERT into pessoa VALUES(39999999999, 'Everton Ribeiro', 39999999999, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(39999999999, 3);
INSERT into jogador (id_futebolista) VALUES(40);
INSERT into pessoa VALUES(33222222222, 'Arrascaeta', 33222222222, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(33222222222, 3);
INSERT into jogador (id_futebolista) VALUES(41);
INSERT into pessoa VALUES(33333333311, 'Bruno Henrique', 33333333311, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(33333333311, 3);
INSERT into jogador (id_futebolista) VALUES(42);
INSERT into pessoa VALUES(33444444444, 'Gabriel', 33444444444, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(33444444444, 3);
INSERT into jogador (id_futebolista) VALUES(43);

-- São Paulo
INSERT into pessoa VALUES(42222222222, 'Tiago Volpi', 42222222222, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(42222222222, 4);
INSERT into jogador (id_futebolista) VALUES(44);
INSERT into pessoa VALUES(43333333333, 'Reinaldo', 43333333333, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(43333333333, 4);
INSERT into jogador (id_futebolista) VALUES(45);
INSERT into pessoa VALUES(44444444441, 'Arboleta', 44444444441, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(44444444441, 4);
INSERT into jogador (id_futebolista) VALUES(46);
INSERT into pessoa VALUES(45555555555, 'Miranda', 45555555555, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(45555555555, 4);
INSERT into jogador (id_futebolista) VALUES(47);
INSERT into pessoa VALUES(46666666666, 'Daniel Alves', 46666666666, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(46666666666, 4);
INSERT into jogador (id_futebolista) VALUES(48);
INSERT into pessoa VALUES(47777777777, 'Luan', 47777777777, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(47777777777, 4);
INSERT into jogador (id_futebolista) VALUES(49);
INSERT into pessoa VALUES(48888888888, 'Liziero', 48888888888, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(48888888888, 4);
INSERT into jogador (id_futebolista) VALUES(50);
INSERT into pessoa VALUES(49999999999, 'Benitez', 49999999999, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(49999999999, 4);
INSERT into jogador (id_futebolista) VALUES(51);
INSERT into pessoa VALUES(44222222222, 'Pablo', 44222222222, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(44222222222, 4);
INSERT into jogador (id_futebolista) VALUES(52);
INSERT into pessoa VALUES(44333333333, 'Luciano', 44333333333, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(44333333333, 4);
INSERT into jogador (id_futebolista) VALUES(53);
INSERT into pessoa VALUES(44444444411, 'Eder', 44444444411, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(44444444411, 4);
INSERT into jogador (id_futebolista) VALUES(54);
INSERT into pessoa VALUES(44555555555, 'Leo', 44555555555, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(44555555555, 4);
INSERT into jogador (id_futebolista) VALUES(55);
INSERT into pessoa VALUES(44666666666, 'Helinho', 44666666666, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(44666666666, 4);
INSERT into jogador (id_futebolista) VALUES(56);

-- Dpt Médico
INSERT into dm VALUES(DEFAULT, 'Músculo adutor da coxa esquerda', '2020-09-30', 120, 4);
INSERT into dm VALUES(DEFAULT, 'Quebra do quinto metatarso', '2019-07-02', 50, 24);
INSERT into dm VALUES(DEFAULT, 'Quebra do quinto metatarso', '2019-07-02', 150, 47);
INSERT into dm VALUES(DEFAULT, 'Rompimento do tendão patelar do joelho direito', '2016-05-28', 500, 48);

-- Partidas

-- Rodada 1:
-- Inter x Gremio (2x1)
INSERT into partida VALUES(DEFAULT, '2020-04-09', '16:00:00', 2, 1, 2, 1, 2, 100001, 111111, 222222, 444444);
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 1 ,cartoes_amarelos = cartoes_amarelos + 3 , cartoes_vermelhos = cartoes_vermelhos + 1 WHERE id_time = 2;
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 2 ,cartoes_amarelos = cartoes_amarelos + 3 , cartoes_vermelhos = cartoes_vermelhos + 1 WHERE id_time = 1;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 19;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 22;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 11;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 19;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 2;
UPDATE futebolista SET cartoes_amarelos = cartoes_amarelos + 1 WHERE id_futebolista = 21;
UPDATE futebolista SET cartoes_amarelos_acum = cartoes_amarelos_acum + 1 WHERE id_futebolista = 21;
UPDATE futebolista SET cartoes_amarelos = cartoes_amarelos + 1 WHERE id_futebolista = 24;
UPDATE futebolista SET cartoes_amarelos_acum = cartoes_amarelos_acum + 1 WHERE id_futebolista = 24;
UPDATE futebolista SET cartoes_amarelos = cartoes_amarelos + 1 WHERE id_futebolista = 27;
UPDATE futebolista SET cartoes_amarelos_acum = cartoes_amarelos_acum + 1 WHERE id_futebolista = 27;
UPDATE futebolista SET cartoes_amarelos = cartoes_amarelos + 1 WHERE id_futebolista = 9;
UPDATE futebolista SET cartoes_amarelos_acum = cartoes_amarelos_acum + 1 WHERE id_futebolista = 21;
UPDATE futebolista SET cartoes_amarelos = cartoes_amarelos + 1 WHERE id_futebolista = 10;
UPDATE futebolista SET cartoes_amarelos_acum = cartoes_amarelos_acum + 1 WHERE id_futebolista = 21;
UPDATE futebolista SET cartoes_amarelos = cartoes_amarelos + 1 WHERE id_futebolista = 14;
UPDATE futebolista SET cartoes_amarelos_acum = cartoes_amarelos_acum + 1 WHERE id_futebolista = 21;
UPDATE futebolista SET cartoes_vermelhos = cartoes_vermelhos + 1 WHERE id_futebolista = 25;
UPDATE futebolista SET jogos_suspenso = jogos_suspenso + 1 WHERE id_futebolista = 25;
UPDATE futebolista SET cartoes_vermelhos = cartoes_vermelhos + 1 WHERE id_futebolista = 13;
UPDATE futebolista SET jogos_suspenso = jogos_suspenso + 1 WHERE id_futebolista = 13;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 3, 3, 1, 1, 1, 1, 4, 5, 50000, 1);
-- Flamengo x São Paulo (4x1)
INSERT into partida VALUES(DEFAULT, '2020-04-09', '17:00:00', 4, 1, 3, 3, 3, 333333, 555555, 666666, 777777);
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 4 , gols_contra = gols_contra + 1  WHERE id_time = 3;
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 4 WHERE id_time = 4;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 35;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 34;
UPDATE jogador SET assistencias = assistencias + 2 WHERE id_jogador = 34;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 32;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 46;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 6000, 2);

-- Rodada 2:
-- Inter x Flamengo (2x2)
INSERT into partida VALUES(DEFAULT, '2020-04-19', '18:00:00', 2, 2, 2, 3, 2, 111111, 100001, 222222, 444444);
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 2 WHERE id_time = 2;
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 2 WHERE id_time = 3;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 35;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 19;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 22;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 19;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 32;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 7000, 3);
-- Grêmio x São Paulo (1x2)
INSERT into partida VALUES(DEFAULT, '2020-04-19', '19:00:00', 1, 2, 2, 4, 1, 555555, 333333, 666666, 777777);
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 2 WHERE id_time = 1;
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 1 WHERE id_time = 4;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 11;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 46;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 8000, 4);

-- Rodada 3:
-- Inter x São Paulo (1x1)
INSERT into partida VALUES(DEFAULT, '2020-04-29', '20:00:00', 1, 1, 2, 4, 2, 222222, 111111, 100001, 444444);
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 1 WHERE id_time = 2;
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 1 WHERE id_time = 4;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 22;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 45;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 9000, 5);
-- Grêmio x Flamengo (2x4)
INSERT into partida VALUES(DEFAULT, '2020-04-29', '21:00:00', 2, 4, 1, 3, 1, 666666, 333333, 555555, 777777);
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 4 WHERE id_time = 1;
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 4 , gols_contra = gols_contra + 2 WHERE id_time = 3;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 35;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 34;
UPDATE jogador SET assistencias = assistencias + 2 WHERE id_jogador = 34;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 32;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 11;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 10;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 10000, 6);

-- Rodada 4:
-- Gremio x Inter (1x1)
INSERT into partida VALUES(DEFAULT, '2020-05-09', '22:00:00', 1, 1, 1, 2, 1, 100001, 111111, 222222, 444444);
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 1 WHERE id_time = 1;
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 1 WHERE id_time = 2;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 21;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 9;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 19;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 2;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 60000, 7);
-- São Paulo x Flamengo (2x1)
INSERT into partida VALUES(DEFAULT, '2020-05-09', '10:00:00', 2, 1, 3, 4, 4, 777777, 666666, 555555, 333333);
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 1 WHERE id_time = 4;
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 2 WHERE id_time = 3;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 35;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 34;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 32;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 44;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 11000, 8);

-- Rodada 5:
-- Flamengo x Inter (2x1)
INSERT into partida VALUES(DEFAULT, '2020-05-19', '11:00:00', 2, 1, 3, 2, 3, 444444, 111111, 222222, 100001);
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 2 , gols_contra = gols_contra + 1 WHERE id_time = 3;
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 2 WHERE id_time = 2;
UPDATE jogador SET gols = gols + 2 WHERE id_jogador = 33;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 22;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 12000, 9);
-- São Paulo x Grêmio (0x0)
INSERT into partida VALUES(DEFAULT, '2020-05-19', '14:00:00', 0, 0, 4, 1, 4, 555555, 333333, 666666, 777777);
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 WHERE id_time = 4;
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 WHERE id_time = 1;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 13000, 10);

-- Rodada 6:
-- São Paulo x Inter (1x5)
INSERT into partida VALUES(DEFAULT, '2020-05-29', '15:00:00', 1, 5, 4, 2, 4, 222222, 111111, 100001, 444444);
UPDATE Time SET partidas = partidas + 1, derrotas = derrotas + 1, gols_pro = gols_pro + 1 , gols_contra = gols_contra + 5 WHERE id_time = 4;
UPDATE Time SET pontuacao = pontuacao + 3, partidas = partidas + 1, vitorias = vitorias + 1 ,gols_pro = gols_pro + 5 , gols_contra = gols_contra + 1 WHERE id_time = 2;
UPDATE jogador SET gols = gols + 4 WHERE id_jogador = 23;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 19;
UPDATE jogador SET assistencias = assistencias + 2 WHERE id_jogador = 19;
UPDATE jogador SET assistencias = assistencias + 1 WHERE id_jogador = 23;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 41;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 14000, 11);
-- Flamengo x Grêmio (1x1)
INSERT into partida VALUES(DEFAULT, '2020-05-29', '08:00:00', 1, 1, 3, 1, 3, 333333, 555555, 666666, 777777);
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 1 WHERE id_time = 3;
UPDATE Time SET pontuacao = pontuacao + 1, partidas = partidas + 1, empates = empates + 1 ,gols_pro = gols_pro + 1 , gols_contra = gols_contra + 1 WHERE id_time = 1;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 35;
UPDATE jogador SET gols = gols + 1 WHERE id_jogador = 11;
INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 0, 0, 0, 0, 1, 1, 4, 5, 15000, 12);
