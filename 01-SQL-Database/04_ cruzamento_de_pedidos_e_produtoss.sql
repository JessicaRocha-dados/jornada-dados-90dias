/* Análise: Cruzamento de Pedidos e Produtos
  Data: 15/12/2025
  Autor: Jéssica Rocha
*/

SELECT 
    o.order_id,
    o.order_status,
    i.price,
    p.product_category_name
FROM olist_orders_dataset AS o
-- Primeiro JOIN: Conectar pedidos aos itens
INNER JOIN olist_order_items_dataset AS i
    ON o.order_id = i.order_id
-- Segundo JOIN: Conectar itens aos produtos para ver a categoria
LEFT JOIN olist_products_dataset AS p
    ON i.product_id = p.product_id
WHERE 
    o.order_status = 'delivered'
ORDER BY 
    i.price DESC;

/* Análise: Cruzamento de Pedidos e Produtos
  Data: 16/12/2025
  Autor: Jéssica Rocha
*/

/* EXERCICIOS 
A equipe de Marketing quer saber de onde são os nossos
clientes para planejar campanhas regionais.
Gere uma lista mostrando o ID do Pedido (order_id)
e o Estado do Cliente (customer_state) para todos os pedidos.
*/

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'olist_orders_dataset';

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'olist_customers_dataset';


SELECT 
    o.order_id,          
    c.customer_state     
FROM 
    olist_orders_dataset AS o 
INNER JOIN 
    olist_customers_dataset AS c
ON 
    o.customer_id = c.customer_id;

/*Preciso de um ranking mostrando a sigla do Estado e
*a Quantidade Total de Pedidos feitos nele, 
*ordenado do maior para o menor.
*/ 
SELECT 
    c.customer_state,
    COUNT(o.order_id) AS total_pedidos  
FROM 
    olist_orders_dataset AS o
INNER JOIN 
    olist_customers_dataset AS c
ON 
    o.customer_id = c.customer_id
GROUP BY
    c.customer_state 
ORDER BY 
    total_pedidos DESC;


/* O Problema: "O Diretor quer saber: Quais categorias 
 * trazem mais receita (dinheiro) para a empresa? 
 * Mostre o Nome da Categoria e a Soma dos Preços (price), 
 **ordenando do maior faturamento para o menor."
*/

SELECT 
    p.product_category_name,
    SUM(i.price) AS total_faturamento
FROM 
    olist_order_items_dataset AS i
INNER JOIN 
    olist_products_dataset AS p
ON 
    i.product_id = p. product_id      
GROUP BY 
    p.product_category_name
ORDER BY 
    total_faturamento DESC;


/* Eu quero saber o desempenho apenas dos Vendedores de SP.
 * Por favor, liste o ID do Vendedor e o Valor do Frete (freight_value) de cada venda, mas
 * SOMENTE para vendedores que são do estado de SP (seller_state = 'SP').
 */

SELECT 
    s.seller_id, 
    i.freight_value     
FROM 
    olist_order_items_dataset AS i
INNER JOIN 
    olist_sellers_dataset AS s
ON 
    i.seller_id = s.seller_id
WHERE 
    s.seller_state = 'SP';


/* O Diretor Regional do Rio de Janeiro quer premiar os vendedores de destaque.
 * Gere um ranking mostrando o ID do Vendedor (seller_id) e o Faturamento Total
 * (SUM(price)), mas apenas para vendedores que são do estado do Rio de Janeiro ('RJ'). Ordene a lista de quem vendeu mais para quem vendeu menos."
 * 
 */* 

SELECT 
    s.seller_id, 
    SUM(i.price) AS total_vendido  
FROM                              
    olist_order_items_dataset AS i
INNER JOIN                         
    olist_sellers_dataset AS s
ON                                  
    i.seller_id = s.seller_id
WHERE 
    s.seller_state = 'RJ'
GROUP BY                            
    s.seller_id
ORDER BY                          
    total_vendido DESC;




























