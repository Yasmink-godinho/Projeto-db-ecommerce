-- inserção de dados e queries
use ecommerce;

show tables;
-- idCLiente, Fname, Minit, Lname, ClientType, CPF, CNPJ, Address
insert into Clients (Fname, Minit, Lname, ClientType, CPF, CNPJ, Address)
	values('Maria','L','Silva', 'PF', '03421443453', null, 'rua sebatião gomes de melo 7c, Matinha - Abreu e Lima'),
		  ('Yasmin','M','Godinho', 'PF', '21686647489', null, 'rua sebatião gomes de melo 7c, Matinha - Abreu e Lima'),
		  ('Miguel','S','Cordeiro', 'PF', '27834987413', null, 'estrada de belém 516, Encruzilhada - Recife'),
          ('Super Vendas', 'A', 'Ltda', 'PJ', null, '12345678000190', 'avenida principal 100, Centro - São Paulo'),
          ('Construções', 'C', 'S.A.', 'PJ', null, '98765432000180', 'rua das obras 50, Industrial - Contagem'),
          ('Ricardo','F','Gomes', 'PF', '01078659420', null, 'avenida boa viagem 1200, Pina - Recife');
		 
-- idProduct, Pname, Classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedo','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
		('Fone de ouvido',false,'Eletrônico','4',null),
        ('Barbie Elsa',true,'Brinquedo','3',null),
        ('Body Carters',true,'Vestimenta','5',null),
        ('Microfone Vedo',false,'Eletrônico','4',null),
        ('Sofá retrátil',false,'Móveis','3','3x57x80'),
        ('Farinha de arroz',false,'Alimentos','2',null),
        ('Fire Stick Amazon',false,'Eletrônico','3',null);
        
select * from clients;
select * from product;

-- idOrdersClient, ordersStatus, ordersDescription, sendValue, paymentCash, trackingCode
insert into orders (idOrdersClient, ordersStatus, ordersDescription, sendValue, paymentCash, trackingCode) values
			(1, default,'compra via aplicativo',null,1, 'BR123456789PT'),
            (2,default,'compra via aplicativo',50,0, 'BR987654321PT'),
            (3,'Confirmado',null,null,1, 'BR555444333PT'),
            (4,default,'compra via web site',150,0, 'BR111222333PT'),
            (1,'Confirmado','compra recorrente',20,1, 'BR777888999PT');

select *from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
		(1,1,2,null),
        (2,1,1,null),
        (3,2,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values
		('Recife',1000),
        ('São Paulo',10000),
        ('Rio de Janeiro',5000),
        ('São Paulo',2000),
        ('Brasília',600);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
	(1,2,'SP'),
    (2,5,'DF');

-- SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
	('Almeida e filhos', 123456789123456,'81988888888'),
    ('Eletrônicos Silva',876543219876543,'81977777777'),
    ('Eletrônicos Valma', 987654321987654,'21966666666');

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
	(1,1,500),
    (1,2,400),
    (2,4,630),
    (3,3,5),
    (2,5,10);

-- SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
	('Tech eletronics', null, 123456789456321, null, 'Recife', 81955555555),
    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 21944444444),
    ('Kids World',null,456789123654485,null,'São Paulo', 11933333333);

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
	(1,6,80),
    (2,7,10);

-- -----------------------------------------------------
-- QUERIES (Consultas)
-- -----------------------------------------------------

-- Quantos pedidos foram feitos por cada cliente?
select c.idClient, Fname, count(*) as Number_of_orders from clients c
	inner join orders o ON c.idClient = o.idOrdersClient
    group by idClient;

-- Relação de produtos, fornecedores e estoques
select p.Pname, s.SocialName as Fornecedor, ps.quantity as Estoque_Fornecedor, st.storageLocation, sl.location as Local_Estoque
from product p
join productSupplier ps on p.idProduct = ps.idPsProduct
join supplier s on ps.idPsSupplier = s.idSupplier
join storageLocation sl on p.idProduct = sl.idLproduct
join productStorage st on sl.idLstorage = st.idProductStorage
order by p.Pname;

-- Relação de nomes dos fornecedores e nomes dos produtos
select s.SocialName as Fornecedor, p.Pname as Produto, ps.quantity as Quantidade
from supplier s
join productSupplier ps on s.idSupplier = ps.idPsSupplier
join product p on ps.idPsProduct = p.idProduct
order by s.SocialName;

-- Quais vendedores (terceiros) também são fornecedores?
select s.SocialName as Vendedor, sp.SocialName as Fornecedor
from seller s
join supplier sp on s.CNPJ = sp.CNPJ;

-- Relação de produtos, vendedores e seus estoques
select p.Pname as Produto, s.SocialName as Vendedor, ps.prodQuantity as Estoque
from product p
join productSeller ps on p.idProduct = ps.idPproduct
join seller s on ps.idPseller = s.idSeller
order by p.Pname;

