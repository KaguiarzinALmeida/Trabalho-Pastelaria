USE stop_pastelaria;

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