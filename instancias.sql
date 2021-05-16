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
INSERT into pessoa VALUES(12345678902, 'Diego Souza', 654321, '1985-06-17');
INSERT into futebolista (id_pessoa, id_time) VALUES(12345678902, 1);
INSERT into jogador (id_futebolista) VALUES(1);
INSERT into pessoa VALUES(97703111031, 'Pedro Geromel', 111111, '1985-09-21');
INSERT into futebolista (id_pessoa, id_time) VALUES(97703111031, 1);
INSERT into jogador (id_futebolista) VALUES(2);
INSERT into pessoa VALUES(90380154021, 'Walter Kannemann', 222222, '1991-03-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(90380154021, 1);
INSERT into jogador (id_futebolista) VALUES(3);


INSERT into dm VALUES(DEFAULT, 'Músculo adutor da coxa esquerda', '2020-09-30', 120, 1);
INSERT into dm VALUES(DEFAULT, 'Quebra do quinto metatarso', '2019-07-02', 50, 2);
INSERT into dm VALUES(DEFAULT, 'Rompimento do tendão patelar do joelho direito', '2016-05-28', 500, 3);

INSERT into partida VALUES(DEFAULT, '2015-08-09', '16:00:00', 5, 0, 1, 2, 1, 123456, 654321, 121212, NULL); -- GrêmioxInter
INSERT into partida VALUES(DEFAULT, '2020-07-05', '18:30:00', 2, 1, 1, 3, 1, 121212, 654321, 123456, NULL); -- GrêmioxFlamengo
INSERT into partida VALUES(DEFAULT, '2019-06-30', '21:30:00', 3, 0, 3, 2, 3, 654321, 121212, 123456, NULL); -- FlamengoxInter

INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 2, 4, 0, 0, 1, 1, 4, 5, 6000, 1);
INSERT into estatisticas (id_partida) VALUES(2);
INSERT into estatisticas (id_partida) VALUES(3);
