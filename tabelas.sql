drop view DadosJogador;
drop view DadosTecnico;
drop view DadosAuxiliarTecnico;
drop view DadosArbrito;
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
 publico INT not NULL DEFAULT 5000,
 id_partida INTEGER not NULL,
 FOREIGN KEY(id_partida) REFERENCES Partida (id_partida)
 	on DELETE CASCADE
); 

-- Cria view com dados dos jogadores
CREATE VIEW DadosJogador AS 
	SELECT * FROM jogador 
    	JOIN futebolista USING (id_futebolista)
        JOIN pessoa ON futebolista.id_pessoa = pessoa.cpf;

-- Cria view com dados dos tecnicos
CREATE VIEW DadosTecnico AS 
	SELECT * FROM Tecnico
    	JOIN futebolista USING (id_futebolista)
        JOIN pessoa ON futebolista.id_pessoa = pessoa.cpf;

-- Cria view com dados dos auxiliares tecnicos
CREATE VIEW DadosAuxiliarTecnico  AS 
	SELECT * FROM AuxiliarTecnico  
    	JOIN futebolista USING (id_futebolista)
        JOIN pessoa ON futebolista.id_pessoa = pessoa.cpf;

-- Cria view com dados dos arbritos
CREATE VIEW DadosArbrito AS 
	SELECT * FROM Arbitro 
        JOIN pessoa ON Arbitro.id_pessoa = pessoa.cpf;