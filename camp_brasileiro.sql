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


INSERT into estadio VALUES(DEFAULT, 'Arena', 'Arena do Grêmio', 60540, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Beira-Rio', 'Estádio José Pinheiro Borda', 50892, 'Porto Alegre', 'RS');
INSERT into estadio VALUES(DEFAULT, 'Maracanã', 'Estádio Jornalista Mário Filho', 78838, 'Rio de Janeiro', 'RJ');

INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Grêmio', 'RS', 'azul, preto e branco', 'Porto Alegre', 1);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Inter', 'RS', 'vermelho e branco', 'Porto Alegre', 2);
INSERT into "time" (nome, uf, cores, cidade, id_estadio) VALUES('Flamengo', 'RJ', 'vermelho e preto', 'Rio de Janeiro', NULL);

INSERT into pessoa VALUES(012345678901, 'Renato Portaluppi', 123456, '1962-09-09');
INSERT into pessoa VALUES(123456789012, 'Diego Souza', 654321, '1985-06-17');
INSERT into pessoa VALUES(987654321012, 'Alexandre Pereira Mendes', 090807, '1964-06-10');
INSERT into pessoa VALUES(567890123456, 'Raphael Claus', 333555, '1979-09-06');

INSERT into futebolista (id_pessoa, id_time) VALUES(012345678901, 1);
INSERT into futebolista (id_pessoa, id_time) VALUES(123456789012, 1);
INSERT into futebolista (id_pessoa, id_time) VALUES(987654321012, 1);

INSERT into jogador (id_futebolista) VALUES(1);

INSERT into tecnico (id_futebolista) VALUES(2);

INSERT into auxiliartecnico (id_futebolista, id_tecnico) VALUES(3, 1);

INSERT into arbitro VALUES(123456, 'SP', 567890123456);

INSERT into dm VALUES(DEFAULT, 'Músculo adutor da coxa esquerda', '2020-09-30', 120, 1);

INSERT into partida VALUES(DEFAULT, '2015-08-09', '16:00:00', 5, 0, 1, 2, 1, 123456, 123456, 123456, NULL);

INSERT into estatisticas VALUES(DEFAULT, 15, 11, 7, 3, 49, 51, 443, 371, 90, 88, 16, 11, 2, 4, 0, 0, 1, 1, 4, 5, 1);
