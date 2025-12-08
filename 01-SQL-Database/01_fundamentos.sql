-- ============================================================================
-- ARQUIVO: 01_fundamentos.sql
-- TEMA: Comandos Básicos e Filtros (Semana 1)
-- ============================================================================

-- 1. CONSULTAS BÁSICAS (SELECT, DISTINCT)
-- Selecionar todas as colunas da tabela de clientes
SELECT * FROM olist_customers_dataset;

-- Listar apenas os estados únicos onde temos clientes
SELECT DISTINCT customer_state 
FROM olist_customers_dataset;

-- 2. FILTROS (WHERE)
-- Filtrar clientes apenas do estado de São Paulo ('SP')
SELECT * FROM olist_customers_dataset 
WHERE customer_state = 'SP';

-- 3. LÓGICA COMPOSTA (AND, OR, IN, BETWEEN)
-- Produtos da categoria 'bebes' E que tenham mais de 0 fotos
SELECT * FROM olist_products_dataset 
WHERE product_category_name = 'bebes' 
  AND product_photos_qty > 0;

-- Usando IN para filtrar múltiplos estados de uma vez
SELECT * FROM olist_customers_dataset 
WHERE customer_state IN ('SP', 'RJ', 'MG');

-- Usando BETWEEN para filtrar faixa de preço (entre 10 e 50 reais)
SELECT * FROM olist_order_items_dataset 
WHERE price BETWEEN 10 AND 50;

-- 4. WILDCARDS (LIKE)
-- Buscar cidades que começam com 'sao' (ex: Sao Paulo, Sao Luis)
SELECT DISTINCT customer_city 
FROM olist_customers_dataset 
WHERE customer_city LIKE 'sao%';

-- 5. ORDENAÇÃO E LIMITES (ORDER BY, LIMIT)
-- Top 10 produtos mais caros
SELECT * FROM olist_order_items_dataset 
ORDER BY price DESC 
LIMIT 10;