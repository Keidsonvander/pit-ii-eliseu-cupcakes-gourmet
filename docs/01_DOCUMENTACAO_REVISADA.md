# 01 — Documentação revisada da PIT I

## Identificação

**Aluno:** Eliseu Souza dos Santos  
**RGM:** 33118141  
**Projeto:** Aplicação para loja de cupcakes gourmet

## 1. Contexto da solução

A PIT I definiu como problema central a recuperação de um projeto de aplicativo mobile para uma loja de cupcakes gourmet, após dificuldades na versão anterior. A proposta adotou práticas de Engenharia de Requisitos Ágeis, com histórias de usuário, mapa de afinidade e backlog priorizado para organizar as necessidades do negócio.

Na PIT II, a solução foi revisada para transformar essa especificação em uma aplicação funcional, testável e documentada. O escopo permanece concentrado na jornada principal do cliente: conhecer os produtos, selecionar cupcakes, informar os dados necessários, escolher pagamento e entrega e concluir o pedido.

## 2. Objetivo atualizado

Desenvolver uma aplicação responsiva para uma loja de cupcakes gourmet, com interface simples e consistente, capaz de apoiar a visualização do catálogo, a montagem do pedido, o registro dos dados do cliente, a escolha de pagamento e entrega, a confirmação da compra e o acompanhamento básico do status do pedido.

## 3. Escopo revisado

### Dentro do escopo

- Exibir catálogo de cupcakes disponíveis;
- Exibir nome, descrição e preço dos produtos;
- Adicionar produtos ao carrinho;
- Alterar quantidades e remover itens;
- Calcular subtotal e valor total;
- Coletar nome, telefone e endereço quando necessário;
- Permitir selecionar forma de pagamento;
- Permitir selecionar retirada ou entrega;
- Registrar o pedido no banco de dados;
- Informar número e status inicial do pedido;
- Permitir consulta simplificada do status;
- Exibir mensagens de erro e confirmação compreensíveis.

### Fora do escopo desta versão acadêmica

- Integração real com gateway bancário;
- Emissão fiscal;
- Rastreamento por GPS em tempo real;
- Integração com serviços externos de entrega;
- Painel administrativo completo;
- Programa de fidelidade.

## 4. Melhorias realizadas em relação à PIT I

1. O escopo foi delimitado para evitar funcionalidades que não são essenciais ao primeiro produto funcional.
2. As histórias de usuário foram complementadas com critérios de aceitação verificáveis.
3. O backlog foi reorganizado por prioridade, considerando o fluxo principal de compra.
4. A interface foi estruturada com foco em clareza, consistência, simplicidade, feedback imediato e recuperação de erros.
5. A modelagem foi ampliada com classes, casos de uso, sequência e atividade.
6. O modelo de dados foi detalhado em entidades relacionadas a cliente, produto, pedido, item do pedido, pagamento e entrega.
7. Foi definido um projeto físico inicial em SQLite e um dicionário de dados.
8. A arquitetura de implementação foi organizada em camadas, com separação entre interface, regras da aplicação e persistência.

## 5. Arquitetura proposta

A implementação será feita com uma arquitetura simples inspirada em MVC:

- **View:** HTML, CSS e JavaScript para apresentação, navegação, carrinho e validações de interface;
- **Controller:** rotas e processamento das requisições no Flask;
- **Model/Persistência:** acesso ao banco SQLite para produtos, clientes, pedidos, itens, pagamentos e entregas.

Essa separação reduz acoplamento e facilita manutenção, testes e evolução da solução.

## 6. Critérios de qualidade considerados

A revisão priorizou os seguintes aspectos:

- Usabilidade;
- Clareza das mensagens;
- Consistência visual;
- Validação de campos;
- Integridade dos dados;
- Facilidade de manutenção;
- Organização do código;
- Possibilidade de testar o fluxo ponta a ponta.

## 7. Fluxo principal revisado

1. Usuário acessa a aplicação.
2. Sistema apresenta a vitrine de cupcakes.
3. Usuário adiciona um ou mais produtos ao carrinho.
4. Sistema atualiza quantidades e total.
5. Usuário informa seus dados.
6. Usuário escolhe forma de pagamento.
7. Usuário escolhe retirada ou entrega.
8. Sistema valida os dados obrigatórios.
9. Sistema registra pedido e itens.
10. Sistema apresenta confirmação, número do pedido e status inicial.
11. Usuário pode consultar o status usando o número do pedido.

## 8. Resultado da revisão

A documentação passou a descrever de forma mais objetiva a solução que será implementada na PIT II. O projeto mantém a proposta original da PIT I, mas agora possui escopo delimitado, requisitos testáveis, modelagem mais completa, planejamento de interface e estrutura de dados compatível com a etapa de codificação e com os testes posteriores.
