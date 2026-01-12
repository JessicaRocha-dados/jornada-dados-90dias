/*
 * ==============================================================================
 * PROJETO: Relatório de Inteligência de Vendas (Olist E-commerce)
 * DATA: 11/01/2026
 * SOLICITANTE: Diretoria de Marketing 
 * ==============================================================================
 * * PROBLEMA DE NEGÓCIO:
 * A diretoria precisa de um Dataset Analítico para planejar o budget
 * respondendo a 3 perguntas essenciais:
 * 
 * 1. Tendência Temporal: Sazonalidade e evolução 2017/2018.
 * 2. Geografia: Onde estão os melhores clientes (Geo-Marketing).
 * 3. Mix de Produtos: Identificar as "Categorias Estrela".
 * 
 * * SOLUÇÃO TÉCNICA:
 * Query unificada filtrando apenas vendas reais (entregues), eliminando
 * cancelamentos e agregando valor de frete ao faturamento.
 */

WITH Vendas_Consolidadas AS (
    SELECT 
        o.order_id,
        
        -- 1. DATA 
        -- Normalização para data simples (evolução temporal)
        CAST(o.order_purchase_timestamp AS DATE) AS data_venda,
        TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS mes_ano,
        
        -- 2. DINHEIRO (Faturamento Real) 
        -- Soma do Price + Freight para compor o valor total pago pelo cliente
        i.price                                  AS valor_produto,
        i.freight_value                          AS valor_frete,
        (i.price + i.freight_value)              AS valor_total_venda,
        
        -- 3. PRODUTO (Categorias) 
        -- Tratamento de nulos (Coalesce) para não prejudicar a análise de Mix
        COALESCE(p.product_category_name, 'Outros') AS categoria_produto,
        
        -- 4. LOCAL (Geografia) 
        -- Dados para mapas de calor e análise regional
        c.customer_city                          AS cidade_cliente,
        c.customer_state                         AS estado_cliente

    FROM olist_orders_dataset o
    -- JOINs para unificar as tabelas 
    INNER JOIN olist_order_items_dataset i 
        ON o.order_id = i.order_id
    INNER JOIN olist_products_dataset p 
        ON i.product_id = p.product_id
    INNER JOIN olist_customers_dataset c 
        ON o.customer_id = c.customer_id
        
    WHERE 
        -- Filtro de Qualidade: Apenas pedidos entregues 
        o.order_status = 'delivered'
)

-- Geração do Dataset Analítico Final 
SELECT 
    data_venda,
    valor_total_venda,
    categoria_produto,
    estado_cliente,
    cidade_cliente
FROM Vendas_Consolidadas
ORDER BY data_venda DESC;