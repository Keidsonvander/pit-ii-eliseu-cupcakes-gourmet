# 04 — Banco de dados e dicionário de dados

## 1. Modelo conceitual

A persistência foi organizada em seis entidades principais: Cliente, Produto, Pedido, ItemPedido, Pagamento e Entrega.

- Um cliente pode realizar vários pedidos.
- Um pedido pertence a um cliente.
- Um pedido possui um ou mais itens.
- Cada item referencia um produto.
- Cada pedido possui um registro de pagamento.
- Cada pedido possui um registro de entrega ou retirada.

## 2. Modelo lógico

### CLIENTE
- id_cliente (PK)
- nome
- telefone
- endereco

### PRODUTO
- id_produto (PK)
- nome
- descricao
- preco
- ativo

### PEDIDO
- id_pedido (PK)
- id_cliente (FK)
- data_hora
- total
- status
- modalidade_entrega

### ITEM_PEDIDO
- id_item (PK)
- id_pedido (FK)
- id_produto (FK)
- quantidade
- preco_unitario
- subtotal

### PAGAMENTO
- id_pagamento (PK)
- id_pedido (FK, UNIQUE)
- forma
- status

### ENTREGA
- id_entrega (PK)
- id_pedido (FK, UNIQUE)
- tipo
- endereco
- status

## 3. Dicionário de dados

### Tabela `cliente`

| Campo | Tipo | Regra | Descrição |
|---|---|---|---|
| id_cliente | INTEGER | PK, autoincremento | Identificador do cliente |
| nome | TEXT | NOT NULL | Nome do cliente |
| telefone | TEXT | NOT NULL | Telefone informado |
| endereco | TEXT | Pode ser nulo | Endereço quando aplicável |

### Tabela `produto`

| Campo | Tipo | Regra | Descrição |
|---|---|---|---|
| id_produto | INTEGER | PK, autoincremento | Identificador do produto |
| nome | TEXT | NOT NULL | Nome comercial do cupcake |
| descricao | TEXT | NOT NULL | Descrição do produto |
| preco | REAL | NOT NULL, > 0 | Preço unitário |
| ativo | INTEGER | NOT NULL, 0 ou 1 | Indica disponibilidade |

### Tabela `pedido`

| Campo | Tipo | Regra | Descrição |
|---|---|---|---|
| id_pedido | INTEGER | PK, autoincremento | Número do pedido |
| id_cliente | INTEGER | FK, NOT NULL | Cliente responsável |
| data_hora | TEXT | NOT NULL | Data e hora de criação |
| total | REAL | NOT NULL, >= 0 | Valor total |
| status | TEXT | NOT NULL | Situação atual do pedido |
| modalidade_entrega | TEXT | NOT NULL | `entrega` ou `retirada` |

### Tabela `item_pedido`

| Campo | Tipo | Regra | Descrição |
|---|---|---|---|
| id_item | INTEGER | PK, autoincremento | Identificador do item |
| id_pedido | INTEGER | FK, NOT NULL | Pedido ao qual pertence |
| id_produto | INTEGER | FK, NOT NULL | Produto comprado |
| quantidade | INTEGER | NOT NULL, > 0 | Quantidade solicitada |
| preco_unitario | REAL | NOT NULL, > 0 | Preço no momento da compra |
| subtotal | REAL | NOT NULL, >= 0 | Quantidade × preço unitário |

### Tabela `pagamento`

| Campo | Tipo | Regra | Descrição |
|---|---|---|---|
| id_pagamento | INTEGER | PK, autoincremento | Identificador do pagamento |
| id_pedido | INTEGER | FK, UNIQUE, NOT NULL | Pedido relacionado |
| forma | TEXT | NOT NULL | Forma escolhida pelo cliente |
| status | TEXT | NOT NULL | Situação do pagamento |

### Tabela `entrega`

| Campo | Tipo | Regra | Descrição |
|---|---|---|---|
| id_entrega | INTEGER | PK, autoincremento | Identificador da entrega |
| id_pedido | INTEGER | FK, UNIQUE, NOT NULL | Pedido relacionado |
| tipo | TEXT | NOT NULL | Entrega ou retirada |
| endereco | TEXT | Pode ser nulo | Endereço de destino |
| status | TEXT | NOT NULL | Situação logística |

## 4. Regras de integridade

- Um pedido não pode existir sem um cliente.
- Um item não pode existir sem pedido e produto válidos.
- A quantidade de itens deve ser maior que zero.
- O preço unitário deve ser maior que zero.
- Cada pedido deve possuir no máximo um pagamento e uma entrega.
- Produtos inativos permanecem no histórico, mas não devem aparecer para novas compras.
- Endereço é obrigatório na regra de aplicação quando a modalidade for entrega.

## 5. Normalização

A estrutura separa clientes, produtos, pedidos e itens para evitar repetição desnecessária de dados. O preço unitário é mantido no item do pedido para preservar o valor histórico da compra mesmo que o preço atual do produto seja alterado posteriormente.

## 6. Projeto físico

O script SQL inicial encontra-se em `database/schema.sql`. Foi escolhido SQLite por ser um SGBD relacional simples, amplamente suportado e suficiente para uma aplicação acadêmica de pequeno porte, permitindo demonstrar persistência, chaves estrangeiras e integridade de dados sem depender de infraestrutura externa.
