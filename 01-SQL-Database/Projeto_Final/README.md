# 📊 Monitoramento de Performance de Vendas - Olist

## 📖 Sobre o Projeto
Este projeto simulou um desafio real de **Business Intelligence**. O objetivo foi atuar como parceiro da Diretoria de Marketing da Olist para resolver a falta de visibilidade sobre os dados de vendas, essencial para o **Planejamento Orçamentário Anual**.

A solução consistiu em processar dados brutos via **SQL** (focando em integridade e limpeza) e construir um Dashboard interativo com **Python** para facilitar a tomada de decisão.

---

## 🎯 O Problema de Negócio
A diretoria precisava responder a 3 perguntas estratégicas para definir o orçamento:
1.  **Tendência Temporal:** Qual a sazonalidade das vendas e evolução mensal?
2.  **Geografia (Geo-Marketing):** Onde estão os melhores clientes?
3.  **Mix de Produtos:** Quais categorias são os "Carros-Chefe" da empresa?

---

## ⚙️ A Solução Técnica (Bastidores)

### 1. Engenharia de Dados (SQL)
O script `ProjetofinalOlist.sql` é o coração da análise. Ele transforma os dados brutos garantindo consistência:

* **Limpeza e Qualidade:** Aplicação de filtro estrito `WHERE order_status = 'delivered'` para considerar apenas vendas concretizadas (eliminando cancelamentos que distorceriam o orçamento).
* **Regra de Negócio (Faturamento Real):** Criação da métrica somando `price + freight_value` para refletir o desembolso real do cliente.
* **Modelagem de Dados:** Unificação de 4 tabelas (Pedidos, Itens, Produtos, Clientes) via **INNER JOIN**.
    * *Motivo:* Garantir **integridade referencial**, excluindo registros órfãos que poderiam gerar erros de análise.
* **Tratamento de Nulos:** Uso de `COALESCE` para categorizar produtos sem cadastro, garantindo que nenhuma receita fosse perdida na análise de Mix.

### 2. Stack Tecnológico
* **SQL (PostgreSQL):** Extração, limpeza e modelagem dos dados (ETL).
* **Python (Streamlit + Plotly):** Desenvolvimento da aplicação Web interativa.
* **Git/GitHub:** Versionamento e documentação.

---

## 🖥️ Tour pelo Painel (Dashboard)

### 1. Visão Executiva (KPIs)
Resumo imediato da performance. O dashboard calcula automaticamente a **Receita Total**, Ticket Médio e Frete, oferecendo uma visão macro para a diretoria.
![Visão Geral dos KPIs](dashboard_overview.png)

### 2. Análise Temporal e Geográfica
Gráficos que respondem "Quando" e "Onde" as vendas ocorrem.
* **Sazonalidade:** Picos de venda visíveis no gráfico de área, permitindo prever demandas futuras.
* **Geografia:** Ranking dos estados (SP, RJ, MG) para direcionamento estratégico de tráfego pago.
![Sazonalidade e Mapa](dashboard_sazonalidade.png)

### 3. Análise de Produto (Curva Pareto)
Identificação das categorias que trazem maior retorno financeiro (ex: "Beleza e Saúde" e "Relógios"), essencial para priorizar o estoque.
![Gráfico de Pareto](dashboard_pareto.png)

---

## 🚀 Como Executar

1.  Certifique-se de ter os dados da Olist carregados no seu banco de dados.
2.  Rode o script SQL `ProjetofinalOlist.sql` para gerar a base analítica.
3.  Instale as bibliotecas Python necessárias:
    ```bash
    pip install streamlit plotly pandas
    ```
4.  Execute a aplicação:
    ```bash
    streamlit run app.py
    ```

---
*Autor: Jéssica Rocha 
