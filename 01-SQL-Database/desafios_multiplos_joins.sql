
/* Análise: ANÁLISE DE DADOS OLIST - JOINS E RELACIONAMENTOS
-- Autor: Jéssica Rocha
-- Tema: SQL Joins (INNER JOIN), Agregações e Filtros Avançados 
 * Data: 22/12/2025
 */


1. Eu quero saber qual Estado (UF) traz mais dinheiro para a empresa.
      O estado (customer_state) na tabela de Clientes.
      O valor (price) na tabela de Itens.
      A tabela de Pedidos serve apenas como a ponte para ligar as duas.

SELECT c.customer_state, SUM (i.price)
FROM olist_customers_dataset AS c 
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id
GROUP BY c.customer_state
ORDER BY SUM(i.price) DESC;

2. Quem gasta mais? (Customer + Order + Item)
Queremos saber quais clientes (customer_unique_id) deixaram mais dinheiro na loja (SUM de price).

SELECT c.customer_unique_id, SUM(i.price)
FROM olist_customers_dataset AS c
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id 
GROUP BY c.customer_unique_id
ORDER BY SUM(i.price) DESC; 

3. O Estado do Frete Caro (Customer + Order + Item)

Qual estado (customer_state) paga o frete (freight_value) mais caro em média?

SELECT c.customer_state, AVG(i.freight_value)
FROM olist_customers_dataset AS c
INNER JOIN olist_orders_dataset AS o 
ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset AS i
ON  o.order_id = i.order_id
GROUP BY c.customer_state 
ORDER BY AVG(i.freight_value) DESC; 

4. As Cidades mais "Consumistas" (Customer + Order + Item) 
Quais cidades (customer_city) compraram a maior quantidade de itens no total?

SELECT c.customer_city, COUNT(*)
FROM olist_customers_dataset AS c
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id
GROUP BY c.customer_city
ORDER BY COUNT(*) DESC; 

Como o Carioca Paga? (Customer + Order + Payment)

5. Queremos saber: Quais são os tipos de pagamento preferidos pelos clientes do Rio de Janeiro?

SELECT p.payment_type, COUNT(*)
FROM olist_customers_dataset AS c
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_payments_dataset AS p
ON o.order_id = p.order_id
WHERE c.customer_state = 'RJ'
GROUP BY p.payment_type
ORDER BY COUNT(*) DESC;

6. Qual estado (customer_state) tem a maior média de parcelas (payment_installments)?

SELECT c.customer_state, AVG(p.payment_installments)
FROM olist_customers_dataset AS c
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_payments_dataset AS p 
ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY AVG(p.payment_installments) DESC;  

7. Quais categorias de produtos (product_category_name) são as mais vendidas para clientes de São Paulo ('SP')?

SELECT prod.product_category_name, COUNT(*)
FROM olist_customers_dataset AS c 
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id
INNER JOIN olist_products_dataset AS prod
ON i.product_id = prod.product_id
WHERE c.customer_state = 'SP'
GROUP BY prod.product_category_name
ORDER BY COUNT(*) DESC

8. Qual foi o valor MAIS ALTO (MAX) pago em um único item por um cliente de Minas Gerais ('MG')?

SELECT MAX(i.price)
FROM olist_customers_dataset AS c
INNER JOIN olist_orders_dataset AS o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id
WHERE c.customer_state = 'MG'

9. Qual foi o valor total (SUM de price) vendido por cada categoria (product_category_name), considerando apenas os pedidos com status 'delivered'?

SELECT p.product_category_name, SUM(i.price)
FROM olist_products_dataset AS p
INNER JOIN olist_order_items_dataset AS i
ON p.product_id = i.product_id 
INNER JOIN olist_orders_dataset AS o
ON i.order_id = o.order_id
WHERE o.order_status = 'delivered' 
GROUP BY p.product_category_name 
ORDER BY SUM(i.price) DESC; 


10. Quantas vendas ocorreram onde o vendedor e o cliente são do MESMO estado? (Isso é ótimo para logística, frete mais barato e rápido).

SELECT COUNT(*)
FROM olist_sellers_dataset AS s 
INNER JOIN olist_order_items_dataset AS i
ON s.seller_id = i.seller_id 
INNER JOIN olist_orders_dataset AS o
ON i.order_id = o.order_id
INNER JOIN olist_customers_dataset AS c
ON o.customer_id = c.customer_id
WHERE s.seller_state = c.customer_state 

























































