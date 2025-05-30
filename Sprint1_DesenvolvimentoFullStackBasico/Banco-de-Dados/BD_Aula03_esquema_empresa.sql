SET SCHEMA 'empresa';

CREATE TABLE empresa.departamento (
    num numeric NOT NULL,
    nome character(25) NOT NULL,
    identger numeric NOT NULL,
    dataini date NOT NULL
);

CREATE TABLE empresa.empregado (
    ident numeric NOT NULL,
    nome character(20) NOT NULL,
    sal numeric(8,2),
    endereco character(50),
    sexo character(1),
    datanasc date,
    depnum numeric NOT NULL,
    superident numeric
);

CREATE TABLE empresa.dependente (
    identemp numeric NOT NULL,
    nome character(20) NOT NULL,
    sexo character(1) NOT NULL,
    datanasc date NOT NULL,
    parentesco character(10) NOT NULL
);

CREATE TABLE empresa.deploc (
    depnum numeric NOT NULL,
    local character(15) NOT NULL
);

CREATE TABLE empresa.projeto (
    num numeric NOT NULL,
    nome character(15) NOT NULL,
    local character(15) NOT NULL,
    depnum numeric NOT NULL
);

CREATE TABLE empresa.trabalhano (
    identemp numeric NOT NULL,
    projnum numeric NOT NULL,
    hrs numeric NOT NULL
);

INSERT INTO empresa.departamento VALUES (3, 'Informatica              ', 2, '1911-11-11');
INSERT INTO empresa.departamento VALUES (1, 'Financeiro               ', 23, '2013-01-04');
INSERT INTO empresa.departamento VALUES (5, 'Biologia                 ', 3, '2012-12-12');
INSERT INTO empresa.departamento VALUES (6, 'RH                       ', 7, '2011-03-30');
INSERT INTO empresa.departamento VALUES (7, 'Pessoal                  ', 9, '2012-10-11');
INSERT INTO empresa.departamento VALUES (9, 'Entregas                 ', 15, '2010-07-25');
INSERT INTO empresa.departamento VALUES (11, 'Segurança                ', 1, '2012-03-09');
INSERT INTO empresa.departamento VALUES (15, 'Nanotecnologia           ', 1, '2012-07-01');
INSERT INTO empresa.departamento VALUES (8, 'Farmacia                 ', 10, '2013-07-09');
INSERT INTO empresa.departamento VALUES (10, 'Matematica               ', 19, '2010-05-08');
INSERT INTO empresa.departamento VALUES (4, 'Economia                 ', 2, '1995-01-01');
INSERT INTO empresa.departamento VALUES (13, 'BioInformatica           ', 12, '2011-11-23');
INSERT INTO empresa.departamento VALUES (14, 'Quimica                  ', 21, '2013-02-27');
INSERT INTO empresa.departamento VALUES (2, 'Historia                 ', 13, '1999-11-11');
INSERT INTO empresa.departamento VALUES (12, 'Fisica                   ', 6, '2011-07-15');
INSERT INTO empresa.departamento VALUES (28319, 'Pesquisa                 ', 2, '2010-02-02');
INSERT INTO empresa.departamento VALUES (9000, 'Engenharia               ', 5, '1957-03-09');

INSERT INTO empresa.dependente VALUES (1, 'Maria               ', 'F', '2012-01-03', 'FILHA     ');
INSERT INTO empresa.dependente VALUES (1, 'João                ', 'M', '1990-10-10', 'IRMÃO     ');
INSERT INTO empresa.dependente VALUES (1, 'José                ', 'M', '1930-11-15', 'PAI       ');
INSERT INTO empresa.dependente VALUES (2, 'Carlos              ', 'M', '1950-03-23', 'PAI       ');
INSERT INTO empresa.dependente VALUES (2, 'Claudio             ', 'M', '1995-08-30', 'IRMÃO     ');
INSERT INTO empresa.dependente VALUES (4, 'Lurdes              ', 'F', '2012-01-03', 'FILHA     ');
INSERT INTO empresa.dependente VALUES (4, 'Lurdinalva          ', 'F', '1995-08-30', 'IRMÃ      ');
INSERT INTO empresa.dependente VALUES (4, 'Luan Santana        ', 'M', '1930-11-15', 'PAI       ');
INSERT INTO empresa.dependente VALUES (6, 'Elba Ramalho        ', 'F', '1950-03-23', 'MÃE       ');
INSERT INTO empresa.dependente VALUES (6, 'Preta Gil           ', 'F', '1995-08-30', 'IRMÃ      ');
INSERT INTO empresa.dependente VALUES (8, 'Fafa de Belem       ', 'F', '1930-11-15', 'MÃE       ');
INSERT INTO empresa.dependente VALUES (9, 'Gustavo Lima        ', 'M', '1995-08-30', 'FILHO     ');
INSERT INTO empresa.dependente VALUES (13, 'Thaeme              ', 'F', '1995-08-30', 'IRMÃ      ');
INSERT INTO empresa.dependente VALUES (13, 'Thiago              ', 'M', '2012-01-03', 'FILHO     ');
INSERT INTO empresa.dependente VALUES (15, 'Maria Cecilia       ', 'F', '1995-08-30', 'PRIMA     ');
INSERT INTO empresa.dependente VALUES (15, 'Rodolfo             ', 'M', '1930-11-15', 'PAI       ');
INSERT INTO empresa.dependente VALUES (16, 'Antônio             ', 'M', '1950-03-23', 'PAI       ');
INSERT INTO empresa.dependente VALUES (17, 'Lucas               ', 'M', '1990-10-10', 'FILHO     ');
INSERT INTO empresa.dependente VALUES (17, 'Tadeu               ', 'M', '1930-11-15', 'AVÔ       ');
INSERT INTO empresa.dependente VALUES (17, 'Agueda              ', 'F', '1990-10-10', 'PRIMA     ');
INSERT INTO empresa.dependente VALUES (20, 'Luzia               ', 'F', '1995-08-30', 'FILHA     ');
INSERT INTO empresa.dependente VALUES (21, 'Ines                ', 'F', '2012-01-03', 'FILHA     ');
INSERT INTO empresa.dependente VALUES (23, 'Anastacia           ', 'F', '1930-11-15', 'MÃE       ');
INSERT INTO empresa.dependente VALUES (23, 'Rita                ', 'F', '1950-03-23', 'AVÓ       ');

INSERT INTO empresa.deploc VALUES (1, 'Belo Horizonte ');
INSERT INTO empresa.deploc VALUES (2, 'Salvador       ');
INSERT INTO empresa.deploc VALUES (3, 'São Paulo      ');
INSERT INTO empresa.deploc VALUES (4, 'Queimadas      ');
INSERT INTO empresa.deploc VALUES (5, 'Cabo Frio      ');
INSERT INTO empresa.deploc VALUES (6, 'Rio de Janeiro ');
INSERT INTO empresa.deploc VALUES (7, 'Vitoria        ');
INSERT INTO empresa.deploc VALUES (8, 'Belo Horizonte ');
INSERT INTO empresa.deploc VALUES (9, 'Salvador       ');
INSERT INTO empresa.deploc VALUES (10, 'Florianopolis  ');
INSERT INTO empresa.deploc VALUES (11, 'Porto Alegre   ');
INSERT INTO empresa.deploc VALUES (12, 'São Paulo      ');
INSERT INTO empresa.deploc VALUES (13, 'Rio de Janeiro ');
INSERT INTO empresa.deploc VALUES (14, 'Natal          ');
INSERT INTO empresa.deploc VALUES (15, 'Salvador       ');

INSERT INTO empresa.empregado VALUES (2, 'Maria               ', 1000.00, 'Salvador                                          ', 'F', '1991-08-12', 28319, NULL);
INSERT INTO empresa.empregado VALUES (17, 'Felicidade Maria    ', 11255.00, 'Vitoria                                           ', 'F', '2000-12-10', 28319, 22);
INSERT INTO empresa.empregado VALUES (4, 'Ciclano             ', 1000.00, 'Portaria Salvadores                               ', 'M', '2011-10-11', 4, 2);
INSERT INTO empresa.empregado VALUES (8, 'José Carlos         ', 11255.00, 'São Paulo                                         ', 'M', '2000-12-10', 3, NULL);
INSERT INTO empresa.empregado VALUES (11, 'Silvano Silva       ', 22233.00, 'Salvador                                          ', 'M', '2000-12-10', 3, 17);
INSERT INTO empresa.empregado VALUES (13, 'Jorge Sousa         ', 5598.00, 'Salvador                                          ', 'M', '1990-05-30', 2, 6);
INSERT INTO empresa.empregado VALUES (14, 'Bruno Peixoto       ', 6554.00, 'Salvador                                          ', 'M', '1987-10-05', 3, 8);
INSERT INTO empresa.empregado VALUES (16, 'Bianca Lourenco     ', 12335.00, 'Belo Horizonte                                    ', 'F', '1992-12-12', 2, 16);
INSERT INTO empresa.empregado VALUES (18, 'Luciana Fernandes   ', 1245.00, 'São Paulo                                         ', 'F', '1990-05-30', 4, 21);
INSERT INTO empresa.empregado VALUES (20, 'Raphael Mendes      ', 22233.00, 'Rio de Janeiro                                    ', 'M', '1992-12-12', 3, NULL);
INSERT INTO empresa.empregado VALUES (24, 'Marcos Guedes       ', 23265.00, 'Rio de Janeiro                                    ', 'M', '1992-12-12', 4, 7);
INSERT INTO empresa.empregado VALUES (25, 'Natasha Gasparelli  ', 22233.00, 'São Paulo                                         ', 'F', '2000-12-10', 2, NULL);
INSERT INTO empresa.empregado VALUES (26, 'Luana Marques       ', 5222.00, 'São Paulo                                         ', 'F', '1992-12-12', 3, 10);
INSERT INTO empresa.empregado VALUES (27, 'Simone Estoggliato  ', 2.00, 'Rio de Janeiro                                    ', 'M', '1990-05-30', 4, NULL);
INSERT INTO empresa.empregado VALUES (9, 'Maria José          ', 1245.00, 'Salvador                                          ', 'F', '1987-10-05', 7, 11);
INSERT INTO empresa.empregado VALUES (23, 'Paola Silva         ', 1245.00, 'Vitoria                                           ', 'F', '1990-05-30', 1, 27);
INSERT INTO empresa.empregado VALUES (15, 'Bruna Carla         ', 5878.00, 'Rio de Janeiro                                    ', 'F', '1992-12-12', 9, 10);
INSERT INTO empresa.empregado VALUES (19, 'Ariane Goncalves    ', 23265.00, 'Vitoria                                           ', 'F', '1992-12-12', 10, 18);
INSERT INTO empresa.empregado VALUES (6, 'Luciano Mauri       ', 23265.00, 'Rio de Janeiro                                    ', 'M', '1987-10-05', 15, 15);
INSERT INTO empresa.empregado VALUES (12, 'Leandro Silva       ', 5222.00, 'São Paulo                                         ', 'M', '1987-10-05', 13, 7);
INSERT INTO empresa.empregado VALUES (21, 'Raphaela Fontoura   ', 5222.00, 'Belo Horizonte                                    ', 'F', '2000-12-10', 14, NULL);
INSERT INTO empresa.empregado VALUES (7, 'João Maria          ', 10000.00, 'Rio de Janeiro                                    ', 'M', '1990-05-30', 6, 10);
INSERT INTO empresa.empregado VALUES (5, 'Severino Buarque    ', 7500.00, 'Porto Alegre                                      ', 'M', '1988-03-28', 5, NULL);
INSERT INTO empresa.empregado VALUES (22, 'Laura Benayon       ', 11255.00, 'São Paulo                                         ', 'F', '1992-12-12', 2, 25);
INSERT INTO empresa.empregado VALUES (3, 'Caetano Veloso      ', 2000.00, 'PUC                                               ', 'M', '2015-11-13', 5, NULL);
INSERT INTO empresa.empregado VALUES (10, 'Johnny Depp         ', 30001.00, 'São Joaquim                                       ', 'M', '2015-11-11', 8, 2);
INSERT INTO empresa.empregado VALUES (1, 'Joao                ', 1000.00, 'São Bernardo do Campo                             ', 'M', '1991-08-12', 15, NULL);

INSERT INTO empresa.projeto VALUES (10, 'Informatizacao ', 'Belo Horizonte ', 4);
INSERT INTO empresa.projeto VALUES (30, 'Reengenharia   ', 'Belo Horizonte ', 4);
INSERT INTO empresa.projeto VALUES (20, 'Pagamentos     ', 'Salvador       ', 1);
INSERT INTO empresa.projeto VALUES (0, 'Excursão       ', 'Florianopolis  ', 2);
INSERT INTO empresa.projeto VALUES (40, 'Genoma         ', 'Rio de Janeiro ', 13);
INSERT INTO empresa.projeto VALUES (50, 'Big Data       ', 'São Paulo      ', 13);
INSERT INTO empresa.projeto VALUES (60, 'Reagindo       ', 'São Paulo      ', 15);
INSERT INTO empresa.projeto VALUES (70, 'Câmeras        ', 'Rio de Janeiro ', 11);
INSERT INTO empresa.projeto VALUES (80, 'NanoParticulas ', 'Belo Horizonte ', 15);
INSERT INTO empresa.projeto VALUES (90, 'CorreçãoBugs   ', 'Rio de Janeiro ', 3);
INSERT INTO empresa.projeto VALUES (100, 'Vacinação      ', 'São Paulo      ', 8);

INSERT INTO empresa.trabalhano VALUES (4, 30, 1);
INSERT INTO empresa.trabalhano VALUES (4, 10, 6);
INSERT INTO empresa.trabalhano VALUES (3, 30, 3);
INSERT INTO empresa.trabalhano VALUES (1, 10, 7);
INSERT INTO empresa.trabalhano VALUES (1, 0, 1);
INSERT INTO empresa.trabalhano VALUES (2, 10, 8);
INSERT INTO empresa.trabalhano VALUES (3, 20, 3);
INSERT INTO empresa.trabalhano VALUES (4, 40, 1);
INSERT INTO empresa.trabalhano VALUES (5, 10, 1);
INSERT INTO empresa.trabalhano VALUES (5, 50, 1);
INSERT INTO empresa.trabalhano VALUES (5, 60, 2);
INSERT INTO empresa.trabalhano VALUES (5, 70, 3);
INSERT INTO empresa.trabalhano VALUES (6, 80, 3);
INSERT INTO empresa.trabalhano VALUES (6, 90, 3);
INSERT INTO empresa.trabalhano VALUES (6, 100, 2);
INSERT INTO empresa.trabalhano VALUES (7, 0, 2);
INSERT INTO empresa.trabalhano VALUES (7, 30, 2);
INSERT INTO empresa.trabalhano VALUES (7, 20, 2);
INSERT INTO empresa.trabalhano VALUES (7, 40, 2);
INSERT INTO empresa.trabalhano VALUES (8, 10, 3);
INSERT INTO empresa.trabalhano VALUES (8, 50, 3);
INSERT INTO empresa.trabalhano VALUES (8, 60, 2);
INSERT INTO empresa.trabalhano VALUES (9, 70, 1);
INSERT INTO empresa.trabalhano VALUES (9, 80, 1);
INSERT INTO empresa.trabalhano VALUES (9, 90, 1);
INSERT INTO empresa.trabalhano VALUES (9, 100, 1);
INSERT INTO empresa.trabalhano VALUES (9, 0, 2);
INSERT INTO empresa.trabalhano VALUES (10, 30, 3);
INSERT INTO empresa.trabalhano VALUES (10, 20, 3);
INSERT INTO empresa.trabalhano VALUES (11, 40, 7);
INSERT INTO empresa.trabalhano VALUES (12, 10, 2);
INSERT INTO empresa.trabalhano VALUES (12, 50, 3);
INSERT INTO empresa.trabalhano VALUES (12, 60, 2);
INSERT INTO empresa.trabalhano VALUES (12, 70, 1);
INSERT INTO empresa.trabalhano VALUES (13, 80, 4);
INSERT INTO empresa.trabalhano VALUES (13, 90, 4);
INSERT INTO empresa.trabalhano VALUES (14, 100, 6);
INSERT INTO empresa.trabalhano VALUES (15, 0, 5);
INSERT INTO empresa.trabalhano VALUES (15, 30, 2);
INSERT INTO empresa.trabalhano VALUES (15, 20, 1);
INSERT INTO empresa.trabalhano VALUES (16, 40, 3);
INSERT INTO empresa.trabalhano VALUES (16, 10, 5);
INSERT INTO empresa.trabalhano VALUES (17, 50, 6);
INSERT INTO empresa.trabalhano VALUES (17, 60, 2);
INSERT INTO empresa.trabalhano VALUES (18, 70, 2);
INSERT INTO empresa.trabalhano VALUES (18, 80, 6);
INSERT INTO empresa.trabalhano VALUES (19, 90, 2);
INSERT INTO empresa.trabalhano VALUES (19, 100, 3);
INSERT INTO empresa.trabalhano VALUES (19, 0, 1);
INSERT INTO empresa.trabalhano VALUES (20, 30, 7);
INSERT INTO empresa.trabalhano VALUES (21, 20, 8);
INSERT INTO empresa.trabalhano VALUES (22, 40, 8);
INSERT INTO empresa.trabalhano VALUES (23, 10, 3);
INSERT INTO empresa.trabalhano VALUES (23, 50, 5);
INSERT INTO empresa.trabalhano VALUES (24, 60, 3);
INSERT INTO empresa.trabalhano VALUES (24, 70, 3);
INSERT INTO empresa.trabalhano VALUES (24, 80, 1);
INSERT INTO empresa.trabalhano VALUES (25, 90, 7);
INSERT INTO empresa.trabalhano VALUES (26, 100, 8);
INSERT INTO empresa.trabalhano VALUES (27, 0, 6);
INSERT INTO empresa.trabalhano VALUES (3, 10, 2);

ALTER TABLE ONLY empresa.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (num);

ALTER TABLE ONLY empresa.dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (identemp, nome);

ALTER TABLE ONLY empresa.deploc
    ADD CONSTRAINT deploc_pkey PRIMARY KEY (depnum, local);

ALTER TABLE ONLY empresa.empregado
    ADD CONSTRAINT empregado_pkey PRIMARY KEY (ident);

ALTER TABLE ONLY empresa.projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (num);

ALTER TABLE ONLY empresa.trabalhano
    ADD CONSTRAINT trabalhano_pkey PRIMARY KEY (identemp, projnum);

ALTER TABLE ONLY empresa.departamento
    ADD CONSTRAINT departamento_empregado_fk FOREIGN KEY (identger) REFERENCES empresa.empregado(ident);

ALTER TABLE ONLY empresa.dependente
    ADD CONSTRAINT dependente_empregado_fk FOREIGN KEY (identemp) REFERENCES empresa.empregado(ident);

ALTER TABLE ONLY empresa.deploc
    ADD CONSTRAINT deploc_departamento_fk FOREIGN KEY (depnum) REFERENCES empresa.departamento(num);

ALTER TABLE ONLY empresa.empregado
    ADD CONSTRAINT empregado_departamento_fk FOREIGN KEY (depnum) REFERENCES empresa.departamento(num);

ALTER TABLE ONLY empresa.empregado
    ADD CONSTRAINT empregado_superident_fk FOREIGN KEY (superident) REFERENCES empresa.empregado(ident);

ALTER TABLE ONLY empresa.projeto
    ADD CONSTRAINT projeto_departamento_fk FOREIGN KEY (depnum) REFERENCES empresa.departamento(num);

ALTER TABLE ONLY empresa.trabalhano
    ADD CONSTRAINT trabalhano_empregado_fk FOREIGN KEY (identemp) REFERENCES empresa.empregado(ident);

ALTER TABLE ONLY empresa.trabalhano
    ADD CONSTRAINT trabalhano_projeto_fk FOREIGN KEY (projnum) REFERENCES empresa.projeto(num);
