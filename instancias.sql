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

INSERT into partida VALUES(DEFAULT, '2015-08-09', '16:00:00', 5, 0, 1, 2, 1, 123456, 654321, 121212, NULL); -- GrêmioxInter
INSERT into partida VALUES(DEFAULT, '2020-07-05', '18:30:00', 2, 1, 1, 3, 1, 121212, 654321, 123456, NULL); -- GrêmioxFlamengo
INSERT into partida VALUES(DEFAULT, '2019-06-30', '21:30:00', 3, 0, 3, 2, 3, 654321, 121212, 123456, NULL); -- FlamengoxInter

INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 2, 4, 0, 0, 1, 1, 4, 5, 6000, 1);
INSERT into estatisticas (id_partida) VALUES(2);
INSERT into estatisticas (id_partida) VALUES(3);
