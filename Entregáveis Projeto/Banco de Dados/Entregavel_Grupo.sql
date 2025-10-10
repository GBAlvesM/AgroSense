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
dtMedicao DATETIME
);








