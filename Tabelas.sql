CREATE DATABASE stop_pastelaria;

USE stop_pastelaria;

CREATE TABLE clientes(
	 id INT PRIMARY KEY AUTO_INCREMENT,
	 nome_completo VARCHAR(100) NOT NULL,
	 nome_a_ser_chamado VARCHAR(50) NOT NULL,
	 cpf VARCHAR (14) NOT NULL, 
     data_nascimento DATE NOT NULL, 
     telefone VARCHAR (20) NOT NULL, 
     email VARCHAR (100) NOT NULL,
     bairro VARCHAR (100) NOT NULL,
     cidade VARCHAR (100) NOT NULL,
     estado VARCHAR (2) NOT NULL
);


CREATE TABLE pasteis(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	tamanho VARCHAR (20) NOT NULL,
    preco DECIMAL (10, 2) NOT NULL,
    categoria VARCHAR (50) NOT NULL
);

CREATE TABLE recheios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE pasteis_recheios(
	id_pastel_recheio INT AUTO_INCREMENT PRIMARY KEY, 
    id_pastel INT, 
    id_recheio INT, 
    FOREIGN KEY (id_pastel) REFERENCES pasteis (id),
	FOREIGN KEY (id_recheio) REFERENCES recheios (id)
);

CREATE TABLE pedidos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT,
    data_pedido DATE, 
    forma_pagamento VARCHAR (50),
    
    FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

CREATE TABLE produtos_vendidos(
	 id_produto_vendido INT AUTO_INCREMENT PRIMARY KEY,
     id_pedido INT, 
     id_produto INT, 
     quantidade INT,
     
     FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
	 FOREIGN KEY (id_produto) REFERENCES pasteis(id)
);