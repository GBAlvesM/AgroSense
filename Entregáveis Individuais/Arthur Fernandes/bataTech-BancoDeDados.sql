use bataTech;

create table cadastro(
idCadastro int primary key auto_increment,
nome varchar(45),
senha varchar(15) not null,
cnpj char(14) unique,
email varchar(60) not null,
constraint chkEmail check(email LIKE '%@%'),
endereco varchar(60));

insert into cadastro(nome, senha, cnpj, email, endereco) values
();

create table sensor(
idSensor int primary key auto_increment,
sensorID varchar(40), -- caso haja diversos sensores
dtCaptura datetime default current_timestamp,
umidadeSolo int,
temperaturaRegistrada int,
statusSensor varchar(20), -- desligado, ligado 
fkCadastro int unique,
constraint fkCadastroRegra
foreign key (fkCadastro)
references cadastro(idCadastro));

insert into sensor(sensorID, dtCaptura, umidadeSolo, temperaturaRegistrada, statusSensor) values
();

CREATE TABLE producao(
id INT PRIMARY KEY AUTO_INCREMENT,
dataColheita DATE,
areaPlantada INT, 
qtdPlantada int, 
fkCadastro int unique, 
constraint fkCadastroRegra
foreign key (fkCadastro)
references cadastro(idCadastro)
);

