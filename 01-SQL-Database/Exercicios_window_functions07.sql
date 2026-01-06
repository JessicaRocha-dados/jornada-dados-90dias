/*
PROJETO: Análise de Vendas e Performance de Vendedores (Olist Dataset)
FOCO: Estudo de Window Functions (Funções de Janela)
AUTORA: Jéssica Rocha
DATA: Janeiro/2026
*/

-- =========================================================
-- EXERCÍCIO 1: O Extrato Acumulado (SUM com ORDER BY)
-- =========================================================
SELECT 
    seller_id,
    order_id,
    shipping_limit_date,
    price,
    SUM(price) OVER (
        PARTITION BY seller_id 
        ORDER BY shipping_limit_date
    ) AS faturamento_acumulado
FROM olist_order_items_dataset 
ORDER BY seller_id, shipping_limit_date;

-- =========================================================
-- EXERCÍCIO 2: Variação de Preço (LAG)
-- =========================================================
SELECT 
    seller_id,
    shipping_limit_date,
    price,
    LAG(price) OVER (
        PARTITION BY seller_id 
        ORDER BY shipping_limit_date
    ) AS preco_venda_anterior
FROM olist_order_items_dataset;

-- =========================================================
-- EXERCÍCIO 3: Ranking de Vendas por Categoria (DENSE_RANK)
-- =========================================================


SELECT 
    seller_id,
    product_id,
    price,
    DENSE_RANK() OVER (
        PARTITION BY product_id 
        ORDER BY price DESC
    ) AS ranking_preco
FROM olist_order_items_dataset;

-- =========================================================
-- EXERCÍCIO 4: Identificando a "Primeira Venda" (ROW_NUMBER)
-- Objetivo: Diferente do RANK, o ROW_NUMBER não repete números.
-- Útil para remover duplicatas ou pegar apenas o primeiro registro.
-- =========================================================
SELECT 
    seller_id,
    order_id,
    shipping_limit_date,
    ROW_NUMBER() OVER (
        PARTITION BY seller_id 
        ORDER BY shipping_limit_date ASC
    ) AS numero_sequencial_venda
FROM olist_order_items_dataset;

-- =========================================================
-- EXERCÍCIO 5: Olhando para o Futuro (LEAD)
-- Objetivo: Comparar a data da venda atual com a PRÓXIMA venda.
-- Útil para calcular o tempo de inatividade do vendedor (Churn).
-- =========================================================
SELECT 
    seller_id,
    order_id,
    shipping_limit_date AS data_venda_atual,
    LEAD(shipping_limit_date) OVER (
        PARTITION BY seller_id 
        ORDER BY shipping_limit_date
    ) AS data_proxima_venda
FROM olist_order_items_dataset;

-- =========================================================
-- EXERCÍCIO 6: Média Móvel de 3 Períodos (AVG com ROWS)
-- Objetivo: Suavizar a curva de preços (Média da venda atual + 2 anteriores).
-- Muito usado em análises financeiras para ver tendências.
-- =========================================================
SELECT 
    seller_id,
    price,
    AVG(price) OVER (
        PARTITION BY seller_id 
        ORDER BY shipping_limit_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS media_movel_3_vendas
FROM olist_order_items_dataset;

-- =========================================================
-- EXERCÍCIO 7: Comparativo com o Máximo (MAX Window)
-- Objetivo: Comparar o preço da venda atual com a MELHOR venda daquele vendedor.
-- Mostra o quão longe a venda atual está do recorde pessoal.
-- =========================================================
SELECT 
    seller_id,
    price AS preco_atual,
    MAX(price) OVER (
        PARTITION BY seller_id
    ) AS maior_venda_do_vendedor,
    -- Calculando a % em relação ao máximo
    (price / MAX(price) OVER (PARTITION BY seller_id)) * 100 AS percentual_do_maximo
FROM olist_order_items_dataset;

-- =========================================================
-- EXERCÍCIO 8: Segmentação em Quartis (NTILE)
-- Objetivo: Dividir os produtos em 4 grupos de preço (Do mais barato ao mais caro).
-- 1 = 25% mais baratos ... 4 = 25% mais caros.
-- =========================================================
SELECT 
    product_id,
    price,
    NTILE(4) OVER (
        ORDER BY price
    ) AS quartil_preco
FROM olist_order_items_dataset;













