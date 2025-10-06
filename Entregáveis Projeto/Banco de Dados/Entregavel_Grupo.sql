CREATE DATABASE AgroSense;

USE AgroSense;

CREATE TABLE cadastro(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(75),
email VARCHAR(100) NOT NULL UNIQUE,
constraint chkemail CHECK(email LIKE "%@%"),
senha VARCHAR(50) NOT NULL,
telefone CHAR(11),
dtCadastro DATE,
cep char(9),
numEndereco int		
);

insert into cadastro(nomeEmpresa, email, senha, telefone, dtCadastro, cep, numEndereco) values
('v8Tech', 'v8tech@email.teste', 'v812345', '11987654121', '2025-02-12', '000000000', '45'),
('C6 Bank', 'c6bank@email.teste','c612345', '11987654321', '2025-08-02', '000000001', '46'),
('Bradesco', 'bradesco@email.com', 'bra12345', '11987654321', '2025-05-21', '000000002', '47'),
('ToTvs', 'ToTvs@email.com', 'totvs12345', '11987654321', '2025-07-30', '000000003', '48');


CREATE TABLE hectare (
idHectare INT PRIMARY KEY AUTO_INCREMENT,
nomeHectare VARCHAR(45) NOT NULL,
areaPlantada INT NOT NULL,
qtdPlantada INT NOT NULL,
fkSensores INT,
constraint fkSensoresRegra
foreign key (fkSensores)
references sensores(idSensor),
fkCadastro int,
constraint fkCadastroRegra
    foreign key (fkCadastro)
        references cadastro(idUsuario)
);

insert into hectare (nomeHectare,areaPlantada,qtdPlantada,fkSensores)values
('Hectare01','0001','450',3),
('Hectare02','0002','600',2),
('Hectare03','0003','1500',4),
('Hectare04','0004','2340',1);


CREATE TABLE sensores (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
identi VARCHAR(40),
umidadeSolo int
);
insert into sensores(identi,umidadeSolo)values
('3015','24'),
('2116','18'),
('2213','25'),
('2314','32');
 
 select cadastro.nomeEmpresa as 'Nome da Empresa', 
 cadastro.email as 'Email da Empresa',
 cadastro.senha as 'Senha da Empresa',
 cadastro.telefone as 'Telefone da Empresa',
 cadastro.dtCadastro as 'Data de Cadastro',
 hectare.nomeHectare as 'Identificação dos Hectares',
 hectare.areaPlantada as 'Área Plantada(ha)',
 hectare.qtdPlantada as 'Quantidade Plantada(Kg)',
 sensores.identi as 'Identificação dos Sensores',
 sensores.umidadeSolo as 'Umidade do Solo(%)'
 from cadastro join hectare on fkHectare = idHectare
 join sensores on fkSensores = idSensor;
 
