drop database ecomerce;
create database ecomerce; 
use ecomerce; 

create table clients(
	idClient int auto_increment primary key, 
    Fname varchar(10), 
    Minit char(3), 
    Lname varchar(20), 
    CPF char(11) not null, 
    Addres varchar(30), 
    constraint unique_cpf_client unique (CPF) 
); 

alter table clients auto_increment=1;



create table product(
	idProduct int auto_increment primary key, 
    Pname varchar(10) not null, 
    Classification_kids bool default false, 
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null, 
    avaliação float default 0, 
    size varchar(10)
); 


create table payments(
	idPayment int,
    idClients int,
    typePayment enum('Boleto', 'Cartão', 'Em processamento') default 'Em processamento', 
    limitAvailable float, 
    primary key(idClient, idPayment)
);


create table orders(
	idOrder int auto_increment primary key, 
    idOrderClient int, 
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') not null, 
    orderDescription varchar(255),
    sendValue float default 10, 
    paymentCash bool default false,
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
); 


create table productStorage(
	idProdStorage int auto_increment primary key, 
    storageLocation varchar(255), 
	quality int default 0
); 


create table supplier(
	idSupplier int auto_increment primary key, 
    SocialName varchar(255) not null, 
	CNPJ char(15) not null, 
	contact char(11) not null, 
	constraint unique_supplier unique (CNPJ)
);


create table seller(
	idSeller int auto_increment primary key, 
	SocialName varchar(255) not null, 
	AbstName varchar(255), 
	CNPJ char(15), 
    CPF char(9), 
    location varchar(255), 
    contact char(11) not null, 
    constraint unique_cnpj_seller unique (CNPJ), 
	constraint unique_cpf_seller unique (CPF)
);


create table productSeller(
	idPseller int, 
    idPproduct int, 
    primary key (idPseller, idPproduct), 
	constraint fk_product_seller foreign key (idPseller) references seller(idSeller), 
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
); 


create table productOrder(
	idPOproduct int, 
    idPOorder int, 
	poQuantity int default 1, 
	poStatus enum('Disponível', 'Sem estoque') default 'Disponível', 
	primary key (idPOproduct, idPOorder), 
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct), 
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);


create table storageLocation(
	idLproduct int, 
    idLstorage int, 
	location varchar(255) not null, 
	primary key (idLproduct,idLstorage), 
	constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct), 
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);


create table productSupplier(
	idPsSupplier int, 
    idPsProduct int, 
	quantity int not null, 
    primary key (idPsSupplier, idPsProduct), 
	constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier), 
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);  


SHOW TABLES;
use information_schema; 








insert into Clients (Fname, Minit, Lname, CPF, Address) 
	values('Nicolas', 'N', 'Segato', 123456789, 'rua silva sei la 29, Xongão - Cidade Alta'), 
		  ('Mateus', 'J' 'Silva', 987654321, 'rua batata doce 45, Barcelona - Cidade Alta'),
          ('Maria', 'M', 'Paes', 2143658798, 'rua araujo salgado 12, Sevilla - Cidade Alta'), 
          ('Roberto', 'S', 'e Silva', 987905946, 'rua doce de abobora 78, Garcia - Cidade Alta'), 
          ('Ivor', 'A', 'Rico', 132435570, 'rua gelada 33, Suecia - Cidade Alta'), 
          ('João', 'T', 'prado', 098765432, 'rua fogo 42, Torto - Cidade Alta');
          

insert into product (Pname, classification_kids, category, avaliação, size) 
	values('Fone de ouvido',false,'Eletrônico','4',null), 
		  ('Conjunto de dados',true,'Brinquedo','5', null), 
          ('A Sociedade do Anel',true,'Livro','4',null),
          ('Sofá retrátil',false,'Móveis','3',null), 
          ('Fine Stick Amazon',false,'Eletrônico','3',null), 
          ('Microfone Vedo - Youtuber',true,'Eletrônico','4',null), 
          ('Ração de gato',true,'PetShop','4',null); 
          

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	values(1,default,'Compra via aplicativo',null,1), 
		  (2,default,'compra via aplicativo',50,0), 
          (3,'Confirmado',null,null,1), 
          (4,default,'compra via web site',150,0);
          
          
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus)
	values(1,1,2,null),
		  (2,1,1,null),
          (3,2,1,null); 
          
          
insert into productStorage(storageLocation,quantity) 
	values('Rio de Janeiro',1000),
		  ('Rio de Janeiro',500),
          ('São Paulo',10), 
          ('São Paulo',100), 
          ('São Paulo',10), 
          ('Brasília',60); 
          
          
insert into storageLocation(idLproduct, idLstorage, location) 
	values (1,2,'RJ'), 
		   (2,6,'GO');
           
           
insert into supplier (SocialName, CNPJ, contact) 
	values ('BookCool',123456789012345,'21984574'), 
		   ('Eletrônica NN',098765432109876,'21975484'),
           ('Eletrônica NN',23456789098765,'21975677');
           
           
insert into productSupplier (idPsSupplier, idPsProduct, quantity) 
	values (1,1,500), 
		   (1,2,400), 
           (2,4,633), 
           (3,3,5),
           (2,5,10); 
           
           
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) 
	values ('Tech eletronics',null,123456789456123,null,'Rio deJaneiro',219946287), 
		   ('Botique',null,null,123456783,'Rio de Janeiro',219567793), 
           ('NN Lojas',null,456789123654485,null,'São Paulo',11988657484); 
           
           
insert into productSeller(idPseller,idPproduct,prodQuantity)
	values (1,2,80),
           (2,7,10);
