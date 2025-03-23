/* IntroducaoBancoDeDados_Aula02_ExercicioModeloLogico_V04: */

CREATE TABLE Proprietario (
    CPF_Proprietario VARCHAR PRIMARY KEY,
    Nome_completo VARCHAR,
    Data_de_nascimento DATE,
    Telefone_celular INT,
    E_mail VARCHAR
);

CREATE TABLE Imovel (
    ID_Imovel INT,
    fk_Endereco_Endereco_PK INT,
    fk_Avaliacao_Avaliacao_PK INT,
    Informacoes_Adicionais VARCHAR,
    Valor_minimo_da_diaria_por_pessoa INT,
    Valor_adicional_da_diaria_por_pessoa INT,
    Numero_de_quartos INT,
    Numero_de_banheiros INT,
    Vaga_na_garagem BOOLEAN,
    Aceita_animais BOOLEAN,
    Numero_maximo_de_pessoas INT,
    fk_Proprietario_CPF VARCHAR,
		CONSTRAINT FK_Imovel_1 FOREIGN KEY (fk_Endereco_Endereco_PK)   REFERENCES Endereco (Endereco_PK), 
		CONSTRAINT FK_Imovel_2 FOREIGN KEY (fk_Avaliacao_Avaliacao_PK) REFERENCES Avaliacao (Avaliacao_PK),
		CONSTRAINT FK_Imovel_3 FOREIGN KEY (fk_Proprietario_CPF)       REFERENCES Proprietario (CPF_Proprietario)  
);

CREATE TABLE Locatario (
    CPF_Locatario VARCHAR PRIMARY KEY,
    Nome_completo VARCHAR,
    Data_de_nascimento DATE,
    Telefone_celular INT,
    E_mail VARCHAR
);

CREATE TABLE Endereco (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    CEP INT,
    Logradouro VARCHAR,
    EnderecoNumero INT,
    EnderecoComplemento VARCHAR,
		CONSTRAINT FK_Endereco_2  FOREIGN KEY (CEP, Logradouro)  REFERENCES CEP_Correios (CEP, Logradouro)
);

CREATE TABLE CEP_Correios (
    CEP INT,
    Logradouro VARCHAR,
    Cidade VARCHAR,
    Estado VARCHAR,
    Bairro VARCHAR,
    PRIMARY KEY (CEP, Logradouro)
); 

CREATE TABLE Avaliacao (
    Avaliacao_PK INT NOT NULL PRIMARY KEY,
    Autor VARCHAR,
    Data DATE,
    Texto VARCHAR
);

CREATE TABLE Aluga (
    fk_Locatario_CPF VARCHAR,
    Valor_do_aluguel INT,
    Data_inicio DATE,
    Data_fim DATE,
    Numero_de_pessoas INT,
    Situacao VARCHAR,
    fk_Observacao_Observacao_PK INT,
    CheckIn BOOLEAN,
    CheckOut BOOLEAN,
		CONSTRAINT FK_Aluga_1 FOREIGN KEY (fk_Locatario_CPF) 			REFERENCES Locatario (CPF_Locatario),
		CONSTRAINT FK_Aluga_2 FOREIGN KEY (fk_Observacao_Observacao_PK)	REFERENCES Observacao (Observacao_PK)   
);

CREATE TABLE Observacao (
    Observacao_PK INT NOT NULL PRIMARY KEY,
    Observacao VARCHAR
);


 

