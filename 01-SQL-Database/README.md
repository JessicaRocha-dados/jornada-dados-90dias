# 🛒 Módulo SQL: Análise de Dados E-commerce (Olist)

Este diretório contém os scripts e exercícios práticos desenvolvidos durante as primeiras semanas do meu bootcamp intensivo de dados. O foco é a análise exploratória utilizando **SQL (PostgreSQL)** no DBeaver.

## 🎯 Conteúdo Estudado

### 📂 01_fundamentos.sql
Cobrimos a base da extração de dados:
- Estrutura `SELECT`, `FROM`.
- Remoção de duplicatas com `DISTINCT`.
- Filtros lógicos: `WHERE`, `AND`, `OR`, `IN`, `BETWEEN`.
- Busca textual com Wildcards: `LIKE` (`%`, `_`).
- Ordenação e Limites: `ORDER BY`, `LIMIT`.
- Tratamento de Nulos: `IS NULL`.

### 📂 02_agregacoes.sql
Avançamos para a sumarização e inteligência de dados:
- Funções de Agregação: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`.
- Segmentação de dados: `GROUP BY`.
- Filtros avançados em grupos: `HAVING` vs `WHERE`.
- Criação de Rankings e "Top N".

### 📂 03_datas_e_tempo.sql
Focamos na manipulação temporal para KPIs de negócio:
- Matemática de datas (Subtração para achar intervalos).
- Função `EXTRACT` (Ano, Mês, Dia da Semana).
- Tratamento de erros de tipo: `CAST` e `NULLIF` (Limpeza de dados sujos).
- Análise de Sazonalidade e Lead Time (Tempo de Entrega).

## 🛠️ Ferramentas Utilizadas
- **Banco de Dados:** PostgreSQL
- **Interface:** DBeaver
- **Dataset:** Brazilian E-Commerce Public Dataset by Olist