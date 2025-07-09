CREATE TABLE Clientes (
	clienteID INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	telefone TEXT NOT NULL UNIQUE,
	cpf TEXT UNIQUE,
	data_cadastro TEXT NOT NULL DEFAULT (DATE('now')),
	ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),
	observacao TEXT
);


CREATE TABLE Pedidos (
	pedidoID INTEGER PRIMARY KEY AUTOINCREMENT,
	clienteID INTEGER NOT NULL,
	data_pedido TEXT NOT NULL DEFAULT (DATE ('now')),
	status TEXT NOT NULL DEFAULT 'Pendente' CHECK (status IN ('Pendente', 'Pago', 'Cancelado')),
	valorTotal REAL DEFAULT 0 CHECK (valorTotal >= 0),
	observacao TEXT,
	FOREIGN KEY (clienteID) REFERENCES Clientes(clienteID)
);

CREATE TABLE ItensPedido (
	itemID INTEGER PRIMARY KEY AUTOINCREMENT,
	pedidoID INTEGER NOT NULL,
	produtoID INTEGER NOT NULL,
	quantidade INTEGER NOT NULL CHECK (quantidade > 0),
	precoUnitario REAL NOT NULL CHECK (precoUnitario >= 0),
	desconto REAL DEFAULT 0 CHECK (desconto >= 0),
	FOREIGN KEY (pedidoID) REFERENCES Pedidos(pedidoID),
	FOREIGN KEY (produtoID) REFERENCES Produtos(produtoID)
);

CREATE TABLE Produtos (
	produtoID INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL,
	descricao TEXT,
	categoria TEXT NOT NULL,
	precoCusto REAL NOT NULL CHECK (precoCusto >= 0),
	precoVenda REAL NOT NULL CHECK (precoVenda >= 0),
	unidade_medida TEXT NOT NULL, --EX: 'unidade', 'kg', 'litro'
	ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),
	dataCadastro TEXT NOT NULL DEFAULT (DATE('now'))
);

CREATE TABLE Estoque (
	estoqueID INTEGER PRIMARY KEY AUTOINCREMENT,
	produtoID INTEGER NOT NULL,
	localizacao TEXT NOT NULL,
	quantidadeMinima INTEFER NOT NULL CHECK (quantidadeMinima >= 0),
	ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),
	obervacao TEXT,
	FOREIGN KEY (produtoID) REFERENCES Produtos(produtoID)
);

CREATE TABLE Movimentacoes (
	movimentacaoID INTEGER PRIMARY KEY AUTOINCREMENT,
	produtoID INTEGER NOT NULL,
	tipo TEXT NOT NULL CHECK (tipo IN ('Entrada', 'Saida')),
	quantidade INTEGER NOT NULL CHECK (quantidade > 0),
	dataMovimentacao TEXT NOT NULL DEFAULT (DATE('now')),
	origem TEXT, -- Ex: "Compra de fornecedor", "Venda", "Devolução"
	observacao TEXT,
	FOREIGN KEY (produtoID) REFERENCES Produtos(produtoID)
);
