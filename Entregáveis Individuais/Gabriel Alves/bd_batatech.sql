CREATE DATABASE batatech;

USE batatech;

CREATE TABLE cadastro (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(75),
email VARCHAR(100) NOT NULL UNIQUE,
senha VARCHAR(50) NOT NULL,
perfil VARCHAR(7),
CONSTRAINT chkPerfil CHECK(perfil = 'Admin' OR perfil = 'Usuario'),
dtCriacao DATETIME DEFAULT current_timestamp
);


CREATE TABLE hectare (
idHectare INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
areaPlantada DECIMAL(6,2) NOT NULL,
qtdPlantada DECIMAL(10,2) NOT NULL
);

CREATE TABLE sensores (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(11) NOT NULL,
CONSTRAINT chkTipo CHECK(tipo = 'Umidade' OR tipo = 'Temperatura'),
loc VARCHAR(30) NOT NULL,
fkHectare INT  -- chave estrangeira para relacionar com cada hectare
)AUTO_INCREMENT = 100;

CREATE TABLE medicoes (
idMedicao INT PRIMARY KEY AUTO_INCREMENT,
fkSensor INT,-- chave estrangeira para relacionar com qual sensor fez a captura
valor DECIMAL(3,2),
unidade VARCHAR(3),
dtCaptura DATETIME DEFAULT current_timestamp
) AUTO_INCREMENT = 500;


