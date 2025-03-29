PRAGMA foreign_keys = ON;
.changes on

/* --> TABELA Proprietário */

/* INSERT  */

INSERT INTO CEP_CORREIOS (CEP, Logradouro, Cidade, Estado, Bairro)
VALUES (20541450, 'Rua Doutor X', 'São Paulo', 'SP', 'Maravilha'); 

INSERT INTO CEP_CORREIOS (CEP, Logradouro, Cidade, Estado, Bairro)
VALUES (21990123, 'Praça Nossa Paz', 'Rio de Janeiro' , 'RJ', 'Copacabana'); 

INSERT INTO CEP_CORREIOS (CEP, Logradouro, Cidade, Estado, Bairro)
VALUES (20541469, 'Avenida Pio V', 'Paraisópolis', 'SP', 'Centro'); 

INSERT INTO CEP_CORREIOS (CEP, Logradouro, Cidade, Estado, Bairro)
VALUES (21990132, 'Doutor Luiz', 'Rio de Janeiro', 'RJ', 'Penha'); 

INSERT INTO CEP_CORREIOS (CEP, Logradouro, Cidade, Estado, Bairro)
VALUES (21990169, 'Plenio Arruda', 'Rio de Janeiro', 'RJ', 'Barra da Tijuca'); 

/* SELECT */

/* Recupera todas as linha de uma tabela */ 
SELECT * FROM CEP_CORREIOS;

/* Recupera as linha de uma tabela que correspondam ao filtro de uma coluna */ 
SELECT *
FROM CEP_CORREIOS
WHERE CEP = 20541469;

/* Recupera as linha de uma tabela que correspondam ao filtro de uma lista de valores para uma coluna */ 
SELECT Bairro, Cidade
FROM CEP_CORREIOS
WHERE Estado IN ('RJ','SP');

/* UPDATE */

/* Update de uma coluna usando a chave da tabela - atualiza somente uma linha, se a chave existir */
UPDATE CEP_CORREIOS
SET Cidade = 'São Paulo'
WHERE CEP = 20541469;

/* 	SUBSELECT */

/* Insere em uma tabela todas as linhas de outra tabela */ 
CREATE TABLE CEP_COPIA (
CEP INTEGER CONSTRAINT CEP_CHAVE_PRIMARIA PRIMARY KEY CONSTRAINT CEP_OBRIGATORIO NOT NULL,
LOGRADOURO TEXT (100) CONSTRAINT LOGRADOURO_OBRIGATORIO NOT NULL,
BAIRRO TEXT (100) CONSTRAINT BAIRRO_OBRIGATORIO NOT NULL,
CIDADE TEXT (100) CONSTRAINT CIDADE_OBRIGATORIA NOT NULL,
ESTADO TEXT (100) CONSTRAINT ESTADO_OBRIGATORIO NOT NULL
);

INSERT INTO CEP_COPIA
SELECT * FROM CEP_CORREIOS;

SELECT * FROM CEP_COPIA;


/* DELETE */

/* Delete com cláusula WHERE usando uma coluna chave - apaga somente uma linha, se a chave existir */
DELETE 
FROM CEP_CORREIOS
WHERE CEP = 21990132;

/* Delete com cláusula WHERE usando uma coluna não chave - pode apagar mais de uma linha */
DELETE 
FROM CEP_CORREIOS
WHERE Estado = 'RJ';

/* Delete sem cláusula WHERE - deleta toda a tabela */
DELETE FROM CEP_CORREIOS;

/* Delete deleta a tabela */
DROP TABLE  CEP_COPIA;



