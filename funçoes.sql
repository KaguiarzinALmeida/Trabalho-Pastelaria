--Calcular idade do cliente

DELIMITER //

CREATE FUNCTION calcular_idade_cliente(data_nascimento DATE) RETURNS INT
BEGIN
    DECLARE idade INT;
    SET idade = YEAR(CURDATE()) - YEAR(data_nascimento);
    IF MONTH(CURDATE()) < MONTH(data_nascimento) OR (MONTH(CURDATE()) = MONTH(data_nascimento) AND DAY(CURDATE()) < DAY(data_nascimento)) THEN
    SET idade = idade - 1;
    END IF;
    RETURN idade;
END
DELIMITER ;

--Calcular valor total de um pedido

DELIMITER //

CREATE FUNCTION calcular_valor_total_pedido(id_pedido INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(p.preco * pv.quantidade) INTO total
    FROM produtos_vendidos pv
    JOIN pasteis p ON pv.id_produto = p.id
    WHERE pv.id_pedido = id_pedido;
    RETURN total;
END

DELIMITER ;

--Contar quantos pasteis um cliente comprou

DELIMITER //

CREATE FUNCTION pasteis_comprados_cliente(id_cliente INT) RETURNS INT
BEGIN
    DECLARE quantidade_pasteis INT;
    SELECT COUNT(*) INTO quantidade_pasteis
    FROM produtos_vendidos pv
    JOIN pedidos p ON pv.id_pedido = p.id
    WHERE p.id_cliente = id_cliente;
    RETURN quantidade_pasteis;
END


DELIMITER ;
