/* IntroducaoBancoDeDados_Aula02_ExercicioModeloLogico_V05: */

CREATE TABLE Proprietario (
    CPF_Proprietario VARCHAR(11) PRIMARY KEY,
    Nome_completo VARCHAR(100),
    Data_de_nascimento DATE,
    Telefone_celular INT(12),
    E_mail VARCHAR(100)
);

CREATE TABLE Imovel (
    ID_Imovel INT NOT NULL PRIMARY KEY,
    fk_Endereco_Endereco_PK INT,
    fk_Avaliacao_Avaliacao_PK INT,
    Informacoes_Adicionais VARCHAR(500),
    Valor_minimo_da_diaria_por_pessoa INT,
    Valor_adicional_da_diaria_por_pessoa INT,
    Numero_de_quartos INT,
    Numero_de_banheiros INT,
    Vaga_na_garagem BOOLEAN,
    Aceita_animais BOOLEAN,
    Numero_maximo_de_pessoas INT,
    fk_Proprietario_CPF VARCHAR(11),
		CONSTRAINT FK_Imovel_1     FOREIGN KEY (fk_Endereco_Endereco_PK)    REFERENCES Endereco (Endereco_PK),
		CONSTRAINT FK_Imovel_2     FOREIGN KEY (fk_Avaliacao_Avaliacao_PK)  REFERENCES Avaliacao (Avaliacao_PK),
		CONSTRAINT FK_Imovel_3     FOREIGN KEY (fk_Proprietario_CPF)        REFERENCES Proprietario (CPF_Proprietario)
);

CREATE TABLE Endereco (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    CEP INT(10),
    Logradouro VARCHAR(100),
    EnderecoNumero INT,
    EnderecoComplemento VARCHAR(50), 
		CONSTRAINT FK_Endereco_2  FOREIGN KEY (CEP, Logradouro)  REFERENCES CEP_Correios (CEP, Logradouro)
);


CREATE TABLE CEP_Correios (
    CEP INT(8),
    Logradouro VARCHAR(100),
    Cidade VARCHAR(100),
    Estado VARCHAR(100),
    Bairro VARCHAR(100),
    PRIMARY KEY (CEP, Logradouro)
);

CREATE TABLE Avaliacao (
    Avaliacao_PK INT NOT NULL PRIMARY KEY,
    Autor VARCHAR(100),
    Data_Avaliacao DATE,
    Texto VARCHAR(500),
    ID_Imovel INT
);

CREATE TABLE Locatario (
    CPF_Locatario VARCHAR(11) PRIMARY KEY,
    Nome_completo VARCHAR(100),
    Data_de_nascimento DATE,
    Telefone_celular INT(12),
    E_mail VARCHAR(100)
);

CREATE TABLE Aluga (
    fk_Locatario_CPF VARCHAR(11),
    Valor_do_aluguel INT,
    Data_inicio DATE,
    Data_fim DATE,
    Numero_de_pessoas INT,
    Situacao VARCHAR(25),
    fk_Observacao_Observacao_PK INT,
    CheckIn BOOLEAN,
    CheckOut BOOLEAN,
    ID_Imovel INT,
		PRIMARY KEY (ID_Imovel, fk_Locatario_CPF),
		CONSTRAINT FK_Aluga_1     FOREIGN KEY (fk_Observacao_Observacao_PK)   REFERENCES Observacao (Observacao_PK),
		CONSTRAINT FK_Aluga_2     FOREIGN KEY (fk_Locatario_CPF, ID_Imovel)   REFERENCES Observacao (fk_Locatario_CPF, ID_Imovel)		
);

CREATE TABLE Observacao (
    
    Observacao_PK INT NOT NULL PRIMARY KEY,
    fk_Locatario_CPF INT(11),
    ID_Imovel INT,
    Observacao VARCHAR(500),
		CONSTRAINT FK_Observacao_2    FOREIGN KEY (fk_Locatario_CPF, ID_Imovel)    REFERENCES Aluga(fk_Locatario_CPF, ID_Imovel)
);



 

 

 

 
