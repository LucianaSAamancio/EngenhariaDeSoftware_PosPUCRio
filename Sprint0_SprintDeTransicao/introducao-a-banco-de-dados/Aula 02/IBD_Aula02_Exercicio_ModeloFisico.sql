/* IntroducaoBancoDeDados_Aula02_Exercicio01_ModeloLogico: */

CREATE TABLE Proprietario (
    CPF INT PRIMARY KEY,
    Nome_completo CHAR,
    Data_de_nascimento DATE,
    Telefone INT,
    Celular INT,
    E_mail CHAR
);

CREATE TABLE Imovel (
    fk_Endereco_Endereco_PK INT,
    fk_Avaliacao_Avaliacao_PK INT,
    Aceita_animais BOOLEAN,
    Numero_de_quartos INT,
    Numero_de_banheiros INT,
    Vaga_na_garagem BOOLEAN,
    Numero_maximo_de_pessoas INT,
    fk_Proprietario_CPF INT, 
	CONSTRAINT FK_Imovel_1 FOREIGN KEY (fk_Endereco_Endereco_PK)   REFERENCES Endereco (Endereco_PK),
	CONSTRAINT FK_Imovel_2 FOREIGN KEY (fk_Avaliacao_Avaliacao_PK) REFERENCES Avaliacao (Avaliacao_PK),
	CONSTRAINT FK_Imovel_3 FOREIGN KEY (fk_Proprietario_CPF)       REFERENCES Proprietario (CPF)
);

CREATE TABLE Endereco (
    Endereco_PK INT NOT NULL PRIMARY KEY,
	fk_CEP_CEP INT,
	CONSTRAINT FK_Endereco_2 FOREIGN KEY (fk_CEP_CEP)  REFERENCES CEP (CEP_PK)
	
);

CREATE TABLE CEP (
    CEP INT PRIMARY KEY,
    Logradouro CHAR,
    Numero INT,
    Complemento CHAR,
    Bairro CHAR,
    Cidade CHAR,
    Estado CHAR
);


CREATE TABLE Avaliacao (
    Avaliacao_PK INT NOT NULL PRIMARY KEY,
    Locatario CHAR,
    Data DATE,
    Texto CHAR
);

CREATE TABLE Aluga (
    fk_Locatario_CPF INT,
    Valor_do_aluguel INT,
    Data_fim DATE,
    Numero_de_pessoas INT,
    Data_inicio DATE,
    Situacao CHAR,
    Observacao CHAR,
	CONSTRAINT FK_Aluga_1 FOREIGN KEY (fk_Locatario_CPF) REFERENCES Locatario (CPF)
);

CREATE TABLE Locatario (
    CPF INT PRIMARY KEY,
    Nome_completo CHAR,
    Data_de_nascimento DATE,
    Telefone_celular INT,
    E_mail CHAR
); 
 
 
