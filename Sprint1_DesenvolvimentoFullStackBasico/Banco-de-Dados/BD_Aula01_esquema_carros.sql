SET SCHEMA 'carros';

CREATE TABLE carros.automoveis (
    codigo integer NOT NULL,
    ano character(2) NOT NULL,
    fabricante character(20),
    modelo character(20),
    preco_tabela numeric(8,2),
    pais character(20)
);


CREATE TABLE carros.consumidores (
    cpf character(12) NOT NULL,
    nome character(15),
    sobrenome character(15),
    cidade character(25),
    estado character(2)
);

CREATE TABLE carros.garagens (
    codigo integer NOT NULL,
    ano character(2) NOT NULL,
    cgc integer NOT NULL,
    quantidade integer
);

CREATE TABLE carros.negocios (
    codigo integer NOT NULL,
    ano character(2) NOT NULL,
    cgc integer NOT NULL,
    cpf character(12) NOT NULL,
    data date,
    preco numeric(8,2)
);

CREATE TABLE carros.revendedoras (
    cgc integer NOT NULL,
    nome character(20),
    estado character(2),
    cidade character(25),
    proprietario character(12)
);

CREATE FUNCTION carros.conta(cgc_in integer, ano_in character) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    total integer;
BEGIN
    select sum(quantidade) into total
    from garagens g where g.cgc = cgc_in and g.ano = ano_in;
    return total;
END;
$$;

CREATE FUNCTION carros.increment(i integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
        BEGIN
                RETURN i + 1;
        END;
$$;


CREATE FUNCTION carros.tem_estoque() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    qtd integer;
BEGIN
    qtd:=0;
    select quantidade into qtd from garagens g
    where g.cgc = New.cgc and g.codigo = New.codigo and g.ano = New.ano;
    RAISE INFO 'qtd=%', qtd;
    if (qtd<=0) or qtd is NULL then
        RAISE EXCEPTION 'Nao tem o carro % - ano % em estoque', NEW.codigo, NEW.ano;
    RETURN NULL;
    end if;
    RETURN NEW;
END;
$$;

INSERT INTO carros.automoveis VALUES (1022, '85', 'Ford                ', 'Del Rey             ', 4800.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1051, '88', 'Fiat                ', 'Elba                ', 6200.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1051, '89', 'Fiat                ', 'Elba                ', 7600.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1023, '87', 'Ford                ', 'Escort              ', 7000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1023, '88', 'Ford                ', 'Escort              ', 7800.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1013, '95', 'Volkswagen          ', 'Kombi               ', 12000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1061, '94', 'General Motors      ', 'Monza               ', 18000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1014, '95', 'Volkswagen          ', 'Parati              ', 15200.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1071, '93', 'Gurgel              ', 'BR800               ', 6500.00, 'Brasil              ');
INSERT INTO carros.automoveis VALUES (1081, '90', 'Honda               ', 'Accord              ', 37000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1281, '94', 'Hyundai             ', 'Excel               ', 19500.00, 'Coreia              ');
INSERT INTO carros.automoveis VALUES (1101, '92', 'Lada                ', 'Laika               ', 5500.00, 'Russia              ');
INSERT INTO carros.automoveis VALUES (1101, '93', 'Lada                ', 'Laika               ', 6200.00, 'Russia              ');
INSERT INTO carros.automoveis VALUES (1052, '93', 'Fiat                ', 'Tempra              ', 18800.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1111, '95', 'Suzuki              ', 'Sidekick            ', 36000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1102, '92', 'Lada                ', 'Niva                ', 7800.00, 'Russia              ');
INSERT INTO carros.automoveis VALUES (1071, '94', 'Gurgel              ', 'BR800               ', 7500.00, 'Brasil              ');
INSERT INTO carros.automoveis VALUES (1131, '95', 'Peugeot             ', '205                 ', 11400.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1053, '95', 'Fiat                ', 'Tipo                ', 13000.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1082, '95', 'Honda               ', 'Civic               ', 22870.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1141, '95', 'Audi                ', '80                  ', 52000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1142, '95', 'Audi                ', '100                 ', 60000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1151, '95', 'BMW                 ', '318                 ', 51000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1011, '90', 'Volkswagen          ', 'Apollo              ', 9000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1011, '92', 'Volkswagen          ', 'Apollo              ', 10600.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1014, '94', 'Volkswagen          ', 'Parati              ', 12400.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1061, '88', 'General Motors      ', 'Monza               ', 7500.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1052, '94', 'Fiat                ', 'Tempra              ', 20500.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1023, '89', 'Ford                ', 'Escort              ', 8300.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1051, '90', 'Fiat                ', 'Elba                ', 10800.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1023, '90', 'Ford                ', 'Escort              ', 9000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1021, '89', 'Ford                ', 'Belina              ', 8800.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1033, '95', 'Chevrolet           ', 'Corsa GL            ', 11950.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1011, '93', 'Volkswagen          ', 'Apollo              ', 11100.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1052, '95', 'Fiat                ', 'Tempra              ', 34000.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1161, '95', 'Volvo               ', '460                 ', 40000.00, 'Suecia              ');
INSERT INTO carros.automoveis VALUES (1171, '95', 'Daihatsu            ', 'Charade             ', 20000.00, 'Coreia              ');
INSERT INTO carros.automoveis VALUES (1181, '95', 'Porsche             ', '938 GTS             ', 180000.00, 'UK                  ');
INSERT INTO carros.automoveis VALUES (1132, '95', 'Peugeot             ', '405                 ', 30000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1133, '95', 'Peugeot             ', '605                 ', 55000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1282, '95', 'Hyundai             ', 'Elantra             ', 27000.00, 'Coreia              ');
INSERT INTO carros.automoveis VALUES (1162, '95', 'Volvo               ', '850                 ', 70000.00, 'Suecia              ');
INSERT INTO carros.automoveis VALUES (1191, '95', 'Mercedez Benz       ', 'C200                ', 60000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1122, '95', 'Renault             ', '19                  ', 25000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1022, '86', 'Ford                ', 'Del Rey             ', 6000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1023, '92', 'Ford                ', 'Escort              ', 9700.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1023, '93', 'Ford                ', 'Escort              ', 10800.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1051, '95', 'Fiat                ', 'Elba                ', 18300.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1061, '89', 'General Motors      ', 'Monza               ', 9800.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1103, '92', 'Lada                ', 'Samara              ', 8000.00, 'Russia              ');
INSERT INTO carros.automoveis VALUES (1152, '95', 'BMW                 ', '325                 ', 68000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1153, '95', 'BMW                 ', '530                 ', 93000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1201, '95', 'Ferrari             ', '512                 ', 330000.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1211, '95', 'Land Rover          ', 'Defender            ', 35000.00, 'Inglaterra          ');
INSERT INTO carros.automoveis VALUES (1221, '95', 'Mitsubishi          ', 'Pajero              ', 45000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1231, '95', 'Mazda               ', '626                 ', 36000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1123, '95', 'Renault             ', 'Nevada              ', 27000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1241, '95', 'Rolls Royce         ', 'Corniche            ', 499000.00, 'Inglaterra          ');
INSERT INTO carros.automoveis VALUES (1112, '95', 'Suzuki              ', 'Canvas              ', 15000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1192, '95', 'Mercedez Benz       ', 'C280                ', 70000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1251, '95', 'Toyota              ', 'Paseo               ', 35000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1043, '95', 'Citroen             ', 'ZX                  ', 30000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1021, '88', 'Ford                ', 'Belina              ', 8000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1104, '92', 'Lada                ', 'Pantanal            ', 8500.00, 'Russia              ');
INSERT INTO carros.automoveis VALUES (1023, '91', 'Ford                ', 'Escort              ', 14400.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1032, '92', 'Chevrolet           ', 'Chevette            ', 7200.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1081, '95', 'Honda               ', 'Accord              ', 48000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1022, '87', 'Ford                ', 'Del Rey             ', 7000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1012, '90', 'Volkswagen          ', 'Gol                 ', 7300.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1012, '92', 'Volkswagen          ', 'Gol                 ', 8000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1012, '94', 'Volkswagen          ', 'Gol                 ', 9300.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1031, '95', 'Chevrolet           ', 'Corsa Wind          ', 7350.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1051, '93', 'Fiat                ', 'Elba                ', 12600.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1261, '95', 'Nissan              ', 'Sentra              ', 38000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1113, '95', 'Suzuki              ', 'Vitara              ', 25000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1222, '95', 'Mitsubishi          ', 'Galant              ', 40000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1154, '95', 'BMW                 ', '840                 ', 147000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1232, '95', 'Mazda               ', 'MX                  ', 32000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1252, '95', 'Toyota              ', 'Corolla             ', 38000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1014, '93', 'Volkswagen          ', 'Parati              ', 10800.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1081, '93', 'Honda               ', 'Accord              ', 40000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1061, '93', 'General Motors      ', 'Monza               ', 16000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1061, '90', 'General Motors      ', 'Monza               ', 11000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1014, '90', 'Volkswagen          ', 'Parati              ', 8800.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1044, '95', 'Citroen             ', 'XM                  ', 65000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1124, '95', 'Renault             ', '21                  ', 29000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1202, '95', 'Ferrari             ', '348                 ', 215000.00, 'Italia              ');
INSERT INTO carros.automoveis VALUES (1233, '95', 'Mazda               ', 'Protege             ', 26000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1262, '95', 'Nissan              ', 'Pathfinder          ', 43000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1182, '95', 'Porsche             ', '921 Carrera         ', 140000.00, 'Inglaterra          ');
INSERT INTO carros.automoveis VALUES (1271, '95', 'Daewoo              ', 'Espero              ', 23000.00, 'Coreia              ');
INSERT INTO carros.automoveis VALUES (1041, '94', 'Citroen             ', 'AX                  ', 21000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1021, '87', 'Ford                ', 'Belina              ', 5700.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1212, '95', 'Land Rover          ', 'Discovery           ', 63000.00, 'Inglaterra          ');
INSERT INTO carros.automoveis VALUES (1114, '95', 'Suzuki              ', 'Swift               ', 20000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1193, '95', 'Mercedes Benz       ', 'E280                ', 85000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1172, '95', 'Daihatsu            ', 'Feroza              ', 28000.00, 'Coreia              ');
INSERT INTO carros.automoveis VALUES (1253, '95', 'Toyota              ', 'Previa              ', 68000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1194, '95', 'Mercedes Benz       ', 'S500                ', 170000.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1223, '95', 'Mitsubishi          ', 'Lancer              ', 29000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1022, '89', 'Ford                ', 'Del Rey             ', 9300.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1023, '94', 'Ford                ', 'Escort              ', 12500.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1014, '92', 'Volkswagen          ', 'Parati              ', 9800.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1254, '95', 'Toyota              ', 'Hilux               ', 52000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1115, '95', 'Suzuki              ', 'Samurai             ', 18000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1083, '95', 'Honda               ', 'Legend              ', 90000.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (99000, '02', 'Renault             ', 'Twingo              ', 11890.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1032, '93', 'Chevrolet           ', 'Chevette            ', 7900.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1032, '89', 'Chevrolet           ', 'Chevette            ', 7000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1032, '87', 'Chevrolet           ', 'Chevette            ', 6000.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1032, '84', 'Chevrolet           ', 'Chevette            ', 4300.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1012, '93', 'Volkswagen          ', 'Gol                 ', 8600.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1012, '95', 'Volkswagen          ', 'Gol                 ', 10500.00, 'Alemanha            ');
INSERT INTO carros.automoveis VALUES (1041, '95', 'Citroen             ', 'AX                  ', 25000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (99001, '02', 'Citroen             ', 'C5                  ', 16000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (88374, '99', 'Jac                 ', 'J3                  ', 4800.00, 'Brasil              ');
INSERT INTO carros.automoveis VALUES (957798, '02', 'Ford                ', 'Fiesta              ', 100000.00, 'Brasil              ');
INSERT INTO carros.automoveis VALUES (1300, '17', 'Fiat                ', 'Uno 2016            ', 50000.00, 'Brasil              ');
INSERT INTO carros.automoveis VALUES (1042, '19', 'Citroen             ', 'Xantia              ', 46000.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1121, '95', 'Renault             ', 'Twin                ', 11322.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (1020, '85', 'Ford                ', 'Del Rey             ', 4105.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (1306, '20', 'Suzuki              ', 'Jimmy               ', 66288.00, 'Japao               ');
INSERT INTO carros.automoveis VALUES (1308, '20', 'Peugeot             ', '2008                ', 65817.00, 'Franca              ');
INSERT INTO carros.automoveis VALUES (101, '89', 'Ford                ', 'Ka                  ', 50.00, 'EUA                 ');
INSERT INTO carros.automoveis VALUES (100, '90', 'Ford                ', 'Ka                  ', 100.00, 'EUA                 ');

INSERT INTO carros.consumidores VALUES ('6030-0      ', 'Joao           ', 'Nogueira       ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('5002-2      ', 'Antonio        ', 'Candido        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7450-0      ', 'Vitor          ', 'Assis Brasil   ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('9010-0      ', 'Danuza         ', 'Leao           ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8999-9      ', 'Paulo          ', 'Moska          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7451-1      ', 'Marcos         ', 'Paulo          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('5637-7      ', 'Roberto        ', 'Saturnino Braga', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6228-8      ', 'Benedita       ', 'da Silva       ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7101-1      ', 'Silvio         ', 'Santos         ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('5112-2      ', 'Filipe         ', 'Pinheiro       ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6789-9      ', 'Vicente        ', 'Celestino      ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8981-1      ', 'Gilberto       ', 'Velho          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8894-4      ', 'Tereza         ', 'Raquel         ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('5371-1      ', 'Luis Fernando  ', 'Verissimo      ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('5221-1      ', 'Roseana        ', 'Sarney         ', 'Sao Luiz                 ', 'MA');
INSERT INTO carros.consumidores VALUES ('5222-2      ', 'Luis Inacio    ', 'da Silva       ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('8775-5      ', 'Leonel         ', 'Brizola        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8912-2      ', 'Ulysses        ', 'Guimaraes      ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('9888-8      ', 'Roberto        ', 'Carlos         ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('5598-8      ', 'Marina         ', 'Lima           ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('9753-3      ', 'Caetano        ', 'Veloso         ', 'Salvador                 ', 'BA');
INSERT INTO carros.consumidores VALUES ('9791-1      ', 'Fernando H     ', 'Cardoso        ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('7773-3      ', 'Espiridiao     ', 'Amin           ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('7192-2      ', 'Ricardo        ', ';mes Raimundo  ', 'Paris                    ', 'FR');
INSERT INTO carros.consumidores VALUES ('6675-5      ', 'Rubens         ', 'Barichello     ', 'Jordan                   ', 'F1');
INSERT INTO carros.consumidores VALUES ('5698-8      ', 'Romario        ', 'de Souza Faria ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6565-5      ', 'Claudio        ', 'Besserman Viana', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7659-9      ', 'Joao           ', 'Gilberto       ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6568-8      ', 'Caetano        ', 'Veloso         ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8745-5      ', 'Vera           ', 'Fischer        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6329-9      ', 'Orestes        ', 'Quercia        ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('6551-1      ', 'Adolpho        ', 'Bloch          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7554-4      ', 'Sergio         ', 'Chapellin      ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('9982-2      ', 'Edson          ', 'Arantes        ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('8973-3      ', 'Artur          ', 'Antunes Coimbra', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6435-5      ', 'Boris          ', 'Casoy          ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('7685-5      ', 'Rubens         ', 'Ricupero       ', 'Roma                     ', 'IT');
INSERT INTO carros.consumidores VALUES ('5677-7      ', 'Camila         ', 'Pitanga        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8876-6      ', 'Cid            ', 'Moreira        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('9874-4      ', 'Arthur         ', 'da Tavola      ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('7677-7      ', 'Marisa         ', 'Monte          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8699-9      ', 'Tonia          ', 'Carrero        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7633-3      ', 'Jose Bonifacio ', 'de Oliveira    ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('9444-4      ', 'Otavio         ', 'Mesquita       ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('8763-3      ', 'Eduardo        ', 'Suplicy        ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('7324-4      ', 'Mario          ', 'Covas          ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('6512-2      ', 'Miguel         ', 'Arraes         ', 'Recife                   ', 'PE');
INSERT INTO carros.consumidores VALUES ('9594-4      ', 'Ivo            ', 'Pitanguy       ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7761-1      ', 'Olavo          ', 'Bilac          ', 'Belo Horizonte           ', 'MG');
INSERT INTO carros.consumidores VALUES ('9831-1      ', 'Oswaldo        ', 'Cruz           ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('9785-5      ', 'Marcello       ', 'Alencar        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8922-2      ', 'Roberto        ', 'Campos         ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('5755-5      ', 'Mario          ', 'Amato          ', 'Sao Paulo                ', 'SP');
INSERT INTO carros.consumidores VALUES ('5111-1      ', 'Paulo Cesar    ', 'Farias         ', 'Maceio                   ', 'AL');
INSERT INTO carros.consumidores VALUES ('6738-8      ', 'Roberto        ', 'Marinho        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('5775-5      ', 'Cassia         ', 'Eller          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7119-9      ', 'Claudio        ', 'Taffarel       ', 'Porto Alegre             ', 'RS');
INSERT INTO carros.consumidores VALUES ('7911-1      ', 'Sandra         ', 'Passarinho     ', 'Londres                  ', 'UK');
INSERT INTO carros.consumidores VALUES ('6734-4      ', 'Getulio        ', 'Vargas         ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6662-2      ', 'Paulo Roberto  ', 'Falcao         ', 'Porto Alegre             ', 'RS');
INSERT INTO carros.consumidores VALUES ('8888-8      ', 'Jose           ', 'Sarney         ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('6766-6      ', 'Saulo          ', 'Ramos          ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('9993-3      ', 'Francisco      ', 'Buarque        ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8744-4      ', 'Jose Carlos    ', 'Araujo         ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('7355-5      ', 'Kleber         ', 'Leite          ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('8746-6      ', 'Armando        ', 'Nogueira       ', 'Rio de Janeiro           ', 'RJ');
INSERT INTO carros.consumidores VALUES ('6668-8      ', 'Gutenberg      ', 'Guarabira      ', 'Sobradinho               ', 'BA');
INSERT INTO carros.consumidores VALUES ('6726-6      ', 'Persio         ', 'Arida          ', 'Brasilia                 ', 'DF');
INSERT INTO carros.consumidores VALUES ('1000-1      ', 'João           ', 'Faria          ', 'Rio de Janeiro           ', 'RJ');

INSERT INTO carros.garagens VALUES (1041, '95', 10020, 5);
INSERT INTO carros.garagens VALUES (1051, '88', 10780, 2);
INSERT INTO carros.garagens VALUES (1011, '90', 10340, 2);
INSERT INTO carros.garagens VALUES (1053, '95', 10100, 5);
INSERT INTO carros.garagens VALUES (1021, '89', 10980, 2);
INSERT INTO carros.garagens VALUES (1023, '89', 10930, 4);
INSERT INTO carros.garagens VALUES (1041, '94', 10020, 5);
INSERT INTO carros.garagens VALUES (1121, '95', 10490, 3);
INSERT INTO carros.garagens VALUES (1082, '95', 10010, 2);
INSERT INTO carros.garagens VALUES (1012, '94', 10070, 5);
INSERT INTO carros.garagens VALUES (1051, '89', 10780, 2);
INSERT INTO carros.garagens VALUES (1131, '95', 10510, 3);
INSERT INTO carros.garagens VALUES (1101, '93', 10780, 3);
INSERT INTO carros.garagens VALUES (1013, '95', 10370, 6);
INSERT INTO carros.garagens VALUES (1081, '95', 10870, 2);
INSERT INTO carros.garagens VALUES (1142, '95', 10220, 1);
INSERT INTO carros.garagens VALUES (1014, '95', 10690, 3);
INSERT INTO carros.garagens VALUES (1022, '85', 10520, 1);
INSERT INTO carros.garagens VALUES (1051, '89', 10200, 2);
INSERT INTO carros.garagens VALUES (1041, '95', 10030, 2);
INSERT INTO carros.garagens VALUES (1151, '95', 10810, 1);
INSERT INTO carros.garagens VALUES (1241, '95', 10090, 1);
INSERT INTO carros.garagens VALUES (1132, '95', 10250, 3);
INSERT INTO carros.garagens VALUES (1021, '87', 10360, 2);
INSERT INTO carros.garagens VALUES (1154, '95', 10430, 2);
INSERT INTO carros.garagens VALUES (1012, '94', 10340, 5);
INSERT INTO carros.garagens VALUES (1023, '93', 10450, 3);
INSERT INTO carros.garagens VALUES (1231, '95', 10280, 1);
INSERT INTO carros.garagens VALUES (1111, '95', 10150, 2);
INSERT INTO carros.garagens VALUES (1014, '92', 10540, 3);
INSERT INTO carros.garagens VALUES (1052, '94', 10610, 4);
INSERT INTO carros.garagens VALUES (1051, '90', 10200, 3);
INSERT INTO carros.garagens VALUES (1051, '93', 10200, 5);
INSERT INTO carros.garagens VALUES (1201, '95', 10560, 1);
INSERT INTO carros.garagens VALUES (1043, '95', 10420, 2);
INSERT INTO carros.garagens VALUES (1211, '95', 10540, 1);
INSERT INTO carros.garagens VALUES (1081, '93', 10490, 3);
INSERT INTO carros.garagens VALUES (1252, '95', 10810, 2);
INSERT INTO carros.garagens VALUES (1261, '95', 10310, 1);
INSERT INTO carros.garagens VALUES (1181, '95', 10580, 1);
INSERT INTO carros.garagens VALUES (1044, '95', 10600, 2);
INSERT INTO carros.garagens VALUES (1071, '93', 10740, 3);
INSERT INTO carros.garagens VALUES (1052, '94', 10150, 2);
INSERT INTO carros.garagens VALUES (1152, '95', 10030, 1);
INSERT INTO carros.garagens VALUES (1262, '95', 10490, 1);
INSERT INTO carros.garagens VALUES (1162, '95', 10760, 2);
INSERT INTO carros.garagens VALUES (1113, '95', 10540, 3);
INSERT INTO carros.garagens VALUES (1132, '95', 10120, 2);
INSERT INTO carros.garagens VALUES (1041, '95', 10360, 3);
INSERT INTO carros.garagens VALUES (1172, '95', 10170, 2);
INSERT INTO carros.garagens VALUES (1161, '95', 10700, 1);
INSERT INTO carros.garagens VALUES (1162, '95', 10700, 1);
INSERT INTO carros.garagens VALUES (1102, '92', 10370, 3);
INSERT INTO carros.garagens VALUES (1061, '89', 10030, 2);
INSERT INTO carros.garagens VALUES (1011, '90', 10070, 3);
INSERT INTO carros.garagens VALUES (1022, '89', 10310, 2);
INSERT INTO carros.garagens VALUES (1043, '95', 10100, 2);
INSERT INTO carros.garagens VALUES (1271, '95', 10370, 1);
INSERT INTO carros.garagens VALUES (1113, '95', 10680, 2);
INSERT INTO carros.garagens VALUES (1133, '95', 10600, 2);
INSERT INTO carros.garagens VALUES (1014, '94', 10740, 4);
INSERT INTO carros.garagens VALUES (1014, '94', 10280, 2);
INSERT INTO carros.garagens VALUES (1014, '92', 10780, 3);
INSERT INTO carros.garagens VALUES (1111, '95', 10100, 3);
INSERT INTO carros.garagens VALUES (1041, '94', 10540, 2);
INSERT INTO carros.garagens VALUES (1051, '93', 10780, 2);
INSERT INTO carros.garagens VALUES (99000, '02', 10510, 1);
INSERT INTO carros.garagens VALUES (1061, '94', 10790, 2);
INSERT INTO carros.garagens VALUES (100, '90', 10010, 5);
INSERT INTO carros.garagens VALUES (1281, '94', 10280, 1);

INSERT INTO carros.negocios VALUES (1111, '95', 10460, '7685-5      ', '1995-08-15', 8250.00);
INSERT INTO carros.negocios VALUES (1051, '90', 10980, '7119-9      ', '1995-06-29', 11000.00);
INSERT INTO carros.negocios VALUES (1121, '95', 10140, '6738-8      ', '1995-03-09', 61500.00);
INSERT INTO carros.negocios VALUES (1053, '95', 10780, '6675-5      ', '1995-05-05', 14000.00);
INSERT INTO carros.negocios VALUES (1021, '89', 10310, '5598-8      ', '1995-07-21', 9100.00);
INSERT INTO carros.negocios VALUES (1121, '95', 10500, '5111-1      ', '1995-02-22', 63000.00);
INSERT INTO carros.negocios VALUES (1131, '95', 10010, '8894-4      ', '1995-05-20', 15000.00);
INSERT INTO carros.negocios VALUES (1151, '95', 10170, '8775-5      ', '1995-08-25', 53000.00);
INSERT INTO carros.negocios VALUES (1071, '94', 10040, '5222-2      ', '1995-03-13', 6900.00);
INSERT INTO carros.negocios VALUES (1052, '95', 10200, '6568-8      ', '1995-04-10', 21600.00);
INSERT INTO carros.negocios VALUES (1023, '89', 10930, '7554-4      ', '1995-04-15', 9000.00);
INSERT INTO carros.negocios VALUES (1011, '90', 10340, '8973-3      ', '1995-02-05', 9300.00);
INSERT INTO carros.negocios VALUES (1141, '95', 10090, '9594-4      ', '1995-03-20', 54000.00);
INSERT INTO carros.negocios VALUES (1053, '95', 10120, '8745-5      ', '1995-05-15', 13900.00);
INSERT INTO carros.negocios VALUES (1102, '92', 10660, '9444-4      ', '1995-05-07', 8000.00);
INSERT INTO carros.negocios VALUES (1121, '95', 10490, '5111-1      ', '1995-02-12', 13400.00);
INSERT INTO carros.negocios VALUES (1131, '95', 10140, '8912-2      ', '1995-03-24', 13800.00);
INSERT INTO carros.negocios VALUES (1014, '95', 10690, '6329-9      ', '1995-01-15', 16800.00);
INSERT INTO carros.negocios VALUES (1111, '95', 10240, '7192-2      ', '1995-03-22', 40000.00);
INSERT INTO carros.negocios VALUES (1051, '88', 10780, '7451-1      ', '1995-03-23', 7800.00);
INSERT INTO carros.negocios VALUES (1033, '95', 10080, '5698-8      ', '1995-05-02', 14400.00);
INSERT INTO carros.negocios VALUES (1061, '94', 10790, '5221-1      ', '1995-04-15', 19500.00);
INSERT INTO carros.negocios VALUES (1022, '85', 10520, '6568-8      ', '2018-11-08', 5000.00);
INSERT INTO carros.negocios VALUES (1281, '94', 10280, '9874-4      ', '1995-01-30', 20500.00);

INSERT INTO carros.revendedoras VALUES (10010, 'Self Car            ', 'RJ', 'Rio de Janeiro           ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10330, 'Dirija              ', 'RJ', 'Campos                   ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10030, 'Bahia Veiculos      ', 'BA', 'Ilheus                   ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10690, 'Sopave              ', 'RJ', 'Rio de Janeiro           ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10640, 'Biguacu             ', 'PR', 'Curitiba                 ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10200, 'Izio                ', 'RJ', 'Petropolis               ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10050, 'Fracalanza          ', 'MG', 'Belo Horizonte           ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10510, 'Del Serra           ', 'RJ', 'Petropolis               ', '6675-5      ');
INSERT INTO carros.revendedoras VALUES (10840, 'Trevendedorasille   ', 'ES', 'Vila Velha               ', '6675-5      ');
INSERT INTO carros.revendedoras VALUES (10270, 'Lian                ', 'RJ', 'Campos                   ', '6675-5      ');
INSERT INTO carros.revendedoras VALUES (10240, 'Carrocar            ', 'SP', 'Campinas                 ', '6675-5      ');
INSERT INTO carros.revendedoras VALUES (10120, 'Rivel               ', 'SP', 'Sao Paulo                ', '6675-5      ');
INSERT INTO carros.revendedoras VALUES (10100, 'Self Car            ', 'BA', 'Salvador                 ', '8981-1      ');
INSERT INTO carros.revendedoras VALUES (10020, 'Courcelles          ', 'BA', 'Salvador                 ', '8981-1      ');
INSERT INTO carros.revendedoras VALUES (10540, 'Superauto           ', 'BA', 'Feira de Santana         ', '8981-1      ');
INSERT INTO carros.revendedoras VALUES (10170, 'Exclusive           ', 'DF', 'Brasilia                 ', '8981-1      ');
INSERT INTO carros.revendedoras VALUES (10630, 'Lyon                ', 'SP', 'Ribeirao Preto           ', '8981-1      ');
INSERT INTO carros.revendedoras VALUES (10060, 'Deluxe              ', 'SP', 'Sao Paulo                ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10500, 'Joauto              ', 'MG', 'Juiz de Fora             ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10110, 'Self Car            ', 'ES', 'Vitoria                  ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10480, 'Tradicao            ', 'AM', 'Manaus                   ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10770, 'Eufrasio Veiculos   ', 'PR', 'Londrina                 ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10140, 'Exclusive           ', 'RJ', 'Rio de Janeiro           ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10180, 'Libra               ', 'PE', 'Olinda                   ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10360, 'Dirija              ', 'SP', 'Diadema                  ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10580, 'Autohaus            ', 'MG', 'Betim                    ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10290, 'Capricornio         ', 'MG', 'Belo Horizonte           ', '6565-5      ');
INSERT INTO carros.revendedoras VALUES (10880, 'Galileo             ', 'PI', 'Teresina                 ', '8999-9      ');
INSERT INTO carros.revendedoras VALUES (10960, 'Quorum              ', 'AM', 'Manaus                   ', '7451-1      ');
INSERT INTO carros.revendedoras VALUES (10490, 'Hobby               ', 'PA', 'Belem                    ', '7451-1      ');
INSERT INTO carros.revendedoras VALUES (10520, 'New Center          ', 'SP', 'Sao Carlos               ', '7451-1      ');
INSERT INTO carros.revendedoras VALUES (10660, 'Vimave              ', 'RS', 'Porto Alegre             ', '7451-1      ');
INSERT INTO carros.revendedoras VALUES (10430, 'Tania               ', 'DF', 'Brasilia                 ', '7451-1      ');
INSERT INTO carros.revendedoras VALUES (10790, 'Caltabiano          ', 'PE', 'Recife                   ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10970, 'Tiana               ', 'MG', 'Betim                    ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10410, 'Abolicao            ', 'MG', 'Belo Horizonte           ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10870, 'Fiorelli            ', 'SP', 'Sao Paulo                ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10340, 'Dirija              ', 'RJ', 'Angra dos Reis           ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10930, 'Elivel              ', 'SP', 'Santos                   ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10150, 'Exclusive           ', 'SP', 'Guaruja                  ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10339, 'Tania               ', 'SC', 'Florianopolis            ', '6568-8      ');
INSERT INTO carros.revendedoras VALUES (10800, 'Semap               ', 'SP', 'Sao Paulo                ', '6228-8      ');
INSERT INTO carros.revendedoras VALUES (10460, 'Tania               ', 'DF', 'Distrito Federal         ', '7101-1      ');
INSERT INTO carros.revendedoras VALUES (10980, 'Sul Dive            ', 'RS', 'Porto Alegre             ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10040, 'Fracalanza          ', 'PE', 'Olinda                   ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10750, 'La Penna            ', 'RJ', 'Rio de Janeiro           ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10650, 'Enseada             ', 'SC', 'Florianopolis            ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10780, 'Santo Amaro         ', 'ES', 'Vitoria                  ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10370, 'Dirija              ', 'PR', 'Londrina                 ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10070, 'Katai               ', 'RJ', 'Rio de Janeiro           ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10230, 'Overcar             ', 'RS', 'Porto Alegre             ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10250, 'Carrocar            ', 'AM', 'Manaus                   ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10760, 'Duarte Chaves       ', 'RJ', 'Angra dos Reis           ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10740, 'Premier             ', 'MG', 'Juiz de fora             ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (10310, 'Lian                ', 'PE', 'Recife                   ', '7192-2      ');
INSERT INTO carros.revendedoras VALUES (849274, 'RevDoHugo           ', 'RJ', 'RJ                       ', '8745-5      ');
INSERT INTO carros.revendedoras VALUES (849275, 'RevDoHugo2          ', 'RJ', 'RJ                       ', '8745-5      ');
INSERT INTO carros.revendedoras VALUES (849276, 'RevDoHugo3          ', 'MG', 'MG                       ', '8745-5      ');
INSERT INTO carros.revendedoras VALUES (10890, 'Master              ', 'PR', 'Londrina                 ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10130, 'Rivel               ', 'RJ', 'Itaborai                 ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10810, 'Mirafiori           ', 'RJ', 'Rio de Janeiro           ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10220, 'Rio Motor           ', 'RJ', 'Rio de Janeiro           ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10080, 'Self Car            ', 'PE', 'Recife                   ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10090, 'Self Car            ', 'PR', 'Curitiba                 ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10700, 'Brasilwagen         ', 'RJ', 'Rio de Janeiro           ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10560, 'Davox               ', 'RN', 'Natal                    ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10680, 'Vipa                ', 'RJ', 'Resende                  ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10420, 'Cavox               ', 'PE', 'Recife                   ', '5698-8      ');
INSERT INTO carros.revendedoras VALUES (10210, 'Izio                ', 'ES', 'Vitoria                  ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10280, 'Lian                ', 'RS', 'Bage                     ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10610, 'Mirage              ', 'BA', 'Salvador                 ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10600, 'Deck                ', 'PR', 'Maringa                  ', '9753-3      ');
INSERT INTO carros.revendedoras VALUES (10450, 'Tania               ', 'SP', 'Sao Paulo                ', '9753-3      ');

ALTER TABLE ONLY carros.automoveis
    ADD CONSTRAINT automoveis_pkey PRIMARY KEY (codigo, ano);

ALTER TABLE ONLY carros.consumidores
    ADD CONSTRAINT consumidores_pkey PRIMARY KEY (cpf);

ALTER TABLE ONLY carros.garagens
    ADD CONSTRAINT garagens_pkey PRIMARY KEY (codigo, ano, cgc);

ALTER TABLE ONLY carros.negocios
    ADD CONSTRAINT negocios_pkey PRIMARY KEY (codigo, ano, cgc, cpf);

ALTER TABLE ONLY carros.revendedoras
    ADD CONSTRAINT revendedoras_pk PRIMARY KEY (cgc);

CREATE TRIGGER tg_tem_estoque BEFORE INSERT OR UPDATE ON carros.negocios FOR EACH ROW EXECUTE PROCEDURE carros.tem_estoque();

ALTER TABLE ONLY carros.garagens
    ADD CONSTRAINT garagens_automoveis_fk FOREIGN KEY (codigo, ano) REFERENCES carros.automoveis(codigo, ano);

ALTER TABLE ONLY carros.garagens
    ADD CONSTRAINT garagens_revendedoras_fk FOREIGN KEY (cgc) REFERENCES carros.revendedoras(cgc);

ALTER TABLE ONLY carros.negocios
    ADD CONSTRAINT negocios_automoveis_fk FOREIGN KEY (codigo, ano) REFERENCES carros.automoveis(codigo, ano);

ALTER TABLE ONLY carros.negocios
    ADD CONSTRAINT negocios_cpf_fk FOREIGN KEY (cpf) REFERENCES carros.consumidores(cpf);

ALTER TABLE ONLY carros.negocios
    ADD CONSTRAINT negocios_revenda_fk FOREIGN KEY (cgc) REFERENCES carros.revendedoras(cgc);

ALTER TABLE ONLY carros.revendedoras
    ADD CONSTRAINT revendedoras_cpf_fk FOREIGN KEY (proprietario) REFERENCES carros.consumidores(cpf);
