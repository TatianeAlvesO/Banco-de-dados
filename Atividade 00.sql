CREATE DATABASE DB_RH_SERVICOS;
USE DB_RH_SERVICOS;

CREATE TABLE TB_FUNCIONARIOS(
ID BIGINT AUTO_INCREMENT,
NOME VARCHAR(500),
IDADE INT,
FUNCAO CHAR(255),
SALARIO INT,
HORAS_TRABALHADAS INT,
PRIMARY KEY (ID)
);

INSERT INTO TB_FUNCIONARIOS (NOME,IDADE,FUNCAO,SALARIO,HORAS_TRABALHADAS)
VALUES ("AMANDA",25,"DESENVOLVEDORA JUNIOR",2500,50);
INSERT INTO TB_FUNCIONARIOS (NOME,IDADE,FUNCAO,SALARIO,HORAS_TRABALHADAS)
VALUES ("CAROL",32,"DESENVOLVEDORO SENIOR",10000,45);
INSERT INTO TB_FUNCIONARIOS (NOME,IDADE,FUNCAO,SALARIO,HORAS_TRABALHADAS)
VALUES ("JESSICA",19,"ESTAGIARIA",1200,35);
INSERT INTO TB_FUNCIONARIOS (NOME,IDADE,FUNCAO,SALARIO,HORAS_TRABALHADAS)
VALUES ("MARINA",40,"DESENVOLVEDORA PLENO",5500,37);
INSERT INTO TB_FUNCIONARIOS (NOME,IDADE,FUNCAO,SALARIO,HORAS_TRABALHADAS)
VALUES ("BEATRIZ",21,"ASSISTENTE",2100,45);

SELECT * FROM TB_FUNCIONARIOS;
SELECT * FROM TB_FUNCIONARIOS WHERE SALARIO > 2000;
SELECT * FROM TB_FUNCIONARIOS WHERE SALARIO < 2000;
UPDATE TB_FUNCIONARIOS SET SALARIO = 3000 WHERE ID = 2;
SELECT * FROM TB_FUNCIONARIOS;