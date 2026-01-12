# 📊 Monitoramento de Performance de Vendas - Olist

## 📖 Sobre o Projeto
Este projeto simulou um desafio real de **Business Intelligence** e **Engenharia de Dados**. O objetivo foi atuar como parceiro estratégico da Diretoria de Marketing da Olist para resolver a falta de visibilidade sobre os dados de vendas, essencial para o planejamento do budget anual.

A solução consistiu em processar dados brutos via SQL e construir um Dashboard interativo para tomada de decisão.

## 🎯 O Problema de Negócio
A diretoria precisava responder a 3 "Perguntas de Ouro" para otimizar os investimentos:
1.  **Tendência Temporal:** Qual a sazonalidade das vendas e evolução mensal?
2.  **Geografia (Geo-Marketing):** Onde estão os melhores clientes para focar campanhas de mídia paga?
3.  **Mix de Produtos:** Quais categorias são os "Carros-Chefe" (Pareto) da empresa?

---

## 🖥️ Visualização (Dashboard)
O painel abaixo foi construído para permitir que a diretoria filtre os dados dinamicamente.

![Preview do Dashboard](Dash 1  )


---

## 🛠️ Tecnologias Utilizadas
* **SQL (PostgreSQL):** Modelagem, limpeza e criação da View Analítica.
* **Python (Streamlit + Plotly):** Construção da interface interativa e gráficos (`app.py`).
* **Git/GitHub:** Controle de versão e documentação.

## ⚙️ A Solução Técnica (Bastidores)

### 1. Engenharia de Dados (SQL)
Para garantir a confiabilidade dos números, o script `ProjetofinalOlist.sql` aplica as seguintes regras de negócio:
* [cite_start]**Filtro de Qualidade:** Apenas pedidos com status `delivered` foram processados, eliminando ruídos de cancelamentos[cite: 13].
* [cite_start]**Cálculo de Receita Real:** A métrica de faturamento soma `price` (produto) + `freight_value` (frete), refletindo o valor real pago pelo cliente[cite: 14].
* [cite_start]**Modelagem Dimensional:** Unificação de 4 tabelas relacionais (Pedidos, Itens, Produtos, Clientes) em uma estrutura única pronta para análise[cite: 9, 10].

### 2. Estrutura dos Arquivos
* `ProjetofinalOlist.sql`: Código SQL contendo a query de extração e tratamento (ETL).
* `app.py`: Código Python da aplicação do Dashboard.
* `vendas.csv`: Amostra dos dados processados.

---

## 🚀 Como Executar este Projeto
1.  Clone este repositório.
2.  Execute o script SQL no seu banco de dados PostgreSQL.
3.  Instale as dependências de Python:
    ```bash
    pip install streamlit pandas plotly
    ```
4.  Execute o dashboard:
    ```bash
    streamlit run app.py
    ```

---
*Desenvolvido como parte do portfólio de Dados.*
