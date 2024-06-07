--Gatilho para calcular o preço total de produtos vendidos

DELIMITER //

CREATE TRIGGER atualizar_total_pedido
AFTER INSERT ON produtos_vendidos
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(p.preco * NEW.quantidade) INTO total
    FROM pasteis p
    WHERE p.id = NEW.id_produto;
    
    UPDATE pedidos
    SET valor_total = total
    WHERE id = NEW.id_pedido;
END//

DELIMITER ;

--Gatilho para registrar novos pedidos

DELIMITER //

CREATE TRIGGER registrarnv_pedido
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
    SET NEW.data_pedido = NOW();
END//

DELIMITER ;

--Gatilho para controlar a exclusão de clientes

DELIMITER //

CREATE TRIGGER impedir_exclusao_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    DECLARE pedidos_existentes INT;
    SELECT COUNT(*) INTO pedidos_existentes
    FROM pedidos
    WHERE id_cliente = OLD.id;
    
    IF pedidos_existentes > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir este cliente pois há pedidos associados a ele.';
    END IF;
END//

DELIMITER ;

--Gatilho para atualizar a tabela de estoque após vendas

DELIMITER //

CREATE TRIGGER atualizar_estoque_venda
AFTER INSERT ON produtos_vendidos
FOR EACH ROW
BEGIN
    UPDATE pasteis
    SET quantidade_disponivel = quantidade_disponivel - NEW.quantidade
    WHERE id = NEW.id_produto;
END//

DELIMITER ;

--Gatilho para registrar alterações nas informações do cliente

DELIMITER //

CREATE TRIGGER registrar_alteracao_cliente
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO registros_alteracoes_clientes (id_cliente, data_alteracao)
    VALUES (NEW.id, NOW());
END//

DELIMITER ;
