# 02 — Requisitos, histórias de usuário e backlog

## 1. Requisitos funcionais

- **RF01:** O sistema deve exibir o catálogo de cupcakes.
- **RF02:** O sistema deve exibir nome, descrição e preço de cada produto.
- **RF03:** O usuário deve poder adicionar produtos ao carrinho.
- **RF04:** O usuário deve poder alterar a quantidade de um item.
- **RF05:** O usuário deve poder remover itens do carrinho.
- **RF06:** O sistema deve calcular automaticamente o valor total do pedido.
- **RF07:** O sistema deve solicitar nome e telefone do cliente.
- **RF08:** O sistema deve solicitar endereço quando a modalidade escolhida for entrega.
- **RF09:** O usuário deve poder escolher a forma de pagamento.
- **RF10:** O usuário deve poder escolher entre retirada e entrega.
- **RF11:** O sistema deve validar os campos obrigatórios antes da finalização.
- **RF12:** O sistema deve registrar o pedido e seus itens no banco de dados.
- **RF13:** O sistema deve gerar um identificador para o pedido.
- **RF14:** O sistema deve apresentar uma mensagem de confirmação após o registro.
- **RF15:** O sistema deve permitir consultar o status básico de um pedido.

## 2. Requisitos não funcionais

- **RNF01:** A interface deve ser responsiva e utilizável em celular e computador.
- **RNF02:** As mensagens de validação devem ser claras e próximas ao contexto do erro.
- **RNF03:** O banco deve preservar integridade entre pedidos, itens e produtos.
- **RNF04:** A aplicação deve separar interface, processamento e persistência.
- **RNF05:** O fluxo principal deve exigir poucas etapas e evitar informações desnecessárias.
- **RNF06:** O código e a documentação devem permanecer versionados no GitHub.

## 3. Histórias de usuário

### HU01 — Visualizar catálogo
**Como** cliente, **quero** visualizar os cupcakes disponíveis **para** escolher os produtos desejados.

**Critérios de aceitação:**
- O catálogo exibe nome, descrição e preço.
- Produtos são apresentados de forma legível.
- A ação de adicionar ao carrinho está disponível.

### HU02 — Montar carrinho
**Como** cliente, **quero** adicionar, remover e alterar quantidades de cupcakes **para** montar meu pedido.

**Critérios de aceitação:**
- Adicionar um produto aumenta a quantidade no carrinho.
- Remover exclui o item.
- Alterar quantidade atualiza o total.
- Quantidades inválidas não são aceitas.

### HU03 — Visualizar total
**Como** cliente, **quero** visualizar o valor atualizado do pedido **para** saber quanto será pago.

**Critérios de aceitação:**
- O total é recalculado após cada alteração.
- O valor exibido corresponde à soma dos itens.

### HU04 — Informar dados do cliente
**Como** cliente, **quero** informar meus dados de contato **para** identificar o pedido.

**Critérios de aceitação:**
- Nome e telefone são obrigatórios.
- O sistema informa quando um campo obrigatório está ausente.

### HU05 — Escolher entrega
**Como** cliente, **quero** selecionar retirada ou entrega **para** definir como receberei o pedido.

**Critérios de aceitação:**
- As duas opções ficam visíveis.
- Endereço passa a ser obrigatório somente para entrega.

### HU06 — Escolher pagamento
**Como** cliente, **quero** selecionar a forma de pagamento **para** concluir a solicitação de compra.

**Critérios de aceitação:**
- Ao menos uma forma de pagamento deve ser escolhida.
- A seleção é registrada junto ao pedido.

### HU07 — Finalizar pedido
**Como** cliente, **quero** finalizar o pedido **para** receber uma confirmação de que ele foi registrado.

**Critérios de aceitação:**
- Carrinho vazio não pode ser finalizado.
- Dados obrigatórios são validados.
- Pedido e itens são persistidos.
- O sistema retorna um número de pedido.

### HU08 — Consultar status
**Como** cliente, **quero** consultar o status do pedido **para** acompanhar seu andamento.

**Critérios de aceitação:**
- A consulta recebe o número do pedido.
- Pedido existente retorna o status atual.
- Pedido inexistente gera mensagem compreensível.

## 4. Backlog priorizado

| Prioridade | Item | História/Requisito | Entrega esperada |
|---|---|---|---|
| 1 | Catálogo | HU01 / RF01-RF02 | Vitrine funcional |
| 2 | Carrinho | HU02 / RF03-RF05 | Adição, remoção e quantidade |
| 3 | Cálculo de total | HU03 / RF06 | Total automático |
| 4 | Dados do cliente | HU04 / RF07-RF08 | Formulário validado |
| 5 | Pagamento | HU06 / RF09 | Seleção registrada |
| 6 | Entrega/retirada | HU05 / RF10 | Modalidade e endereço condicional |
| 7 | Finalização | HU07 / RF11-RF14 | Pedido persistido e confirmado |
| 8 | Consulta de status | HU08 / RF15 | Consulta pelo identificador |
| 9 | Responsividade | RNF01 | Interface adaptável |
| 10 | Tratamento de erros | RNF02 | Feedback claro ao usuário |

## 5. Definição de pronto para a primeira versão funcional

A primeira versão será considerada pronta quando o usuário conseguir navegar pelo catálogo, adicionar produtos ao carrinho, informar os dados obrigatórios, selecionar pagamento e entrega, registrar o pedido e receber uma confirmação com o número do pedido. O fluxo também deverá impedir finalização de carrinho vazio e registrar os dados de forma consistente no banco.
