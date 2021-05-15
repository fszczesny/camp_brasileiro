INSERT into estadio VALUES(DEFAULT, 'Arena', 'Arena do Grêmio', 60540, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Beira-Rio', 'Estádio José Pinheiro Borda', 50892, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Maracanã', 'Estádio Jornalista Mário Filho', 78838, 'Rio de Janeiro', 'RJ');

INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Grêmio', 'RS', 'azul, preto e branco', 'Porto Alegre', 1);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Inter', 'RS', 'vermelho e branco', 'Porto Alegre', 2);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Flamengo', 'RJ', 'vermelho e preto', 'Rio de Janeiro', NULL);

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
-- Tecnicos
INSERT into pessoa VALUES(01234567891, 'Renato Portaluppi', 123456, '1962-09-09');
INSERT into futebolista (id_pessoa, id_time) VALUES(01234567891, 1);
INSERT into tecnico (id_futebolista) VALUES(4);
INSERT into pessoa VALUES(20080995047, 'Luiz Felipe Scolari', 333333, '1948-11-09');
INSERT into futebolista (id_pessoa, id_time) VALUES(20080995047, 2);
INSERT into tecnico (id_futebolista) VALUES(5);
INSERT into pessoa VALUES(92572841070, 'Adenor Leonardo Bachi', 444444, '1951-05-25');
INSERT into futebolista (id_pessoa, id_time) VALUES(92572841070, 3);
INSERT into tecnico (id_futebolista) VALUES(6);
-- Auxiliares
INSERT into pessoa VALUES(98765432102, 'Alexandre Mendes', 090807, '1964-06-10');
INSERT into futebolista (id_pessoa, id_time) VALUES(98765432102, 1);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(7, 1);
INSERT into pessoa VALUES(06606093040, 'Paulo Turra', 666666, '1963-11-14');
INSERT into futebolista (id_pessoa, id_time) VALUES(06606093040, 1);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(8, 2);
INSERT into pessoa VALUES(36577317097, 'Cleber Xavier', 555555, '1974-07-12');
INSERT into futebolista (id_pessoa, id_time) VALUES(36577317097, 1);
INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(9, 3);
-- Árbitros
INSERT into pessoa VALUES(56789012345, 'Raphael Claus', 333555, '1979-09-06');
INSERT into arbitro VALUES(123456, 'SP', 56789012345);
INSERT into pessoa VALUES(53111030008, 'Anderson Daronco', 777777, '1981-01-05');
INSERT into arbitro VALUES(654321, 'RS', 53111030008);
INSERT into pessoa VALUES(22651092070, 'Wilton Pereira Sampaio', 888888, '1981-12-28');
INSERT into arbitro VALUES(121212, 'GO', 22651092070);

INSERT into dm VALUES(DEFAULT, 'Músculo adutor da coxa esquerda', '2020-09-30', 120, 1);
INSERT into dm VALUES(DEFAULT, 'Quebra do quinto metatarso', '2019-07-02', 50, 2);
INSERT into dm VALUES(DEFAULT, 'Rompimento do tendão patelar do joelho direito', '2016-05-28', 500, 3);

INSERT into partida VALUES(DEFAULT, '2015-08-09', '16:00:00', 5, 0, 1, 2, 1, 123456, 654321, 121212, NULL); -- GrêmioxInter
INSERT into partida VALUES(DEFAULT, '2020-07-05', '18:30:00', 2, 1, 1, 3, 1, 121212, 654321, 123456, NULL); -- GrêmioxFlamengo
INSERT into partida VALUES(DEFAULT, '2019-06-30', '21:30:00', 3, 0, 3, 2, 3, 654321, 121212, 123456, NULL); -- FlamengoxInter

INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 2, 4, 0, 0, 1, 1, 4, 5, 6000, 1);
INSERT into estatisticas (id_partida) VALUES(2);
INSERT into estatisticas (id_partida) VALUES(3);
