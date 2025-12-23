/*
--------------------------------------------------------------------------
 ARQUIVO: exercicios_cte_subqueries.sql
 DATA: 23/12/2025
 AUTOR: Jéssica Rocha
 TEMA: Common Table Expressions (WITH) e Subqueries
 DESCRIÇÃO: Refatoração de queries complexas utilizando estruturas 
            de organização de código.
--------------------------------------------------------------------------
*/

-- =======================================================================
-- PARTE 1: SUBQUERIES (Lógica "Matrioska" - Query dentro de Query)
-- =======================================================================

-- 1. Filtro Dinâmico: Pedidos com Frete acima da Média Geral
-- Problema: Filtrar itens cujo frete é maior que a média de TODOS os itens.
-- Lógica: O SQL calcula a média (Subquery) primeiro, depois filtra.

SELECT 
    order_id, 
    freight_value 
FROM olist_order_items_dataset 
WHERE freight_value > (
    SELECT AVG(freight_value) FROM olist_order_items_dataset
);


-- =======================================================================
-- PARTE 2: CTEs - Common Table Expressions (Uso do WITH)
-- =======================================================================

-- 2. Organização: Ranking de Gastos por Cliente (Refatorado com CTE)
-- Problema: Listar clientes ordenados pelo total gasto.
-- Vantagem do WITH: Separa o cálculo (tabela virtual) da exibição final.

WITH gastos_por_cliente AS (
    SELECT 
        c.customer_unique_id, 
        SUM(i.price) AS total_gasto
    FROM olist_customers_dataset AS c 
    INNER JOIN olist_orders_dataset AS o ON c.customer_id = o.customer_id 
    INNER JOIN olist_order_items_dataset AS i ON o.order_id = i.order_id 
    GROUP BY c.customer_unique_id 
)
SELECT * FROM gastos_por_cliente
ORDER BY total_gasto DESC;


-- 3. Análise Regional: Média de Frete por Estado (Refatorado com CTE)
-- Problema: Qual estado tem o frete mais caro em média?

WITH logistica_estados AS (
    SELECT 
        c.customer_state, 
        AVG(i.freight_value) AS media_frete
    FROM olist_customers_dataset AS c 
    INNER JOIN olist_orders_dataset AS o ON c.customer_id = o.customer_id 
    INNER JOIN olist_order_items_dataset AS i ON o.order_id = i.order_id 
    GROUP BY c.customer_state 
)
SELECT * FROM logistica_estados
ORDER BY media_frete DESC;


-- 4. Análise Avançada: Vendedores "Power" de SP (CTE com Filtro)
-- Problema: Vendedores de SP que venderam mais de R$ 50.000 no total.

WITH performance_vendedores_sp AS (
    SELECT 
        s.seller_id, 
        SUM(i.price) AS total_vendido 
    FROM olist_sellers_dataset s
    JOIN olist_order_items_dataset i ON s.seller_id = i.seller_id
    WHERE s.seller_state = 'SP'
    GROUP BY s.seller_id
)
SELECT * FROM performance_vendedores_sp
WHERE total_vendido > 50000;


-- 5. O Grande Final: Categorias de Alto Ticket (CTE + Múltiplos Joins)
-- Problema: Categorias com preço médio de produto acima de R$ 500.00

WITH analise_categorias AS (
    SELECT 
        p.product_category_name, 
        AVG(i.price) AS media_preco
    FROM olist_products_dataset AS p 
    INNER JOIN olist_order_items_dataset AS i ON p.product_id = i.product_id 
    GROUP BY p.product_category_name
)
SELECT * FROM analise_categorias 
WHERE media_preco > 500;














