

# 🛍️ Projeto de Banco de Dados para E-commerce

Este repositório contém o **script SQL** para a criação e manipulação de um banco de dados relacional, modelado para um cenário de **e-commerce**.
O projeto foi desenvolvido como parte do desafio da [DIO](https://www.dio.me/) *"Construindo seu Primeiro Projeto Lógico de Banco de Dados"*.

---

## 📌 Visão Geral

O objetivo deste projeto foi aplicar os conceitos de **modelagem de banco de dados**, desde o **esquema conceitual** até a **implementação em SQL**.

O banco de dados abrange as principais entidades de um sistema de vendas online:

* 👤 **Clientes** (Pessoa Física e Pessoa Jurídica)
* 📦 **Produtos** com categorias, avaliações e dimensões
* 🛒 **Pedidos** com status e rastreio
* 💳 **Pagamentos** múltiplos por cliente
* 🏬 **Estoque** em diferentes localidades
* 🚚 **Fornecedores** de produtos
* 🏷️ **Vendedores terceirizados (Sellers)**

---

## 🗂️ Estrutura do Banco de Dados

O script `ecommerce_script_creation.sql` cria as seguintes tabelas:

* **clients** → Armazena dados dos clientes (PF e PJ)
* **product** → Informações dos produtos à venda
* **orders** → Registra pedidos feitos pelos clientes
* **payments** → Gerencia formas de pagamento dos clientes
* **productStorage** → Controla o estoque de produtos em diferentes locais
* **supplier** → Dados dos fornecedores
* **seller** → Registra vendedores terceirizados

🔗 **Tabelas de Relacionamento:**
`productOrder`, `productSeller`, `productSupplier`, `storageLocation` (para relações Muitos-para-Muitos).

---

## ⚙️ Regras de Negócio e Refinamentos

* ✅ **Cliente PF e PJ** → Uso de `CHECK` para validar CPF ou CNPJ de acordo com o tipo de cliente
* ✅ **Pedidos com rastreio** → Coluna `trackingCode` em `orders`
* ✅ **Múltiplas formas de pagamento** → Um cliente pode cadastrar vários meios de pagamento

---

## 🔍 Exemplos de Consultas

Algumas perguntas que podem ser respondidas:

* Quais clientes pessoa física fizeram **2 ou mais pedidos**?
* Qual a **popularidade dos produtos** baseada nas avaliações?
* Quais são os **produtos, seus fornecedores e os locais de estoque**?
* Qual o **faturamento total por vendedor (terceiro)**?

📌 **Exemplo de Query – Clientes Recorrentes (PF):**

```sql
SELECT 
    c.Fname AS Nome, 
    c.Lname AS Sobrenome, 
    COUNT(o.idOrders) AS Quantidade_Pedidos
FROM clients c
JOIN orders o ON c.idClient = o.idOrdersClient
WHERE c.ClientType = 'PF'
GROUP BY c.idClient
HAVING COUNT(o.idOrders) >= 2;
```

---

## 🚀 Como Utilizar

1. Clone este repositório:

   ```bash
   git clone <[Projeto-db-ecommerce](https://github.com/Yasmink-godinho/Projeto-db-ecommerce.git)>
   ```
2. Abra o arquivo `ecommerce_script_creation.sql` em um SGBD compatível com **MySQL** (Workbench, DBeaver, etc.).
3. Execute o script completo → será criado o banco `ecommerce` com tabelas e dados de exemplo.
4. Explore e rode suas próprias queries! 🎯

---

## 📖 Tecnologias Utilizadas

* **MySQL** 🐬
* **Modelagem de Banco de Dados**
* **SQL Queries**

---

## ✨ Autor

👩‍💻 Desenvolvido por [Yasmin Godinho](https://github.com/YasminK-godinho)

📌 Desafio proposto pela [DIO](https://www.dio.me/)

