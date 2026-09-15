# PIT II — Cupcakes Gourmet

Projeto acadêmico de **Eliseu Souza dos Santos — RGM 33118141**, desenvolvido como continuidade da PIT I do curso de Engenharia de Software.

## Proposta

A solução consiste em uma aplicação para uma loja de cupcakes gourmet. A PIT II dá continuidade ao planejamento realizado na PIT I, revisando e aprimorando requisitos, interface, modelagem UML e estrutura de dados antes da implementação e dos testes.

## Objetivo da solução

Disponibilizar uma vitrine digital de cupcakes, permitir seleção de produtos, montagem do pedido, identificação do cliente, escolha de pagamento e modalidade de entrega, registro do pedido e acompanhamento simplificado de status.

## Funcionalidades implementadas

- Catálogo/vitrine de cupcakes;
- Visualização de nome e preço;
- Inclusão e remoção de produtos no carrinho;
- Alteração de quantidades;
- Cálculo automático do total;
- Cadastro dos dados do cliente;
- Escolha da forma de pagamento;
- Escolha entre retirada e entrega;
- Exibição condicional dos campos de endereço;
- Validação de campos obrigatórios;
- Confirmação com código do pedido;
- Consulta simplificada do último pedido;
- Interface responsiva para computador e celular.

## Demonstração da solução em funcionamento

Versão web pública de demonstração:

https://rawcdn.githack.com/Keidsonvander/pit-ii-eliseu-cupcakes-gourmet/cd7b317783c7e104f4f12ab4756b0d6937cbe48e/index.html

A demonstração pública utiliza HTML, CSS e JavaScript e salva o último pedido localmente no navegador. O repositório também contém o back-end em Python/Flask e o projeto de persistência SQLite.

## Documentação da PIT II

A documentação revisada está organizada na pasta `docs`:

1. `01_DOCUMENTACAO_REVISADA.md` — escopo, objetivo, melhorias e arquitetura proposta;
2. `02_REQUISITOS_E_BACKLOG.md` — requisitos, histórias de usuário, critérios de aceitação e backlog;
3. `03_UML_E_IHC.md` — diagramas UML e definição da interface;
4. `04_BANCO_E_DICIONARIO.md` — modelo de dados, projeto lógico e dicionário de dados.

O projeto físico inicial do banco encontra-se em `database/schema.sql`.

## Tecnologias

- Front-end: HTML5, CSS3 e JavaScript;
- Back-end: Python com Flask;
- Banco de dados: SQLite;
- Controle de versão: Git/GitHub;
- Modo de codificação: tradicional.

## Execução local com back-end

1. Instalar Python 3;
2. Executar `pip install -r requirements.txt`;
3. Executar `python app.py`;
4. Acessar `http://127.0.0.1:5000` no navegador.

## Etapas da PIT II

- [x] Revisão e melhoria da documentação da PIT I;
- [x] Revisão de requisitos e backlog;
- [x] Modelagem UML e IHC;
- [x] Projeto de banco de dados e dicionário de dados;
- [x] Codificação do front-end;
- [x] Codificação do back-end;
- [x] Demonstração pública da solução;
- [ ] Testes com cinco usuários;
- [ ] Laudo de qualidade e correções;
- [ ] Vídeo final da solução atualizada.
