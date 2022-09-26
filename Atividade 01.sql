-- Atividade 1: Crie um banco de dados para um serviço de um Games Online. O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. O sistema trabalhará com as informações dos personagens do jogo. O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, que deverão estar relacionadas.

CREATE DATABASE DB_GENERATION_GAME_ONLINE;
USE DB_GENERATION_GAME_ONLINE;

-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
CREATE TABLE TB_CLASSES(ID BIGINT(5) AUTO_INCREMENT,
NIVEL INT NOT NULL,
CLASSE VARCHAR(255) NOT NULL,
PRIMARY KEY(ID));

-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
-- Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.

CREATE TABLE TB_PERSONAGENS(ID BIGINT(5) AUTO_INCREMENT,
NOME VARCHAR(255) NOT NULL,
DEFESA INT NOT NULL,
ATAQUE INT NOT NULL,
AMBIENTE VARCHAR(255) NOT NULL,
CLASSES_ID BIGINT(5),
PRIMARY KEY(ID),
FOREIGN KEY(CLASSES_ID) REFERENCES TB_CLASSES(ID)
);

-- Insira 5 registros na tabela tb_classes.
INSERT INTO TB_CLASSES(NIVEL,CLASSE) VALUES("2","ARQUEIRO");
INSERT INTO TB_CLASSES(NIVEL,CLASSE) VALUES("1","MAGO");
INSERT INTO TB_CLASSES(NIVEL,CLASSE) VALUES("3","BRUXA");
INSERT INTO TB_CLASSES(NIVEL,CLASSE) VALUES("5","PALADINO");
INSERT INTO TB_CLASSES(NIVEL,CLASSE) VALUES("4","NINJA");

SELECT * FROM TB_CLASSES;

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("ALAN",3000,1000,"FLORESTA",1);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("DANI",1000,2500,"DESERTO",2);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("CAT",4000,1500,"IDADE",2);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("BIA",2200,3000,"CAMPO",3);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("GIA",5000,1400,"MONTANHAS",4);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("LUA",2600,3000,"FLORESTA",5);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("SAM",900,5800,"CIDADE",3);
INSERT INTO TB_PERSONAGENS(NOME,DEFESA,ATAQUE,AMBIENTE,CLASSES_ID)
VALUES ("OLI",2500,520,"DESERTO",4);

SELECT *FROM TB_PERSONAGENS;

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM TB_PERSONAGENS WHERE ATAQUE > 2000;
-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM TB_PERSONAGENS WHERE DEFESA BETWEEN 1000 AND 2000;
-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM TB_PERSONAGENS WHERE NOME LIKE "%C%";
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT * FROM TB_PERSONAGENS INNER JOIN TB_CLASSES ON TB_PERSONAGENS.CLASSES_ID = TB_CLASSES.ID;
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
SELECT * FROM TB_CLASSES INNER JOIN TB_PERSONAGENS ON TB_PERSONAGENS.ID = TB_CLASSES.ID WHERE TB_CLASSES.CLASSE = "ARQUEIRO";
