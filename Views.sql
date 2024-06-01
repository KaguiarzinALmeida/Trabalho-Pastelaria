USE stop_pastelaria;

CREATE VIEW View_Clientes AS SELECT * FROM Clientes;

CREATE VIEW View_Pedidos AS SELECT * FROM pedidos;

CREATE VIEW View_Recheios AS SELECT * FROM Recheios;

CREATE VIEW pedidos_clientes AS
SELECT pe.id, pe.data_pedido, pe.forma_pagamento, c.nome_completo, c.telefone, c.email
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id;

CREATE VIEW pasteis_e_recheios AS
SELECT p.nome AS nome_pastel, p.tamanho, p.preco, p.categoria, r.nome AS nome_recheio
FROM pasteis p
JOIN pasteis_recheios pr ON p.id = pr.id_pastel
JOIN recheios r ON pr.id_recheio = r.id;

CREATE VIEW pasteis_vendidos_mais_de_2 AS
SELECT * FROM produtos_vendidos
WHERE quantidade > 2;

CREATE VIEW pedidos_pagos_em_dinheiro AS
SELECT * FROM pedidos
WHERE forma_pagamento = 'Dinheiro';

CREATE VIEW pasteis_veganos AS
SELECT * FROM pasteis
WHERE categoria = 'Vegano';

CREATE VIEW clientes_menores_de_18 AS
SELECT * FROM clientes
WHERE YEAR(CURDATE()) - YEAR(data_nascimento) < 18;

CREATE VIEW total_vendas_por_categoria AS
SELECT p.categoria, SUM(pv.quantidade) AS total_vendido
FROM produtos_vendidos pv
JOIN pasteis p ON pv.id_produto = p.id
GROUP BY p.categoria;

SELECT * FROM View_Clientes;

SELECT * FROM View_Pedidos;

SELECT * FROM View_Recheios;

SELECT * FROM pedidos_clientes;

SELECT * FROM pasteis_e_recheios;

SELECT * FROM pasteis_vendidos_mais_de_2;

SELECT * FROM pedidos_pagos_em_dinheiro;

SELECT * FROM pasteis_veganos;

SELECT * FROM clientes_menores_de_18;

SELECT * FROM total_vendas_por_categoria;
