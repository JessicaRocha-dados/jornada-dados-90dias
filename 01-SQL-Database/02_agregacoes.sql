-- ============================================================================
-- ARQUIVO: 02_agregacoes.sql
-- TEMA: Agregações, Agrupamentos e HAVING (Semana 2)
-- ============================================================================

-- 1. FUNÇÕES DE AGREGAÇÃO (COUNT, SUM, AVG)
-- Contar quantos clientes existem no total
SELECT COUNT(*) AS total_clientes 
FROM olist_customers_dataset;

-- Somar o faturamento total da empresa
SELECT SUM(price) AS faturamento_total 
FROM olist_order_items_dataset;

-- Calcular a média do valor do frete
SELECT AVG(freight_value) AS media_frete 
FROM olist_order_items_dataset;

-- 2. AGRUPAMENTOS (GROUP BY)
-- Contar clientes por Estado (Ranking de Estados)
SELECT customer_state, COUNT(*) AS total_clientes
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_clientes DESC;

-- Faturamento por Vendedor (Top 5 Melhores Vendedores)
SELECT seller_id, SUM(price) AS faturamento_vendedor
FROM olist_order_items_dataset
GROUP BY seller_id
ORDER BY faturamento_vendedor DESC
LIMIT 5;

-- 3. FILTROS DE GRUPO (HAVING)
-- Mostrar apenas estados que tenham MAIS de 1.000 clientes
SELECT customer_state, COUNT(*) 
FROM olist_customers_dataset
GROUP BY customer_state
HAVING COUNT(*) > 1000
ORDER BY COUNT(*) DESC;

-- O Combo Completo: WHERE + GROUP BY + HAVING
-- Vendedores que venderam mais de 100 itens BARATOS (< 20 reais)
SELECT seller_id, COUNT(*)
FROM olist_order_items_dataset
WHERE price < 20       -- Filtro de Linha (Antes)
GROUP BY seller_id     -- Agrupamento
HAVING COUNT(*) > 100  -- Filtro de Grupo (Depois)
ORDER BY COUNT(*) DESC;