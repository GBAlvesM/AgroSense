use batatech;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
cnpj VARCHAR(18) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
CONSTRAINT chkEmail CHECK(email LIKE '%@%'),
senha VARCHAR(20) NOT NULL,
nome VARCHAR(50) NOT NULL,
fkHectar INT UNIQUE,
CONSTRAINT fkHectaresEmpresa
	FOREIGN KEY (fkHectar)
		REFERENCES hectar(idHectar)
);

INSERT empresa (cnpj, email, senha, nome, fkHectar) VALUES 
('12.345.678/0001-90', 'contato@agroverde.com', 'senha123', 'Agro Verde LTDA', 1),
('98.765.432/0001-10', 'suporte@fazendaouro.com', 'senha456', 'Fazenda Ouro Agro', 2),
('55.444.333/0001-77', 'admin@campoazul.com', 'senha789', 'Campo Azul S.A', 3);

SELECT * FROM empresa;

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
umidade INT NOT NULL,
dataSensor DATETIME,
fkHectar INT UNIQUE, 
CONSTRAINT fkHectarSensor
	FOREIGN KEY (fkHectar)
		REFERENCES hectar(idHectar)
);

INSERT Sensor (umidade, dataSensor, fkHectar)VALUES 
(65, '2025-09-01 08:30:00', 1),
(72, '2025-09-02 09:45:00', 2),
(80, '2025-09-03 10:15:00', 3);

SELECT * FROM sensorUmidade;

CREATE TABLE hectar(
idHectar INT PRIMARY KEY AUTO_INCREMENT,
dataColheita DATETIME NOT NULL,
haPlantados INT NOT NULL, 
quilosColhidos INT NOT NULL
);

INSERT hectar (dataColheita, haPlantados, quilosColhidos) VALUES 
('2025-05-10 00:00:00', 50, 12000),
('2025-06-15 00:00:00', 80, 20000),
('2025-07-20 00:00:00', 100, 25000);

SELECT * FROM hectar;

SELECT e.nome AS Empresa, e.email, h.haPlantados, h.quilosColhidos, 
       s.umidade, s.dataSensor
FROM empresa e
JOIN hectar h ON e.fkHectar = h.idHectar
JOIN Sensor s ON h.idHectar = s.fkHectar;