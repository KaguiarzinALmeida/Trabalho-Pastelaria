USE stop_pastelaria;


INSERT INTO clientes (nome_completo, nome_a_ser_chamado, cpf, data_nascimento, telefone, email, bairro, cidade, estado) 
VALUES 
('Ana Santos', 'Ana', '111.222.333-44', '1988-03-10', '(11) 1111-2222', 'ana@example.com', 'Vila Madalena', 'São Paulo', 'SP'),
('Carlos Lima', 'Carlos', '555.666.777-88', '1995-07-22', '(11) 3333-4444', 'carlos@example.com', 'Pinheiros', 'São Paulo', 'SP'),
('Fernanda Souza', 'Fernanda', '999.888.777-66', '1980-11-05', '(11) 5555-6666', 'fernanda@example.com', 'Moema', 'São Paulo', 'SP'),
('Pedro Pereira', 'Pedro', '123.456.789-01', '1992-01-30', '(11) 7777-8888', 'pedro@example.com', 'Itaim Bibi', 'São Paulo', 'SP'),
('Larissa Silva', 'Larissa', '987.654.321-09', '1987-12-15', '(11) 9999-0000', 'larissa@example.com', 'Brooklin', 'São Paulo', 'SP'),
('Marcos Oliveira', 'Marcos', '456.789.123-00', '1982-04-18', '(11) 2222-3333', 'marcos@example.com', 'Campo Belo', 'São Paulo', 'SP'),
('Juliana Costa', 'Juliana', '654.321.987-01', '1990-09-20', '(11) 8888-9999', 'juliana@example.com', 'Perdizes', 'São Paulo', 'SP'),
('Lucas Santos', 'Lucas', '987.654.321-00', '1985-06-25', '(11) 3333-5555', 'lucas@example.com', 'Morumbi', 'São Paulo', 'SP'),
('Camila Rocha', 'Camila', '789.123.456-02', '1998-02-14', '(11) 6666-7777', 'camila@example.com', 'Jabaquara', 'São Paulo', 'SP'),
('Gabriel Almeida', 'Gabriel', '321.654.987-03', '1989-10-12', '(11) 0000-1111', 'gabriel@example.com', 'Tatuapé', 'São Paulo', 'SP');

-- Inserir clientes com menos de 18 anos
INSERT INTO clientes (nome_completo, nome_a_ser_chamado, cpf, data_nascimento, telefone, email, bairro, cidade, estado) 
VALUES 
('Ana Silva', 'Ana', '222.333.444-55', '2008-02-28', '(11) 1143-2222', 'ana@example.com', 'Vila Madalena', 'São Paulo', 'SP'),
('Pedro Oliveira', 'Pedro', '333.444.555-66', '2010-05-10', '(11) 2652-3333', 'pedro@example.com', 'Pinheiros', 'São Paulo', 'SP'),
('Mariana Santos', 'Mariana', '444.555.666-77', '2005-09-15', '(11) 3553-4444', 'mariana@example.com', 'Moema', 'São Paulo', 'SP');


INSERT INTO pasteis (nome, tamanho, preco, categoria) 
VALUES 
('Pastel de Carne', 'Médio', 5.50, 'Salgado'),
('Pastel de Queijo', 'Pequeno', 4.00, 'Salgado'),
('Pastel de Frango', 'Grande', 6.50, 'Salgado'),
('Pastel de Calabresa', 'Médio', 6.00, 'Salgado'),
('Pastel de Palmito', 'Pequeno', 4.50, 'Salgado'),
('Pastel de Camarão', 'Grande', 7.00, 'Salgado'),
('Pastel de Chocolate', 'Médio', 5.00, 'Doce'),
('Pastel de Banana', 'Pequeno', 3.50, 'Doce'),
('Pastel de Morango', 'Grande', 6.00, 'Doce'),
('Pastel de Leite Condensado', 'Médio', 4.50, 'Doce');

-- Inserir pasteis veganos
INSERT INTO pasteis (nome, tamanho, preco, categoria) 
VALUES 
('Pastel de Abóbora', 'Médio', 5.50, 'Vegano'),
('Pastel de Quinoa com Vegetais', 'Grande', 8.00, 'Vegano'),
('Pastel de Batata Doce com Lentilha', 'Pequeno', 4.50, 'Vegano'),
('Pastel de Couve-Flor com Grão-de-Bico', 'Médio', 6.00, 'Vegano'),
('Pastel de Berinjela com Pimentão', 'Grande', 7.00, 'Vegano');



INSERT INTO recheios (nome) 
VALUES 
('Carne'),
('Queijo'),
('Frango'),
('Calabresa'),
('Palmito'),
('Camarão'),
('Chocolate'),
('Banana'),
('Morango'),
('Leite Condensado');

-- Recheios vegeanos
INSERT INTO recheios (nome)
VALUES
('Abóbora'),
('Quinoa'),
('Vegetais'),
('Batata Doce'),
('Lentilha'),
('Couve-Flor'),
('Grão-de-Bico'),
('Berinjela'),
('Pimentão');

INSERT INTO pasteis_recheios (id_pastel, id_recheio) 
SELECT id_pastel, id_recheio FROM pasteis_recheios;


INSERT INTO pedidos (id_cliente, data_pedido, forma_pagamento) 
VALUES 
(3, '2024-05-24', 'Cartão de Débito'),
(4, '2024-05-23', 'Dinheiro'),
(5, '2024-05-22', 'Dinheiro'),
(6, '2024-05-21', 'Cartão de Crédito'),
(7, '2024-05-20', 'Cartão de Crédito'),
(8, '2024-05-19', 'Dinheiro'),
(9, '2024-05-18', 'Cartão de Crédito'),
(10, '2024-05-17', 'Dinheiro'),
(1, '2024-05-16', 'Cartão de Débito'),
(2, '2024-05-15', 'Dinheiro');

INSERT INTO produtos_vendidos (id_pedido, id_produto, quantidade) 
SELECT id_pedido, id_produto, quantidade FROM produtos_vendidos;

SELECT * FROM clientes;

SELECT * FROM recheios;

SELECT * FROM produtos_vendidos;

SELECT * FROM pedidos;

SELECT * FROM pasteis;
