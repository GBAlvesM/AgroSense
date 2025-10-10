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
nomeArea VARCHAR(45),
fkHectare int,
CONSTRAINT fkHectare FOREIGN KEY(fkSubHectare) REFERENCES hectare(idHectare)
);

CREATE TABLE sensores(
idSensores INT PRIMARY KEY AUTO_INCREMENT,
fkSubAreas INT, 
CONSTRAINT fkSubArea FOREIGN KEY(fkSubAreas) REFERENCES subAreas(idSubArea),
fkSubAreaHect INT,
CONSTRAINT fkSubAreaHect FOREIGN KEY (fkSubAreaHect) REFERENCES subAreas(fkHectare),
dtInstalacao DATE
);

CREATE TABLE medicao(
idMedicao INT PRIMARY KEY AUTO_INCREMENT,
umidade INT,
fksensor INT,
CONSTRAINT fkMedicaoSensor FOREIGN KEY(fksensor) REFERENCES sensores(idSensores),
dtMedicao DATETIME
);




show tables;






