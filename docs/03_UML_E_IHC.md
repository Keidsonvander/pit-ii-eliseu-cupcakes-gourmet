# 03 — Modelagem UML e Interface Humano-Computador

## 1. Diagrama de classes

```mermaid
classDiagram
    class Cliente {
      +int id
      +string nome
      +string telefone
      +string endereco
    }

    class Produto {
      +int id
      +string nome
      +string descricao
      +decimal preco
      +boolean ativo
    }

    class Pedido {
      +int id
      +datetime data_hora
      +decimal total
      +string status
      +string modalidade_entrega
    }

    class ItemPedido {
      +int id
      +int quantidade
      +decimal preco_unitario
      +decimal subtotal
    }

    class Pagamento {
      +int id
      +string forma
      +string status
    }

    class Entrega {
      +int id
      +string tipo
      +string endereco
      +string status
    }

    Cliente "1" --> "0..*" Pedido : realiza
    Pedido "1" --> "1..*" ItemPedido : possui
    Produto "1" --> "0..*" ItemPedido : compoe
    Pedido "1" --> "1" Pagamento : possui
    Pedido "1" --> "1" Entrega : possui
```

## 2. Casos de uso principais

```mermaid
flowchart LR
    U[Cliente]
    A((Visualizar catálogo))
    B((Adicionar ao carrinho))
    C((Alterar carrinho))
    D((Informar dados))
    E((Escolher pagamento))
    F((Escolher entrega/retirada))
    G((Finalizar pedido))
    H((Consultar status))

    U --> A
    U --> B
    U --> C
    U --> D
    U --> E
    U --> F
    U --> G
    U --> H
```

## 3. Diagrama de sequência — finalização do pedido

```mermaid
sequenceDiagram
    actor Cliente
    participant UI as Interface
    participant API as Flask/Controller
    participant DB as SQLite

    Cliente->>UI: seleciona produtos
    UI->>UI: atualiza carrinho e total
    Cliente->>UI: informa dados e opções
    Cliente->>UI: confirma pedido
    UI->>API: envia pedido
    API->>API: valida dados
    API->>DB: grava cliente/pedido/itens
    DB-->>API: retorna identificador
    API-->>UI: pedido confirmado + status
    UI-->>Cliente: exibe confirmação
```

## 4. Diagrama de atividade

```mermaid
flowchart TD
    I[Início] --> C[Visualizar catálogo]
    C --> P[Selecionar cupcakes]
    P --> K[Revisar carrinho]
    K --> D[Informar dados]
    D --> M[Escolher pagamento]
    M --> E[Escolher entrega ou retirada]
    E --> V{Dados válidos?}
    V -- Não --> X[Exibir mensagem e solicitar correção]
    X --> D
    V -- Sim --> R[Registrar pedido]
    R --> F[Exibir número e status]
    F --> Z[Fim]
```

## 5. Diretrizes de IHC adotadas

A interface será construída com foco em simplicidade, clareza e previsibilidade. Os elementos principais deverão manter o mesmo padrão visual e de interação em todas as etapas.

### Estrutura das telas

**Tela inicial / catálogo**
- Identificação da loja;
- Cards dos cupcakes;
- Nome, descrição e preço;
- Botão visível para adicionar ao carrinho;
- Indicador de quantidade de itens no carrinho.

**Carrinho**
- Lista dos produtos selecionados;
- Quantidade de cada item;
- Ações de aumentar, diminuir e remover;
- Subtotal por item;
- Total geral destacado;
- Botão para avançar.

**Finalização**
- Nome e telefone;
- Modalidade de recebimento;
- Campo de endereço exibido quando a opção for entrega;
- Forma de pagamento;
- Resumo do pedido;
- Botão de confirmação.

**Confirmação**
- Mensagem clara de sucesso;
- Número do pedido;
- Valor total;
- Status inicial;
- Orientação para consulta do pedido.

**Consulta de status**
- Campo para número do pedido;
- Botão de consulta;
- Retorno do status ou mensagem de pedido não encontrado.

## 6. Tratamento de erros e feedback

- Campos obrigatórios terão indicação visível;
- Carrinho vazio impedirá a finalização;
- Endereço será exigido somente quando houver entrega;
- Mensagens de erro deverão informar o problema e a correção necessária;
- Após uma ação válida, o sistema fornecerá feedback imediato;
- A confirmação do pedido destacará o identificador gerado.

## 7. Fluxo de navegação

```mermaid
flowchart LR
    A[Catálogo] --> B[Carrinho]
    B --> C[Finalização]
    C --> D[Confirmação]
    D --> E[Consulta de status]
    B --> A
    C --> B
```

A navegação mantém o fluxo curto, permitindo retorno ao catálogo e ao carrinho antes da confirmação final.
