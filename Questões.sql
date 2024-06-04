USE stop_pastelaria;

SELECT DISTINCT p.nome AS nome_pastel
FROM produtos_vendidos pv
JOIN pedidos pe ON pv.id_pedido = pe.id
JOIN clientes c ON pe.id_cliente = c.id
JOIN pasteis p ON pv.id_produto = p.id
WHERE p.categoria = 'Vegano' 
AND YEAR(CURDATE()) - YEAR(c.data_nascimento) >= 18;

SELECT 
    c.id,
    c.nome_completo,
    c.email,
    YEAR(pe.data_pedido) AS ano,
    MONTH(pe.data_pedido) AS mes,
    COUNT(pe.id) AS total_pedidos
FROM 
    pedidos pe
JOIN 
    clientes c ON pe.id_cliente = c.id
WHERE 
    pe.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY 
    c.id, 
    c.nome_completo,
    c.email,
    ano,
    mes
ORDER BY 
    ano DESC,
    mes DESC,
    total_pedidos DESC;
    
    SELECT DISTINCT p.nome AS nome_pastel
FROM pasteis p
JOIN pasteis_recheios pr ON p.id = pr.id_pastel
JOIN recheios r ON pr.id_recheio = r.id
WHERE r.nome = 'Bacon' OR r.nome = 'Queijo';

SELECT SUM(p.preco * pv.quantidade) AS valor_total_vendas
FROM produtos_vendidos pv
JOIN pasteis p ON pv.id_produto = p.id;

SELECT DISTINCT pe.id AS id_pedido
FROM pedidos pe
JOIN produtos_vendidos pv_pastel ON pe.id = pv_pastel.id_pedido
JOIN produtos_vendidos pv_bebida ON pe.id = pv_bebida.id_pedido
JOIN pasteis p_pastel ON pv_pastel.id_produto = p_pastel.id
JOIN pasteis p_bebida ON pv_bebida.id_produto = p_bebida.id
WHERE p_pastel.categoria = 'Pastel'
AND p_bebida.categoria = 'Bebida';
  
SELECT 
    p.nome AS nome_pastel,
    SUM(pv.quantidade) AS quantidade_vendas
FROM 
    produtos_vendidos pv
JOIN 
    pasteis p ON pv.id_produto = p.id
GROUP BY 
    p.nome
ORDER BY 
    quantidade_vendas DESC;