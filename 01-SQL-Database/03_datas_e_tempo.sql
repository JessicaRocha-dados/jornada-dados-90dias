-- ============================================================================
-- ARQUIVO: 03_datas_e_tempo.sql
-- TEMA: Análise Temporal e Tratamento de Dados 
-- ============================================================================

-- 1. CÁLCULO DE INTERVALOS (Subtração de Datas)
-- Calcular o Tempo de Entrega (Lead Time)
SELECT 
    order_id,
    order_delivered_customer_date,
    order_purchase_timestamp, 
    (order_delivered_customer_date - order_purchase_timestamp) AS tempo_entrega
FROM olist_orders_dataset
WHERE order_status = 'delivered'
LIMIT 10;

-- 2. LIMPEZA DE DADOS (Data Cleaning)
-- Solução para erro de tipos (Text vs Timestamp) e campos vazios ('')
-- Fórmula: CAST(NULLIF(coluna, '') AS TIMESTAMP)
SELECT 
    AVG(
        CAST(NULLIF(order_delivered_customer_date, '') AS TIMESTAMP) - 
        CAST(NULLIF(order_purchase_timestamp, '') AS TIMESTAMP)
    ) AS tempo_medio_entrega_global
FROM olist_orders_dataset
WHERE order_status = 'delivered';

-- 3. EXTRAÇÃO DE INFORMAÇÕES (EXTRACT)
-- Qual ano teve mais vendas? (Extraindo o Ano)
SELECT 
    EXTRACT(YEAR FROM CAST(NULLIF(order_purchase_timestamp, '') AS TIMESTAMP)) AS ano,
    COUNT(*) AS total_vendas
FROM olist_orders_dataset
GROUP BY ano
ORDER BY total_vendas DESC;

-- Sazonalidade Mensal (Qual mês vende mais?)
SELECT 
    EXTRACT(MONTH FROM CAST(NULLIF(order_purchase_timestamp, '') AS TIMESTAMP)) AS mes,
    COUNT(*) AS total_vendas
FROM olist_orders_dataset
GROUP BY mes
ORDER BY total_vendas DESC;