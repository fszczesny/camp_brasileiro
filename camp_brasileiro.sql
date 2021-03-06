drop table if EXISTS estatisticas;
drop table if EXISTS partida;
drop table if EXISTS dm;
drop table if EXISTS auxiliartecnico;
drop table if EXISTS tecnico;
drop table if EXISTS jogador;
drop table if EXISTS arbitro;
drop table if EXISTS futebolista;
drop table if EXISTS pessoa;
drop table if EXISTS "time";
drop table if EXISTS estadio;

CREATE TABLE Estadio 
( 
 id_estadio SERIAL not NULL PRIMARY KEY,
 apelido VARCHAR(40) NOT NULL,
 nome VARCHAR(40) NOT NULL,  
 capacidade Integer not NULL,
 cidade VARCHAR(40) not NULL,
 uf char(2) not NULL
); 

CREATE TABLE Time
( 
 id_time SERIAL not NULL PRIMARY KEY,
 nome VARCHAR(40) NOT NULL UNIQUE,  
 uf char(2) not NULL,  
 cores varchar(30) not NULL,  
 cidade varchar(40) not NULL,  
 pontuacao SMALLINT not NULL DEFAULT 0,  
 partidas SMALLINT not NULL DEFAULT 0,  
 gols_contra SMALLINT not NULL DEFAULT 0,  
 gols_pro SMALLINT not NULL DEFAULT 0,  
 vitorias SMALLINT not NULL DEFAULT 0,  
 cartoes_vermelhos SMALLINT not NULL DEFAULT 0,  
 derrotas SMALLINT not NULL DEFAULT 0,  
 empates SMALLINT not NULL DEFAULT 0,  
 cartoes_amarelos SMALLINT not NULL DEFAULT 0, 
 id_estadio INTEGER,
 FOREIGN KEY(id_estadio) REFERENCES Estadio (id_estadio)
 	on DELETE set NULL
); 

CREATE TABLE Pessoa 
( 
 cpf BIGINT not NULL PRIMARY KEY,
 nome varchar(50) not NULL,
 rg BIGINT not NULL UNIQUE,  
 data_nasc date NOT NULL  
); 

CREATE TABLE Futebolista 
( 
 id_futebolista SERIAL not NULL PRIMARY KEY,
 cartoes_amarelos SMALLINT NOT NULL DEFAULT 0,  
 cartoes_vermelhos SMALLINT NOT NULL DEFAULT 0,  
 jogos_suspenso SMALLINT NOT NULL DEFAULT 0,  
 cartoes_amarelos_acum SMALLINT NOT NULL DEFAULT 0,  
 id_pessoa BIGINT NOT NULL,  
 id_time Integer,  
 FOREIGN KEY(id_pessoa) REFERENCES Pessoa (cpf)
 	on DELETE CASCADE,
 FOREIGN KEY(id_time) REFERENCES Time (id_time)
 	on DELETE set NULL
); 

CREATE TABLE Arbitro 
( 
 cod_comprovante_curso Integer NOT NULL PRIMARY KEY, 
 estado CHAR(2) NOT NULL,   
 id_pessoa BIGINT NOT NULL,  
 FOREIGN KEY(id_pessoa) REFERENCES Pessoa (cpf)
 	ON DELETE CASCADE
); 

CREATE TABLE Jogador 
( 
 id_jogador serial not NULL PRIMARY KEY,
 num_partidas SMALLINT not NULL DEFAULT 0,  
 assistencias SMALLINT not NULL DEFAULT 0,  
 gols SMALLINT not NULL DEFAULT 0,  
 id_futebolista Integer not NULL,  
 FOREIGN KEY(id_futebolista) REFERENCES Futebolista (id_futebolista)
  	on DELETE CASCADE
);

CREATE TABLE Tecnico 
( 
 id_tecnico serial not NULL PRIMARY key,
 id_futebolista Integer not NULL,
 FOREIGN KEY(id_futebolista) REFERENCES Futebolista (id_futebolista)
 	on DELETE CASCADE
); 

CREATE TABLE AuxiliarTecnico 
( 
 id_auxiliar_tecnico SERIAL not NULL PRIMARY KEY,
 id_futebolista Integer not NULL,
 id_tecnico Integer not NULL,
 FOREIGN KEY(id_futebolista) REFERENCES Futebolista (id_futebolista)
 	on DELETE CASCADE,
 FOREIGN KEY(id_tecnico) REFERENCES Tecnico (id_tecnico)
 	on DELETE CASCADE
); 

CREATE TABLE DM 
( 
 id_dm SERIAL not NULL PRIMARY KEY,
 lesao VARCHAR(60) NOT NULL,  
 data_lesao DATE NOT NULL,  
 previsao_dias SMALLINT,  
 id_jogador Integer not NULL,  
 FOREIGN KEY(id_jogador) REFERENCES Jogador (id_jogador)
 	on DELETE CASCADE
); 

CREATE TABLE Partida 
( 
 id_partida SERIAL not NULL PRIMARY KEY,
 data_partida DATE not NULL,  
 hora time not NULL,  
 gols_mandante SMALLINT not NULL DEFAULT 0,  
 gols_visitante SMALLINT not NULL DEFAULT 0,  
 time_mandante INTEGER not NULL,
 time_visitante INTEGER not NULL,
 id_estadio Integer not NULL,   
 id_arbitro INTEger not NULL,
 id_assistente_1 INTEGER not NULL,
 id_assistente_2 INTEGER not NULL,
 id_quarto_arbitro INTEGER,
 UNIQUE(data_partida, hora, id_estadio),
 UNIQUE(time_mandante, data_partida, hora),
 UNIQUE(time_visitante, data_partida, hora),
 FOREIGN KEY(time_mandante) REFERENCES Time (id_time),
 FOREIGN KEY(time_visitante) REFERENCES Time (id_time),
 FOREIGN KEY(id_estadio) REFERENCES Estadio (id_estadio),
 FOREIGN KEY(id_arbitro) REFERENCES Arbitro (cod_comprovante_curso),
 FOREIGN KEY(id_assistente_1) REFERENCES Arbitro (cod_comprovante_curso),
 FOREIGN KEY(id_assistente_2) REFERENCES Arbitro (cod_comprovante_curso),
 FOREIGN KEY(id_quarto_arbitro) REFERENCES Arbitro (cod_comprovante_curso)
); 

CREATE TABLE Estatisticas 
( 
 id_estatistica serial not NULL PRIMARY key,
 chutes_mand SMALLINT not NULL DEFAULT 0,  
 chute_visit SMALLINT not NULL DEFAULT 0,  
 chutes_a_gol_mand SMALLINT not NULL DEFAULT 0,  
 chutes_a_gol_visit SMALLINT not NULL DEFAULT 0,  
 posse_de_bola_mand SMALLINT not NULL DEFAULT 50,  
 posse_de_bola_visit SMALLINT not NULL DEFAULT 50,  
 num_passes_mand SMALLINT not NULL DEFAULT 0,  
 num_passes_visit SMALLINT not NULL DEFAULT 0,  
 precisao_passe_mand SMALLINT not NULL DEFAULT 0,  
 precisao_passe_visit SMALLINT not NULL DEFAULT 0,  
 num_faltas_mand SMALLINT not NULL DEFAULT 0,  
 num_faltas_visit SMALLINT not NULL DEFAULT 0,  
 cartoes_amarelos_visit SMALLINT not NULL DEFAULT 0,  
 cartoes_amarelos_mand SMALLINT not NULL DEFAULT 0,  
 cartoes_vermelhos_mand SMALLINT not NULL DEFAULT 0,  
 cartoes_vermelhos_visit SMALLINT not NULL DEFAULT 0,  
 imped_mand SMALLINT not NULL DEFAULT 0,  
 imped_visit SMALLINT not NULL DEFAULT 0,  
 escanteio_mand SMALLINT not NULL DEFAULT 0,  
 escanteio_visit SMALLINT not NULL DEFAULT 0,  
 id_partida INTEGER not NULL,
 FOREIGN KEY(id_partida) REFERENCES Partida (id_partida)
 	on DELETE CASCADE
); 


INSERT into estadio VALUES(DEFAULT, 'Arena', 'Arena do Gr??mio', 60540, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Beira-Rio', 'Est??dio Jos?? Pinheiro Borda', 50892, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Maracan??', 'Est??dio Jornalista M??rio Filho', 78838, 'Rio de Janeiro', 'RJ');

INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Gr??mio', 'RS', 'azul, preto e branco', 'Porto Alegre', 1);
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
-- ??rbitros
INSERT into pessoa VALUES(56789012345, 'Raphael Claus', 333555, '1979-09-06');
INSERT into arbitro VALUES(123456, 'SP', 56789012345);
INSERT into pessoa VALUES(53111030008, 'Anderson Daronco', 777777, '1981-01-05');
INSERT into arbitro VALUES(654321, 'RS', 53111030008);
INSERT into pessoa VALUES(22651092070, 'Wilton Pereira Sampaio', 888888, '1981-12-28');
INSERT into arbitro VALUES(121212, 'GO', 22651092070);

INSERT into dm VALUES(DEFAULT, 'M??sculo adutor da coxa esquerda', '2020-09-30', 120, 1);
INSERT into dm VALUES(DEFAULT, 'Quebra do quinto metatarso', '2019-07-02', 50, 2);
INSERT into dm VALUES(DEFAULT, 'Rompimento do tend??o patelar do joelho direito', '2016-05-28', 500, 3);

INSERT into partida VALUES(DEFAULT, '2015-08-09', '16:00:00', 5, 0, 1, 2, 1, 123456, 654321, 121212, NULL); -- Gr??mioxInter
INSERT into partida VALUES(DEFAULT, '2020-07-05', '18:30:00', 2, 1, 1, 3, 1, 121212, 654321, 123456, NULL); -- Gr??mioxFlamengo
INSERT into partida VALUES(DEFAULT, '2019-06-30', '21:30:00', 3, 0, 3, 2, 3, 654321, 121212, 123456, NULL); -- FlamengoxInter

INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 2, 4, 0, 0, 1, 1, 4, 5, 1);
INSERT into estatisticas (id_partida) VALUES(2);
INSERT into estatisticas (id_partida) VALUES(3);
