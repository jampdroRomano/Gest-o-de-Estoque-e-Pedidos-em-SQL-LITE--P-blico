
-- View para verificar o estoque atual

CREATE VIEW vw_estoque_atual AS
SELECT 
    p.produtoID,
    p.nome,
    COALESCE(SUM(
        CASE 
            WHEN m.tipo = 'Entrada' THEN m.quantidade
            WHEN m.tipo = 'Saida' THEN -m.quantidade
            ELSE 0
        END
    ), 0) AS estoqueAtual
FROM Produtos p
LEFT JOIN MovimentacoesEstoque m ON p.produtoID = m.produtoID
GROUP BY p.produtoID;

-- View para verificar quantidade de produtos no estoque em estado critico

CREATE VIEW vw_estoque_critico AS
SELECT 
    e.estoqueID,
    p.nome,
    ea.estoqueAtual,
    e.quantidadeMinima,
    e.localizacao
FROM Estoque e
JOIN Produtos p ON p.produtoID = e.produtoID
JOIN vw_estoque_atual ea ON ea.produtoID = e.produtoID
WHERE ea.estoqueAtual < e.quantidadeMinima;

-- View vendas por cliente

CREATE VIEW vw_vendas_por_cliente AS
SELECT 
    c.clienteID,
    c.nome,
    COUNT(p.pedidoID) AS totalPedidos,
    SUM(p.valorTotal) AS totalGasto
FROM Clientes c
JOIN Pedidos p ON c.clienteID = p.clienteID
WHERE p.status = 'Pago'
GROUP BY c.clienteID;

-- View vendas por categoria

CREATE VIEW vw_vendas_por_categoria AS
SELECT 
    pr.categoria,
    SUM(ip.quantidade * ip.precoUnitario - ip.desconto) AS totalVendido
FROM ItensPedido ip
JOIN Produtos pr ON pr.produtoID = ip.produtoID
JOIN Pedidos p ON p.pedidoID = ip.pedidoID
WHERE p.status = 'Pago'
GROUP BY pr.categoria;

-- View Lista dos 10 produtos mais vendidos

CREATE VIEW vw_produtos_mais_vendidos AS
SELECT 
    pr.nome,
    SUM(ip.quantidade) AS totalVendido
FROM ItensPedido ip
JOIN Produtos pr ON pr.produtoID = ip.produtoID
GROUP BY pr.nome
ORDER BY totalVendido DESC
LIMIT 10;


-- View Pedidos com detalhes:

CREATE VIEW vw_pedidos_com_detalhes AS
SELECT 
    p.pedidoID,
    c.nome AS cliente,
    pr.nome AS produto,
    ip.quantidade,
    ip.precoUnitario,
    (ip.quantidade * ip.precoUnitario - ip.desconto) AS totalItem,
    p.status,
    p.dataPedidos
FROM Pedidos p
JOIN Clientes c ON c.clienteID = p.clienteID
JOIN ItensPedido ip ON ip.pedidoID = p.pedidoID
JOIN Produtos pr ON pr.produtoID = ip.produtoID;

