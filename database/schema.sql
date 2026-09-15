PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    endereco TEXT
);

CREATE TABLE IF NOT EXISTS produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT NOT NULL,
    preco REAL NOT NULL CHECK (preco > 0),
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1))
);

CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    data_hora TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total REAL NOT NULL CHECK (total >= 0),
    status TEXT NOT NULL DEFAULT 'Recebido',
    modalidade_entrega TEXT NOT NULL CHECK (modalidade_entrega IN ('entrega', 'retirada')),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS item_pedido (
    id_item INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL NOT NULL CHECK (preco_unitario > 0),
    subtotal REAL NOT NULL CHECK (subtotal >= 0),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE IF NOT EXISTS pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL UNIQUE,
    forma TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS entrega (
    id_entrega INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL UNIQUE,
    tipo TEXT NOT NULL CHECK (tipo IN ('entrega', 'retirada')),
    endereco TEXT,
    status TEXT NOT NULL DEFAULT 'Aguardando preparo',
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE
);

INSERT INTO produto (nome, descricao, preco, ativo)
SELECT 'Chocolate Belga', 'Cupcake de chocolate com cobertura cremosa de chocolate.', 12.90, 1
WHERE NOT EXISTS (SELECT 1 FROM produto WHERE nome = 'Chocolate Belga');

INSERT INTO produto (nome, descricao, preco, ativo)
SELECT 'Red Velvet', 'Massa red velvet com cobertura suave de cream cheese.', 13.90, 1
WHERE NOT EXISTS (SELECT 1 FROM produto WHERE nome = 'Red Velvet');

INSERT INTO produto (nome, descricao, preco, ativo)
SELECT 'Baunilha & Frutas Vermelhas', 'Massa de baunilha com cobertura e toque de frutas vermelhas.', 12.50, 1
WHERE NOT EXISTS (SELECT 1 FROM produto WHERE nome = 'Baunilha & Frutas Vermelhas');
