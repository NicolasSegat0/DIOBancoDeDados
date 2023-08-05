use ecomerce; 

show tables;

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
           
           
           
select * from productSeller;

select Fname,Lname,idorder,orderStatus from clients c, orders o where c.idClient = idorderClient;