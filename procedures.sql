--procedure para adicionar um novo cliente

DELIMITER //

CREATE PROCEDURE addnovo_cliente(
    IN p_nome_completo VARCHAR(100),
    IN p_nome_a_ser_chamado VARCHAR(50),
    IN p_cpf VARCHAR(14),
    IN p_data_nascimento DATE,
    IN p_telefone VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_bairro VARCHAR(100),
    IN p_cidade VARCHAR(100),
    IN p_estado VARCHAR(2)
)
BEGIN
    INSERT INTO clientes (nome_completo, nome_a_ser_chamado, cpf, data_nascimento, telefone, email, bairro, cidade, estado)
    VALUES (p_nome_completo, p_nome_a_ser_chamado, p_cpf, p_data_nascimento, p_telefone, p_email, p_bairro, p_cidade, p_estado);
END//

DELIMITER ;

--procedure para adicionar um novo pedido

DELIMITER //

CREATE PROCEDURE addnovo_pedido(
    IN p_id_cliente INT,
    IN p_data_pedido DATE,
    IN p_forma_pagamento VARCHAR(50)
)
BEGIN
    INSERT INTO pedidos (id_cliente, data_pedido, forma_pagamento)
    VALUES (p_id_cliente, p_data_pedido, p_forma_pagamento);
END//

DELIMITER ;

--procedure para adicionar um novo pastel vendido

DELIMITER //

CREATE PROCEDURE nvpatel_vendido(
    IN p_id_pedido INT,
    IN p_id_pastel INT,
    IN p_quantidade INT
)
BEGIN
    INSERT INTO produtos_vendidos (id_pedido, id_produto, quantidade)
    VALUES (p_id_pedido, p_id_pastel, p_quantidade);
END//

DELIMITER ;




