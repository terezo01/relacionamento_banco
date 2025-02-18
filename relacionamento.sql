create database multas

use multas

create table veiculos(
	placa char(7) primary key,
	marca varchar(30),
	modelo varchar(50),
	cor varchar(20)
)

create table multas(
	idMulta int primary key identity(1,1),
	nomeMulta varchar(100),
	valor money
)

create table atuação(
	id int primary key identity(1,1),
	placaVeiculo char(7),
	idMulta int,
	dia date,
	localMulta varchar(30)
	constraint fk_atuação_veiculos foreign key (placaVeiculo)
	references veiculos(placa),
	constraint fk_atuação_multas foreign key (idMulta)
	references multas(idMulta)
)

insert into veiculos
(placa, marca, modelo, cor)
values('btb0189', 'hyundai', 'creta', 'preto')

insert into veiculos
(placa, marca, modelo, cor)
values('fit2008', 'honda', 'fit', 'preto')

insert into multas
(nomeMulta, valor)
values('excesso de velocidade', 170.88)

insert into multas
(nomeMulta, valor)
values('capotamento', 300)

insert into multas
(nomeMulta, valor)
values('passar no sinal vermelho', 100)

select * from multas

insert into atuação
(placaVeiculo, idMulta, dia, localMulta)
values('btb0189', 1, '10-09-2025', 'Praça da esquina')

insert into atuação
(placaVeiculo, idMulta, dia, localMulta)
values('btb0189', 2, '2025-12-30', 'Praça da esquina')

insert into atuação
(placaVeiculo, idMulta, dia, localMulta)
values('fit2008', 3, '2025-12-30', 'Fim da rua')

insert into atuação
(placaVeiculo, idMulta, dia, localMulta)
values('fit2008', 1, '2025-02-17', 'Fim da rua')


select veiculos.placa, multas.nomeMulta, multas.valor, atuação.dia from atuação
inner join veiculos on atuação.placaVeiculo = veiculos.placa
inner join multas on atuação.idMulta = multas.idMulta
