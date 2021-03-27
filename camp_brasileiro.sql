CREATE TABLE Time 
( 
 id_time SERIAL PRIMARY KEY,
 nome VARCHAR(40),  
 uf Integer,  
 cores Integer,  
 cidade Integer,  
 pontuacao Integer,  
 partidas Integer,  
 gols_contra Integer,  
 gols_pro Integer,  
 vitorias Integer,  
 cartoes_vermelhos Integer,  
 derrotas Integer,  
 empates Integer,  
 cartoes_amarelos Integer, 
 id_estadio INTEGER,
 FOREIGN KEY(id_estadio) REFERENCES Estadio (id_estadio)
); 

CREATE TABLE Pessoa 
( 
 nome Integer,  
 data_nasc Integer,  
 cpf Integer PRIMARY KEY,  
 rg Integer PRIMARY KEY,  
); 

CREATE TABLE Futebolista 
( 
 cartoes_amarelos Integer,  
 cartoes_vermelhos Integer,  
 jogos_suspenso Integer,  
 cartoes_amarelos_acum Integer,  
 id_pessoa Integer,  
 id_time Integer,  
 FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa),
 FOREIGN KEY(id_time) REFERENCES Time (id_time)
); 

CREATE TABLE Arbitro 
( 
 estado Integer,  
 cod_comprovante_curso Integer PRIMARY KEY,  
 id_pessoa Integer,  
 FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa),
); 

CREATE TABLE Estadio 
( 
 apelido Integer,  
 nome Integer PRIMARY KEY,  
 capacidade Integer,  
 cidade Integer,  
 uf Integer,  
 idTime Integer,  
); 

CREATE TABLE Jogador 
( 
 num_partidas Integer,  
 assistencias Integer,  
 gols Integer,  
 id_futebolista Integer,  
 FOREIGN KEY(id_futebolista) REFERENCES Futebolista (id_futebolista)
); 

CREATE TABLE Tecnico 
( 
 id_futebolista Integer,  
 id_auxiliar_tecnico Integer,
 FOREIGN KEY(id_futebolista) REFERENCES Futebolista (id_futebolista)
 FOREIGN KEY(id_auxiliar_tecnico) REFERENCES AuxiliarTecnico (id_futebolista)
); 

CREATE TABLE AuxiliarTecnico 
( 
 id_futebolista Integer
); 

CREATE TABLE DM 
( 
 lesao Integer,  
 data Integer,  
 previsao_dias Integer,  
 id_jogador Integer,  
 FOREIGN KEY(id_jogador) REFERENCES Jogador (id_jogador)
); 

CREATE TABLE Estatisticas 
( 
 chutes_mand Integer,  
 chute_visit Integer,  
 chutes_a_gol_mand Integer,  
 chutes_a_gol_visit Integer,  
 posse_de_bola_mand Integer,  
 posse_de_bola_visit Integer,  
 num_passes_mand Integer,  
 num_passes_visit Integer,  
 precisao_passe_mand Integer,  
 precisao_passe_visit Integer,  
 num_faltas_mand Integer,  
 num_faltas_visit Integer,  
 cartoes_amarelos_visit Integer,  
 cartoes_amarelos_mand Integer,  
 cartoes_vermelhos_mand Integer,  
 cartoes_vermelhos_visit Integer,  
 imped_mand Integer,  
 imped_visit Integer,  
 escanteio_mand Integer,  
 escanteio_visit Integer,  
); 

CREATE TABLE Partida 
( 
 id_partida SERIAL PRIMARY KEY,
 data VARCHAR,  
 hora INTEGER,  
 gols_mandante INTEGER,  
 gols_visitante INTEGER,  
 time_mandante INTEGER,
 time_visitante INTEGER,
 id_estadio Integer,  
 id_estatisticas Integer,  
 FOREIGN KEY(time_mandante) REFERENCES Time (id_time),
 FOREIGN KEY(time_visitante) REFERENCES Time (id_time),
 FOREIGN KEY(id_estatisticas) REFERENCES Estatisticas (id_estatisticas),
 FOREIGN KEY(id_estadio) REFERENCES Estadio (id_estadio)
); 
