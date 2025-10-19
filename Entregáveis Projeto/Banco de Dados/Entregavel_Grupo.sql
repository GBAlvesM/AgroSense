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


CREATE TABLE subArea(
idSubArea INT,
nomeArea VARCHAR(45),
fkHectare int,
PRIMARY KEY (idSubArea, fkHectare),
CONSTRAINT fkHectare FOREIGN KEY(fkHectare) REFERENCES hectare(idHectare)
);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
subArea_id INT, 
CONSTRAINT fkSubAreaSensor FOREIGN KEY(subArea_id) REFERENCES subArea(idSubArea),
fkSubHect INT,
CONSTRAINT fkSubAreaHectRegra FOREIGN KEY (fkSubHect) REFERENCES subArea(fkHectare),
dtInstalacao DATE
);

CREATE TABLE medicao(
idMedicao INT PRIMARY KEY AUTO_INCREMENT,
umidade DECIMAL(4,1),
fksensor INT,
CONSTRAINT fkMedicaoSensor FOREIGN KEY(fksensor) REFERENCES sensor(idSensor),
dtMedicao DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- --------------------------------------- INSERT DAS TABELAS -----------------------------------------

INSERT INTO usuario(nomeEmpresa, email, senha, telefone, cnpj, dtCadastro, cep, numEndereco) VALUES
('v8Tech', 'v8tech@email.teste', 'v812345', '11987654121', '12345678900001', '2025-02-12', '000000000', '45'),
('C6 Bank', 'c6bank@email.teste','c612345', '11987654321',  '43345678900004','2025-08-02', '000000001', '46'),
('Bradesco', 'bradesco@email.com', 'bra12345', '11987654321',  '12345678940007','2025-05-21', '000000002', '47'),
('ToTvs', 'ToTvs@email.com', 'totvs12345', '11987654321', '12345678904509' ,'2025-07-30', '000000003', '48');

INSERT INTO hectare(nomeHectare,kgPlantada,fkUsuario) VALUES
('Hectare 1', 400, 3),
('Hectare 1', 450, 4),
('Hectare 1', 600, 1),
('Hectare 1', 573, 2);

INSERT INTO subArea(idSubArea,nomeArea,fkHectare) VALUES
(1, 'SubÁrea 1', 1),
(2, 'SubÁrea 2', 1),
(1, 'SubÁrea 1', 2),
(2, 'SubÁrea 2', 2),
(1, 'SubÁrea 1', 3),
(2, 'SubÁrea 2', 3),
(1, 'SubÁrea 1', 4),
(2, 'SubÁrea 2', 4);

INSERT INTO sensor(subArea_id, fkSubHect, dtInstalacao) VALUES
(1, 1, '2022-06-13'),
(2, 1, '2022-07-12'),
(1, 2, '2022-08-11'),
(2, 2, '2022-09-10'),
(1, 3, '2023-10-09'),
(2, 3, '2023-11-08'),
(1, 4, '2024-03-02'),
(2, 4, '2024-04-04');

INSERT INTO medicao(fksensor, umidade) VALUES 
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(6, 10),
(7, 10),
(8, 10);

SELECT
e.nomeEmpresa,
h.nomeHectare,
h.kgPlantada,
sa.nomeArea,
s.idSensor,
-- m.umidade,
s.dtInstalacao
FROM  sensor as s
JOIN 
    subArea as sa ON s.subArea_id = sa.idSubArea AND s.fkSubHect = sa.fkHectare
JOIN 
    hectare AS h ON sa.fkHectare = h.idHectare
JOIN 
usuario as e on e.idUsuario = h.fkUsuario;







