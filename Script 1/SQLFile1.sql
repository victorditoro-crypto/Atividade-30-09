-- CRIANDO O BANCO

CREATE DATABASE oficina_mecanica_db;
GO

USE oficina_mecanica_db;
GO


-- TABELA CLIENTES

CREATE TABLE Clientes
(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);
GO


-- TABELA VEICULOS

CREATE TABLE Veiculos
(
    id_veiculo INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    chassi VARCHAR(30) NOT NULL UNIQUE,

    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
GO


-- TABELA MECANICOS

CREATE TABLE Mecanicos
(
    id_mecanico INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    funcao VARCHAR(100) NOT NULL
);
GO


-- TABELA ORDENS DE SERVICO

CREATE TABLE OrdensServico
(
    id_ordem INT IDENTITY(1,1) PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_mecanico INT NOT NULL,
    data_abertura DATETIME NOT NULL,
    estimativa_entrega DATETIME NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanicos(id_mecanico)
);
GO


-- INSERINDO CLIENTES

INSERT INTO Clientes
VALUES
('João da Silva',
 '123.456.789-00',
 '(14) 99876-1234',
 'joao.silva@email.com',
 'Rua das Flores, 100',
 'Botucatu');

SELECT * FROM Clientes;


INSERT INTO Clientes
VALUES
('Mariana de Oliveira',
 '987.654.321-00',
 '(14) 99123-4567',
 'mariana.oliveira@email.com',
 'Rua São Paulo, 200',
 'Pardinho');

SELECT * FROM Clientes;


INSERT INTO Clientes
VALUES
('Carlos Menezes',
 '321.987.654-11',
 '(14) 99654-3210',
 'carlos.mennezis@email.com',
 'Rua Central, 300',
 'São Manuel');

SELECT * FROM Clientes;


INSERT INTO Clientes
VALUES
('Ana Beatriz de Souza',
 '456.789.123-22',
 '(14) 99444-8899',
 'ana.souza@email.com',
 'Avenida Brasil, 400',
 'Botucatu');

SELECT * FROM Clientes;


-- INSERINDO VEICULOS

INSERT INTO Veiculos
VALUES
(1,
 'ABC1A23',
 'Fiat',
 'Uno',
 2015,
 '9BWZZZ377VT004251');

SELECT * FROM Veiculos;


INSERT INTO Veiculos
VALUES
(2,
 'XYZ9Z99',
 'Chevrolet',
 'Onix',
 2020,
 '9BG116GW04C400001');

SELECT * FROM Veiculos;


INSERT INTO Veiculos
VALUES
(3,
 'JKL3D45',
 'Toyota',
 'Corolla',
 2018,
 '8AJZZZ123J1234567');

SELECT * FROM Veiculos;


INSERT INTO Veiculos
VALUES
(4,
 'QWE7E77',
 'Honda',
 'Fit',
 2017,
 '93HGE8850EZ500123');

SELECT * FROM Veiculos;


-- INSERINDO MECANICOS

INSERT INTO Mecanicos
VALUES
('Rafael dos Santos',
 '888.999.000-11',
 '(14) 99777-1234',
 'rafael.santos@autotechnology.com',
 '2025-01-01',
 'Mecânico Geral');

SELECT * FROM Mecanicos;


INSERT INTO Mecanicos
VALUES
('Luciana Fernandes',
 '777.888.999-22',
 '(14) 99666-4567',
 'luciana.fernandes@autotechnology.com',
 '2025-06-15',
 'Especialista em Freios');

SELECT * FROM Mecanicos;


INSERT INTO Mecanicos
VALUES
('Pedro Almeida',
 '666.777.888-33',
 '(14) 99555-7890',
 'pedro.almeida@autotechnology.com',
 '2023-09-10',
 'Eletricista Automotivo');

SELECT * FROM Mecanicos;


INSERT INTO Mecanicos
VALUES
('Carla Monteiro',
 '555.666.777-44',
 '(14) 99444-3210',
 'carla.monteiro@autotechnology.com',
 '2024-06-01',
 'Mecânica de Veículos Leves');

SELECT * FROM Mecanicos;


-- INSERINDO ORDENS DE SERVICO

INSERT INTO OrdensServico
VALUES
(1,
 1,
 '2025-09-20 08:30:00',
 '2025-09-21 08:30:00',
 'Troca de óleo e filtro',
 150.00,
 'Concluída');

SELECT * FROM OrdensServico;


INSERT INTO OrdensServico
VALUES
(2,
 2,
 '2025-09-21 10:00:00',
 '2025-09-23 10:00:00',
 'Substituição de pastilhas de freio dianteiras',
 300.00,
 'Em Andamento');

SELECT * FROM OrdensServico;


INSERT INTO OrdensServico
VALUES
(3,
 3,
 '2025-09-22 14:15:00',
 '2025-09-23 08:00:00',
 'Diagnóstico de falha no sistema elétrico',
 120.00,
 'Aberta');

SELECT * FROM OrdensServico;


INSERT INTO OrdensServico
VALUES
(4,
 4,
 '2025-09-23 09:45:00',
 '2025-09-24 09:45:00',
 'Alinhamento e balanceamento',
 100.00,
 'Cancelada');

SELECT * FROM OrdensServico;


-- ATUALIZANDO O VEICULO

UPDATE Veiculos
SET modelo = 'Civic'
WHERE placa = 'QWE7E77';

SELECT * FROM Veiculos;


-- ATUALIZANDO O EMAIL DO CARLOS

UPDATE Clientes
SET email = 'carlos.menezes@email.com'
WHERE cpf = '321.987.654-11';

SELECT * FROM Clientes;


-- EXCLUINDO A ORDEM DA ANA

DELETE FROM OrdensServico
WHERE id_ordem = 4;

SELECT * FROM OrdensServico;
