-- Atividade 2: Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas.

CREATE DATABASE DB_PIZZARIA_LEGAL;
USE DB_PIZZARIA_LEGAL;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.
CREATE TABLE TB_CATEGORIAS (ID BIGINT(5) AUTO_INCREMENT,
TAMANHO VARCHAR(255) NOT NULL,
ENTREGA VARCHAR(255) NOT NULL,
PRIMARY KEY(ID)
);

-- Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria. Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.
CREATE TABLE TB_PIZZAS(ID BIGINT(5) AUTO_INCREMENT,
NOME VARCHAR(255) NOT NULL,
VALOR DECIMAL (4,2) NOT NULL,
DOCE VARCHAR(255) NOT NULL,
SALGADA VARCHAR(255) NOT NULL,
CATEGORIAS_ID BIGINT(5),
PRIMARY KEY(ID),
FOREIGN KEY(CATEGORIAS_ID) REFERENCES TB_CATEGORIAS(ID));

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO TB_CATEGORIAS(TAMANHO,ENTREGA) VALUE ("GRANDE","SIM");
INSERT INTO TB_CATEGORIAS(TAMANHO,ENTREGA) VALUE ("MEDIA","SIM");
INSERT INTO TB_CATEGORIAS(TAMANHO,ENTREGA) VALUE ("PEQUENA","NÃO");
INSERT INTO TB_CATEGORIAS(TAMANHO,ENTREGA) VALUE ("GRANDE","SIM");
INSERT INTO TB_CATEGORIAS(TAMANHO,ENTREGA) VALUE ("MEDIA","NÃO");

SELECT * FROM TB_CATEGORIAS;

-- Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("MARGUARITA",32.00,"NÃO","SIM",2);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("PORTUGUESA",32.00,"NÃO","SIM",1);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("ATUM",40.00,"NÃO","SIM",3);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("FRANGO",37.00,"NÃO","SIM",5);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("MUSSARELA",84.00,"NÃO","SIM",4);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("CALABRESA",51.00,"NÃO","SIM",1);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("ROMEU E JULIETA",68.00,"SIM","NÃO",3);
INSERT INTO TB_PIZZAS (NOME,VALOR,DOCE,SALGADA,CATEGORIAS_ID) VALUES ("BRIGADEIRO",45.00,"SIM","NÃO",2);

SELECT * FROM TB_PIZZAS;

-- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM TB_PIZZAS WHERE VALOR > 45.00;
-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM TB_PIZZAS WHERE VALOR BETWEEN 50 AND 100;
-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM TB_PIZZAS WHERE NOME LIKE "%M%";
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT * FROM TB_PIZZAS INNER JOIN TB_CATEGORIAS ON TB_PIZZAS.CATEGORIAS_ID = TB_CATEGORIAS.ID;
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
SELECT * FROM TB_PIZZAS INNER JOIN TB_CATEGORIAS ON TB_PIZZAS.ID = TB_CATEGORIAS.ID WHERE TB_CATEGORIAS.TAMANHO = "GRANDE";

