-- Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. O nome do Banco de dados deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.
CREATE DATABASE DB_CIDADE_DOS_VEGETAIS;
USE DB_CIDADE_DOS_VEGETAIS;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
CREATE TABLE TB_CATEGORIAS(ID BIGINT(5) AUTO_INCREMENT,
ESTACAO VARCHAR(255) NOT NULL,
KILO INT NOT NULL,
PRIMARY KEY(ID)
);

-- 2. Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia. Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE TB_PRODUTOS(ID BIGINT(5) AUTO_INCREMENT,
NOME VARCHAR(255) NOT NULL,
TIPO VARCHAR(255) NOT NULL,
VALOR INT NOT NULL,
QTESTOQUE INT NOT NULL,
CATEGORIAS_ID BIGINT(5),
PRIMARY KEY(ID),
FOREIGN KEY(CATEGORIAS_ID) REFERENCES TB_CATEGORIAS(ID));

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO TB_CATEGORIAS(ESTACAO,KILO) VALUE ("SIM",43);
INSERT INTO TB_CATEGORIAS(ESTACAO,KILO) VALUE ("NAO",25);
INSERT INTO TB_CATEGORIAS(ESTACAO,KILO) VALUE ("SIM",12);
INSERT INTO TB_CATEGORIAS(ESTACAO,KILO) VALUE ("NAO",36);
INSERT INTO TB_CATEGORIAS(ESTACAO,KILO) VALUE ("SIM",20);
SELECT * FROM TB_CATEGORIAS;

-- Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("ABACAXI","FRUTA",5.00,10,1);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("MELANCIA","FRUTA",18.00,6,2);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("CENOURA","LEGUME",8.00,45,3);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("ALFACE","VERDURA",3.00,20,1);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("BATATA","LEGUME",14.00,100,2);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("MORANGO","FRUTA",10.00,26,3);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("COUVE","VERDURA",5.00,18,1);
INSERT INTO TB_PRODUTOS(NOME,TIPO,VALOR,QTESTOQUE,CATEGORIAS_ID) VALUE ("LARANJA","FRUTA",7.00,80,2);
SELECT * FROM TB_PRODUTOS;

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM TB_PRODUTOS WHERE VALOR > 50;
-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
SELECT * FROM TB_PRODUTOS WHERE VALOR BETWEEN 50 AND 150;
-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM TB_PRODUTOS WHERE NOME LIKE "%C%";
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT * FROM TB_PRODUTOS INNER JOIN TB_CATEGORIAS ON TB_PRODUTOS.CATEGORIAS_ID = TB_CATEGORIAS.ID;
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).
SELECT * FROM TB_PRODUTOS INNER JOIN TB_CATEGORIAS ON TB_PRODUTOS.ID = TB_CATEGORIAS.ID WHERE TB_CATEGORIAS.ESTACAO = "SIM";

