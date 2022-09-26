-- Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados deverá ter o seguinte nome db_farmacia_bem_estar. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

CREATE DATABASE DB_FARMACIA_BEM_ESTAR;
USE DB_FARMACIA_BEM_ESTAR;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
CREATE TABLE TB_CATEGORIAS(ID BIGINT(5) AUTO_INCREMENT,
TIPO VARCHAR(255) NOT NULL,
FAIXA_ETARIA VARCHAR(255) NOT NULL,
PRIMARY KEY(ID));

-- Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia. Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE TB_PRODUTOS(ID BIGINT(5) AUTO_INCREMENT,
NOME VARCHAR(255) NOT NULL,
VALOR INT NOT NULL,
PRESCRICAO VARCHAR(255) NOT NULL,
ESTOQUE INT NOT NULL,
CATEGORIAS_ID BIGINT(5),
PRIMARY KEY(ID),
FOREIGN KEY(CATEGORIAS_ID) REFERENCES TB_CATEGORIAS(ID));

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO TB_CATEGORIAS(TIPO,FAIXA_ETARIA) VALUE ("MEDICAMENTO","ADULTO");
INSERT INTO TB_CATEGORIAS(TIPO,FAIXA_ETARIA) VALUE ("HIGIENE","INFANTIL");
INSERT INTO TB_CATEGORIAS(TIPO,FAIXA_ETARIA) VALUE ("MEDICAMENTO","INFANTIL");
INSERT INTO TB_CATEGORIAS(TIPO,FAIXA_ETARIA) VALUE ("HIGIENE","ADULTO");
INSERT INTO TB_CATEGORIAS(TIPO,FAIXA_ETARIA) VALUE ("BELEZA","ADULTO");

SELECT * FROM TB_CATEGORIAS;

-- Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("DIPIRONA",12.00,"NAO",23,3);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("SHAMPOO",27.00,"NAO",14,3);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("CONDICIONADOR",26.00,"NAO",10,1);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("XAROPE",35.00,"SIM",29,2);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("HIDRATANTE",52.00,"NAO",41,3);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("ESCOVA",41.00,"NAO",6,3);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("POMADA",80.00,"SIM",12,1);
INSERT INTO TB_PRODUTOS(NOME,VALOR,PRESCRICAO,ESTOQUE,CATEGORIAS_ID) VALUE ("DEMAQUILANTE",29.00,"NAO",35,2);

SELECT * FROM TB_PRODUTOS;

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM TB_PRODUTOS WHERE VALOR > 50;
-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM TB_PRODUTOS WHERE VALOR BETWEEN 5 AND 60;
-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM TB_PRODUTOS WHERE NOME LIKE "%C%";
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT * FROM TB_PRODUTOS INNER JOIN TB_CATEGORIAS ON TB_PRODUTOS.CATEGORIAS_ID = TB_CATEGORIAS.ID;
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos).
SELECT * FROM TB_PRODUTOS INNER JOIN TB_CATEGORIAS ON TB_PRODUTOS.ID = TB_CATEGORIAS.ID WHERE TB_CATEGORIAS.TIPO = "HIGIENE";
