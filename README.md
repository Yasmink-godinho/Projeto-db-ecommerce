Projeto de Banco de Dados para E-commerce
Este repositório contém o script SQL para a criação e manipulação de um banco de dados relacional, modelado para um cenário de e-commerce. O projeto foi desenvolvido como parte do desafio "Construindo seu Primeiro Projeto Lógico de Banco de Dados" da DIO.

Visão Geral do Projeto
O objetivo deste projeto foi aplicar os conceitos de modelagem de banco de dados, desde o esquema conceitual até a criação do script SQL. O banco de dados implementa as entidades essenciais de um sistema de vendas online, como clientes, produtos, pedidos e fornecedores, e estabelece os relacionamentos entre elas para garantir a integridade e a consistência dos dados.

Cenário Modelado
O esquema foi projetado para suportar as operações de um e-commerce que vende produtos de diversas categorias. O sistema gerencia:

Clientes que podem ser tanto Pessoa Física (PF) quanto Pessoa Jurídica (PJ).

Produtos com categorias, avaliações e dimensões.

Pedidos realizados pelos clientes, com status de processamento e código de rastreio.

Pagamentos, permitindo que um cliente tenha múltiplas formas de pagamento.

Estoque de produtos em diferentes localidades.

Fornecedores que abastecem o estoque.

Vendedores Terceirizados (Sellers) que também podem ofertar produtos na plataforma.

Estrutura do Banco de Dados
O script ecommerce_script.sql cria as seguintes tabelas:

clients: Armazena os dados dos clientes (PF e PJ).

product: Contém as informações dos produtos à venda.

orders: Registra os pedidos feitos pelos clientes.

payments: Gerencia as formas de pagamento associadas aos clientes.

productStorage: Controla a quantidade de produtos em cada local de estoque.

supplier: Armazena os dados dos fornecedores.

seller: Registra os vendedores terceirizados.

Tabelas de Relacionamento: productOrder, productSeller, productSupplier e storageLocation para criar as conexões Muitos-para-Muitos.

Refinamentos e Regras de Negócio
Durante o desenvolvimento, foram implementados os seguintes refinamentos, conforme solicitado pelo desafio:

Cliente PF e PJ: A tabela clients foi ajustada para diferenciar os tipos de cliente. Uma constraint do tipo CHECK foi adicionada para garantir que um cliente PF tenha apenas CPF e um cliente PJ tenha apenas CNPJ.

Status e Rastreio da Entrega: A tabela orders foi incrementada com a coluna trackingCode para armazenar o código de rastreio da entrega, permitindo um acompanhamento mais detalhado do pedido.

Múltiplas Formas de Pagamento: A estrutura suporta que um mesmo cliente cadastre diversas formas de pagamento.

Exemplos de Consultas (Queries)
O banco de dados foi populado com dados de exemplo para permitir a execução de consultas complexas. Alguns exemplos de perguntas de negócio que podem ser respondidas são:

Quais clientes pessoa física fizeram 2 ou mais pedidos?

Qual a classificação de popularidade dos produtos com base em sua avaliação?

Qual a relação completa de produtos, seus fornecedores e o local de estoque?

Qual o faturamento total por vendedor (terceiro)?

Exemplo de Query - Clientes Recorrentes (PF):

SELECT
    c.Fname AS Nome,
    c.Lname AS Sobrenome,
    COUNT(o.idOrders) AS Quantidade_Pedidos
FROM
    clients c
JOIN
    orders o ON c.idClient = o.idOrdersClient
WHERE
    c.ClientType = 'PF'
GROUP BY
    c.idClient
HAVING
    COUNT(o.idOrders) >= 2;

Como Utilizar
Clone este repositório ou faça o download do arquivo ecommerce_script.sql.

Abra o arquivo em um Sistema de Gerenciamento de Banco de Dados que suporte MySQL (como MySQL Workbench, DBeaver, etc.).

Execute o script completo. Ele criará o banco de dados ecommerce, todas as tabelas, e inserirá os dados de exemplo.

Após a execução, você poderá realizar suas próprias consultas na base de dados.
