
create table Client (
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null unique,
        constraint unique_cpf_client unique (CPF)
 );

create table product (
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        catefory enum("Eletrônico", "Vestimenta", "Brinquedos", "Alimentos", "Móveis") not null,
        avaliação float default 0,
		size varchar(10),
        constraint unique_cpf_client unique (CPF)
 );
 
 create table payments(
 IdCliente int,
 IdPayment int, 
 TypePayment enum("Boleto","Cartão","Dinheiro"), 
 LimitAvaliable float,
 primary key(IdClient, IdPayment)
 );

create table Order(
idOrder int auto_increment primary key,
idClient int,
OrderStatus enum("Confirmado", "Cancelado", "Em Processamento") default "Em processamento",
OrderDescription varchar (255),
SendValue float default 10,
PaymentCash bool default false, 
constraint fk_orders_client (IdOrderClient) references client(IdClient)
);

create table ProductStorage(
idProductStorage int auto_increment primary key,
StorageLocation varchar (255),
Quantity int default 0
);

create table supplier(
idSupplier int auto_increment primary key,
SocialName varchar (255) not null,
CNPJ char (15) not null, 
contact int default 0
);

create table Seller(
idSeller int auto_increment primary key,
SocialName varchar (255) not null,
AbsEName varchar (255), 
CNPJ char (15),
CPF char (9),
location varchar(255),
constraint unique_cnpj_seller (CNPJ),
constraint unique_cpf_seller (CNPJ),
);

create table ProductSeller(
IdSeller int,
IdProduct int,
ProdQuantitiy int default 1,
primary key (IdSeller,IdProduct),
constraint fk_product_seller foreign key (IdPSeller) references seller (IdSeller),
constraint fk_product_product foreign key (IdProduct) references product (IdProduct),
);

create table ProductOrder(
IdPOproduct int,
IdPOrder int,
ProdQuantitiy int default 1,
prodStatus enum ("Disponivel", "Em Estoque") default "Disponível",
primary key (IdProduct, IdOrder),
constraint fk_product_seller foreign key (IdPOproduct) references product (IdProduct),
constraint fk_product_product foreign key (IdPOrder) references orders (IdPOrder)
);

 