# 🛒 Prática Intensiva: Queries de Negócio (Olist)
**Tópico:** Filtros (`WHERE`), Operadores Lógicos e Datas.
**Status:** ✅ Concluído

Este documento contém a resolução de 10 problemas de negócio reais, traduzidos para SQL.

---

## 🟢 Nível 1: Filtros Simples

### 1. Vendas de Alto Valor
**Problema:** "Quero ver apenas os pedidos com valor (`total_amount`) superior a R$ 1.000,00."
```sql
SELECT * FROM olist_orders_analytics 
WHERE total_amount > 1000;

2. O Ano de Ouro (2017)
Problema: "Traga apenas os pedidos realizados no ano de 2017."
SELECT * FROM olist_orders_analytics 
WHERE EXTRACT(YEAR FROM purchase_date) = 2017;

3. Pedidos Pendentes (O Limbo)
Problema: "Quais pedidos ainda não foram entregues? (Data de entrega vazia)."

SELECT * FROM olist_orders_analytics 
WHERE delivered_date IS NULL;


🟡 Nível 2: Filtros de Data e Texto
4. A Campanha de Natal
Problema: "Quero analisar as vendas feitas especificamente no dia 25 de Dezembro de 2017.

SELECT * FROM olist_orders_analytics 
WHERE DATE(purchase_date) = '2017-12-25';

5. Primeiro Trimestre (Range)
Problema: "Filtre os pedidos feitos entre 1 de Janeiro de 2018 e 31 de Março de 2018."

SELECT * FROM olist_orders_analytics 
WHERE purchase_date BETWEEN '2018-01-01' AND '2018-03-31';

6. Final de Semana
Problema: "Quero ver pedidos feitos no Sábado (6) ou Domingo (0)."

SELECT * FROM olist_orders_analytics 
WHERE EXTRACT(DOW FROM purchase_date) IN (0, 6);

Nível 3: Lógica Composta (AND / OR)
7. O Cliente VIP (Recente e Caro)
Problema: "Pedidos feitos em 2018 E que custaram mais de R$ 500."

SELECT * FROM olist_orders_analytics 
WHERE EXTRACT(YEAR FROM purchase_date) = 2018 
  AND total_amount > 500;

8. O "Problemão" (Atrasado ou Cancelado)
Problema: "Pedidos que atrasaram (entrega > estimativa) OU que nem foram entregues ainda."

SELECT * FROM olist_orders_analytics
WHERE (delivered_date > estimated_date)
   OR (delivered_date IS NULL);

9. Aprovação Relâmpago
Problema: "Pedidos onde a aprovação aconteceu no mesmo dia da compra."

SELECT * FROM olist_orders_analytics 
WHERE DATE(approved_date) = DATE(purchase_date);

10. Validação de Dados (Limpeza)
Problema: "Traga todos os pedidos onde o valor NÃO seja zero.

SELECT * FROM olist_orders_analytics 
WHERE total_amount <> 0;
