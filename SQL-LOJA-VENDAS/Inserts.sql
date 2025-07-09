INSERT INTO Produtos (nome, descricao, categoria, precoCusto, precoVenda, unidadeMedida)
VALUES
('Camiseta Dry Fit', 'Camiseta esportiva respirável', 'Vestuário', 25.00, 49.90, 'unidade'),
('Tênis Run Fast', 'Tênis leve para corrida', 'Calçados', 120.00, 199.90, 'par'),
('Garrafa Térmica', 'Garrafa 1L com isolamento térmico', 'Acessórios', 30.00, 59.90, 'unidade'),
('Meia Esportiva', 'Par de meias para treino', 'Vestuário', 5.00, 9.90, 'par'),
('Jaqueta Corta-Vento', 'Jaqueta leve com proteção contra vento', 'Vestuário', 70.00, 129.90, 'unidade'),
('Mochila Fit', 'Mochila compacta para academia', 'Acessórios', 50.00, 89.90, 'unidade');

INSERT INTO Clientes (nome, email, telefone, cpf)
VALUES
('Maria da Silva', 'maria.silva@email.com', '44999990001', '12345678901'),
('João Pedro', 'joao.pedro@email.com', '44999990002', '98765432100'),
('Carla Souza', 'carla.souza@email.com', '44999990003', '45678912345'),
('Pedro Henrique', 'pedro.henrique@email.com', '44999990004', '32165498700'),
('Amanda Lopes', 'amanda.lopes@email.com', '44999990005', '14725836900');

INSERT INTO Pedidos (clienteID, dataPedidos, status, valorTotal)
VALUES
(1, '2025-07-01', 'Pago', 299.70),
(2, '2025-07-02', 'Pago', 159.80),
(3, '2025-07-03', 'Pendente', 89.90),
(4, '2025-07-04', 'Cancelado', 49.90),
(5, '2025-07-05', 'Pago', 199.80);

INSERT INTO ItensPedido (pedidoID, produtoID, quantidade, precoUnitario, desconto)
VALUES
(1, 1, 2, 49.90, 0),
(1, 2, 1, 199.90, 0),
(2, 4, 4, 9.90, 0),
(3, 6, 1, 89.90, 0),
(4, 3, 1, 59.90, 10.00),
(5, 5, 1, 129.90, 0),
(5, 1, 2, 49.90, 0);

-- Entradas
INSERT INTO MovimentacoesEstoque (produtoID, tipo, quantidade, origem)
VALUES
(1, 'Entrada', 50, 'Compra inicial'),
(2, 'Entrada', 30, 'Compra inicial'),
(3, 'Entrada', 20, 'Compra inicial'),
(4, 'Entrada', 100, 'Compra inicial'),
(5, 'Entrada', 15, 'Compra inicial'),
(6, 'Entrada', 40, 'Compra inicial');

-- Saídas simulando vendas (ligadas aos pedidos)
INSERT INTO MovimentacoesEstoque (produtoID, tipo, quantidade, origem)
VALUES
(1, 'Saida', 2, 'Pedido 1'),
(2, 'Saida', 1, 'Pedido 1'),
(4, 'Saida', 4, 'Pedido 2'),
(6, 'Saida', 1, 'Pedido 3'),
(3, 'Saida', 1, 'Pedido 4'),
(5, 'Saida', 1, 'Pedido 5'),
(1, 'Saida', 2, 'Pedido 5');

