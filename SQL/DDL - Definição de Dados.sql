-- exibir a estrutura de uma tabela.
desc BankAccounts;

-- retorna data e hora atual do sistema
select now() as TimesTamp;

-- Modificar tabela: Adionar atributo
alter table BankAccounts add
	Email varchar(30);

-- Remover atributo
Alter table BankAccounts drop Email;

-- Imagine que você tem uma tabela chamada produtos com uma coluna preco 
-- do tipo INT. Você decide que precisa armazenar valores decimais para o preço, 
-- como R$ 19,99. Para isso, você pode alterar o tipo de dado da coluna para 
-- DECIMAL(10,2), que permite 10 dígitos no total, com 2 casas decimais após o ponto.
ALTER TABLE produtos
MODIFY COLUMN preco DECIMAL(10,2);





CREATE DATABASE if not exists manipulation;
use manipulation;

CREATE TABLE if not exists BankAccounts(
	Id_Account int auto_increment primary key,
	Ag_Num int not null,
	Ac_Num int not null,
	Saldo float,
	constraint identification_account_contraint unique (Ag_num, Ac_num)
); 
-- adicionando um novo atributo
alter table BankAccounts 
	add LimiteCredito float not null default 500.00;


insert into BankAccounts (Ag_Num, Ac_Num, Saldo) 
values (156, 245789, 0),
       (567, 283909, 2500.6);


CREATE TABLE BankClient(
	Id_Client int auto_increment,
	Client_Account int,
	Cpf char(11) not null,
	Rg char(9) not null,
	Nome varchar(30) not null,
	Endereço varchar(100),
	Renda_Mensal float,
	primary key (Id_Client, Client_Account),
	constraint fk_account_Cliente foreign key (Client_Account) references BankAccounts(Id_Account)
	ON UPDATE CASCADE
);
-- adicionando um novo atributo
Alter table BankClient add Uff char(2) not null default 'RJ';

insert into BankClient (Client_Account, Cpf, Rg, Nome, Endereço, Renda_Mensal)
values (1, 12739967289, 687381931, 'Pedro', 'Rua Chapeco', 3599.5),
       (2, 73828103910, 833081080, 'João', 'Rua Almiranda', 5256.0);
       
-- atualizar registro da coluna Uff onde o nome é Pedro e conta 1
update BankClient set Uff = 'MG' where Nome = 'Pedro' and Client_account = 1;

select * from BankAccounts;
select * from BankClient;

CREATE TABLE BankTransactions(
	Id_Transcation int auto_increment primary key,
    Ocorrencia datetime,
    Status_Transaction varchar(20),
    Valor_Trasferido float,
    Source_Account int,
    Destination_Account int,
    constraint fk_source_transaction foreign key (Source_Account) 
    references Bank_Accounts(Id_Account),
    constraint fk_destionation_transaction foreign key (Destination_Account)
    references Bank_Accounts(Id_Account)
);