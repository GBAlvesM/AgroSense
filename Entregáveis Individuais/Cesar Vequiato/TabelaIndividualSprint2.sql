-- CRIANDO BANCO DE DADOS
CREATE DATABASE batatech;
USE batatech;

-- CRIANDO TABELA usuario
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
cnpj VARCHAR(18) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
CONSTRAINT chkEmail CHECK(email LIKE '%@%'),
senha VARCHAR(20) NOT NULL,
nome VARCHAR(50) NOT NULL, 
cep CHAR(8) NOT NULL,
fkProducao INT UNIQUE,
CONSTRAINT fkProducaoUsuario
	FOREIGN KEY (fkProducao)
		REFERENCES producao(idProducao)
);

-- CRIANDO TABELA sensor de umidade
CREATE TABLE sensorUmidade (
idSensorUmidade INT PRIMARY KEY AUTO_INCREMENT,
umidade INT NOT NULL,
dataLeitura DATETIME DEFAULT current_timestamp,
fkProducao INT UNIQUE, 
CONSTRAINT fkProducaoSensorUmidade 
	FOREIGN KEY (fkProducao)
		REFERENCES producao(idProducao)
);

-- CRIAÇÃO DA TABELA producao
CREATE TABLE producao(
idProducao INT PRIMARY KEY AUTO_INCREMENT,
dataColheita DATETIME NOT NULL,
haPlantados INT NOT NULL, 
quilosColhidos INT NOT NULL
);


-- INSERINDO DADOS TABELA usuario
INSERT INTO usuario (cnpj, email, senha, nome, cep, fkProducao) VALUES
('72.235.123/0001-12','batata@frita.com','euamobatata','Batata Frita','31894057',1 ),
('12.345.432/0001-21','pure@batata.com','ilovebatata','Pure', '70937812', 2),
('72.235.123/0001-12','jose@fritas.com','salgadinho','Jose Batata', '18239403', 3),
('12.345.432/0001-21','joyce@fritas.com','batatinha123','Joyce Pure', '79036451', 4);

SELECT * FROM usuario;

-- INSERINDO DADOS TABELA logSensor
INSERT INTO sensorUmidade (umidade) VALUES
(29),
(30),
(32);

SELECT * FROM sensorUmidade;

-- INSERÇÃO DADOS NA TABELA producao
INSERT INTO producao(dataColheita, haPlantados, quilosColhidos)  VALUES
('2025-06-01', 5000 ,125000000),
('2025-08-10', 2000, 44000000),
('2024-01-01', 6000,156000000);

SELECT * FROM producao;


-- FILTRANDO AS CONDIÇÕES DO SOLO DE ACORDO COM OS SENSORES
SELECT idSensorUmidade, umidade AS 'Umidade em %', dataLeitura, 
CASE 
	WHEN sensorUmidade > 80.00 THEN 'Solo muito umido!'
    WHEN sensorUmidade < 60.00 THEN 'Solo muito seco!'
ELSE 'Solo adequado!'
END AS 'Situação da Umidade'
FROM sensorUmidade;

-- ORDENANDO A TABELA USUARIO POR EMPRESA
SELECT * FROM usuario
	ORDER BY cnpj;
    

-- SELECT TABELA producao RETORNA A ESTAÇÃO QUE FOI PLANTADA
SELECT dataColheita, haPlantados, quilosColhidos,
CASE
	WHEN MONTH(dataColheita)IN(12,01,02)  THEN 'VERÃO'
    WHEN MONTH(dataColheita)IN(03,04,05) THEN 'OUTONO'
    WHEN MONTH(dataColheita)IN(06,07,08) THEN 'INVERNO'
    WHEN MONTH(dataColheita)IN(09,10,11) THEN 'PRIMAVERA'
END AS 'Estação Colhida'
FROM producao;