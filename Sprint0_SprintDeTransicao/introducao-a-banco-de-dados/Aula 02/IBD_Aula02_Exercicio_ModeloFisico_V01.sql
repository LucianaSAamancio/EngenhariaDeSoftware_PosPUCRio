/* IntroducaoBancoDeDados_Aula02_Exercicio01_ModeloLogico_VF: */

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
    fk_Caracteristicas_Caracteristicas_PK INT,
    fk_Avaliacao_Avaliacao_PK INT,
		CONSTRAINT FK_Imovel_1 FOREIGN KEY (fk_Endereco_Endereco_PK) REFERENCES Endereco (Endereco_PK),
		CONSTRAINT FK_Imovel_2 FOREIGN KEY (fk_Caracteristicas_Caracteristicas_PK) REFERENCES Caracteristicas (Caracteristicas_PK),
		CONSTRAINT FK_Imovel_3 FOREIGN KEY (fk_Avaliacao_Avaliacao_PK) REFERENCES Avaliacao (Avaliacao_PK)
		
);

CREATE TABLE Locatario (
    CPF INT PRIMARY KEY,
    Nome_completo CHAR,
    Data_de_nascimento DATE,
    Telefone_celular INT,
    E_mail CHAR
);

CREATE TABLE Endereco (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    Numero INT,
    Logradouro CHAR,
    Cidade CHAR,
    Estado CHAR,
    Bairro CHAR,
    CEP INT,
    Complemento CHAR
);

CREATE TABLE Caracteristicas (
    Caracteristicas_PK INT NOT NULL PRIMARY KEY,
    Numero_de_quartos INT,
    Vaga_na_garagem BOOLEAN,
    Aceita_animais BOOLEAN,
    Numero_maximo_de_pessoas INT,
    Numero_de_banheiros INT
);

CREATE TABLE Avaliacao (
    Avaliacao_PK INT NOT NULL PRIMARY KEY,
    Locatario CHAR,
    Data DATE,
    Texto CHAR
);

CREATE TABLE Pertence_a_ (
    fk_Proprietario_CPF INT, 
		CONSTRAINT FK_Pertence_a__1 FOREIGN KEY (fk_Proprietario_CPF) REFERENCES Proprietario (CPF)
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
