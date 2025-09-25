CREATE DATABASE batatech;
USE batatech;

CREATE TABLE usuario (
idusuario INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(50),
cpf VARCHAR(14) unique,
email VARCHAR(40) not null unique, 
telefone char(11) not null, 
senha VARCHAR(20) NOT NULL,
empresa varchar(50),
 constraint fk_usuario_endereco
        foreign key (idEndereco) 
			references endereco(idEndereco)
);

create table sensor (
idsensor int primary key auto_increment,
sensorTemperatura decimal(5,2),
sensorUmidade decimal(5,2),
dataLeitura datetime default current_timestamp,
);

create table producao (
idproducao int primary key auto_increment,
dataColheita date,
haPlantados int, 
quilosColhidos int,
constraint fk_producao_usuario
        foreign key (idUsuario) 
			references usuario(idusuario)
);

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
logradouro varchar(130) not null, 
numero varchar(10) not null,
complemento varchar(130),
cidade varchar(100) not null,
cep char(8) not null
);


INSERT INTO usuario (nome, cpf, email, telefone, senha) VALUES
('Ana Silva', '123.456.789-01', 'ana.silva@email.com', '11987654321', 'senha123'),
('Bruno Costa', '987.654.321-00', 'bruno.costa@email.com', '21991234567', 'abc12345'),
('Carla Souza', '456.789.123-99', 'carla.souza@email.com', '31999887766', 'minhaSenha'),
('Diego Ramos', '321.654.987-55', 'diego.ramos@email.com', '41988776655', 'teste@2025'),
('Eduarda Lima', '111.222.333-44', 'eduarda.lima@email.com', '51977665544', 'qwerty');


INSERT INTO Sensor (sensorTemperatura, sensorUmidade) VALUES
(25.30, 60.5),
(27.10, 58.2),
(23.85, 65.0),
(29.00, 55.3),
(26.75, 62.1);


INSERT INTO producao (dataColheita, haPlantados, quilosColhidos) VALUES
('2025-01-15', 10, 2500),
('2025-02-20', 8, 1900),
('2025-03-05', 12, 3100),
('2025-04-12', 7, 1600),
('2025-05-30', 15, 4000);


SELECT idsensor, sensorTemperatura, sensorUmidade AS 'Umidade em %', dataLeitura, 
CASE 
	WHEN sensorTemperatura > 22.00 THEN 'Solo muito quente!'
	WHEN sensorTemperatura < 15.00 THEN 'Solo muito frio!'
ELSE 'Solo adequado!' 
END AS 'Situação da Temperatura',
CASE 
	WHEN sensorUmidade > 80.00 THEN 'Solo muito umido!'
    WHEN sensorUmidade < 60.00 THEN 'Solo muito seco!'
ELSE 'Solo adequado!'
END AS 'Situação da Umidade'
FROM Sensor;


SELECT * FROM usuario
	ORDER BY cpf;
    
SELECT dataColheita, haPlantados, quilosColhidos,
CASE
	WHEN MONTH(dataColheita)IN(12,01,02)  THEN 'VERÃO'
    WHEN MONTH(dataColheita)IN(03,04,05) THEN 'OUTONO'
    WHEN MONTH(dataColheita)IN(06,07,08) THEN 'INVERNO'
    WHEN MONTH(dataColheita)IN(09,10,11) THEN 'PRIMAVERA'
END AS 'Estação Colhida'
FROM producao;
