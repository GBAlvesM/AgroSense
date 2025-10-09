CREATE DATABASE agrosense;
use agrosense;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(75),
email VARCHAR(100) NOT NULL UNIQUE,
CONSTRAINT chkEmail CHECK(email LIKE '%@%'),
senha VARCHAR(50) NOT NULL,
telefone CHAR(11),
cnpj CHAR(14),
dtCadastro DATE,
cep CHAR(9),
numEndereco INT
);

CREATE TABLE hectare(
idHectare INT PRIMARY KEY AUTO_INCREMENT,
nomeHectare VARCHAR(45) NOT NULL,
kgPlantada INT NOT NULL,
fkUsuario INT,
CONSTRAINT fkUsuario FOREIGN KEY(fkUsuario) REFERENCES usuario(idUsuario)
);


CREATE TABLE subAreas(
idSubArea INT,
fkSubHectare INT,
CONSTRAINT fkSubHect PRIMARY KEY (idSubArea, fkSubHectare),
nomeArea VARCHAR(45),
CONSTRAINT fkHectare FOREIGN KEY(fkSubHectare) REFERENCES hectare(idHectare)
);

CREATE TABLE sensores(
idSensores INT PRIMARY KEY AUTO_INCREMENT,
identi VARCHAR(40),
dtInstalacao DATE,
fkSubAreas INT, 
CONSTRAINT fkSubArea FOREIGN KEY(fkSubAreas) REFERENCES subAreas(idSubArea)
);

CREATE TABLE medicao(
idMedicao INT PRIMARY KEY AUTO_INCREMENT,
umidade INT,
fksensor INT,
CONSTRAINT fkMedicaoSensor FOREIGN KEY(fksensor) REFERENCES sensores(idSensores)
);

-- INSERT TABELA USUARIO
INSERT INTO usuario(nomeEmpresa, email, senha, telefone, cnpj, dtCadastro, cep, numEndereco) VALUES
('v8Tech', 'v8tech@email.teste', 'v812345', '11987654121', '12345678900001', '2025-02-12', '000000000', '45'),
('C6 Bank', 'c6bank@email.teste','c612345', '11987654321',  '43345678900004','2025-08-02', '000000001', '46'),
('Bradesco', 'bradesco@email.com', 'bra12345', '11987654321',  '12345678940007','2025-05-21', '000000002', '47'),
('ToTvs', 'ToTvs@email.com', 'totvs12345', '11987654321', '12345678904509' ,'2025-07-30', '000000003', '48');

-- INSERT TABLE hectare
INSERT INTO hectare (nomeHectare,KgPlantada,fkUsuario) VALUES
('Hectare01','450',3),
('Hectare02','600',2),
('Hectare03','1500',4),
('Hectare04','2340',1);

-- INSERT TABELA subAreas

INSERT INTO subAreas (idSubArea,fkSubHectare,nomeArea) VALUES
(1,1, 'subArea 01'),
(2,1, 'subArea 02'),
(1,2, 'subArea 01'),
(2,2, 'subArea 02');

-- INSERT TABELA sensores
-- modificar tabela sensores adicionando modelo de autoRelação
insert into sensores(identi,dtInstalacao, fkSubAreas, idSubArea)values
('3015','2025-08-10', 1),
('2116','2025-07-18', 2),
('2213','2025-09-05', 3),
('2314','2025,10,28', 4);




