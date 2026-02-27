# 📊 Dia 01: Introdução ao Power BI

Bem-vindo(a) ao módulo de Power BI do meu bootcamp de 90 dias de Dados! 🚀

Neste primeiro dia, o foco foi estabelecer as bases do Business Intelligence e dar os primeiros passos na ferramenta Power BI Desktop.

## 📚 Introdução Teórica

### O que é Business Intelligence (BI)?
O BI não é apenas um software, mas um conjunto de estratégias e tecnologias que transformam dados brutos em informações visuais e acionáveis. O objetivo é permitir que os decisores de negócio analisem painéis (dashboards) e extraiam *insights* sem precisarem de analisar código ou bases de dados complexas.

### Interface do Power BI Desktop
A plataforma divide-se em três áreas principais de navegação:
1. **Exibição de Relatório (Report View):** O ecrã principal (canvas) onde arrastamos os visuais e construímos o dashboard.
2. **Exibição de Dados (Data View):** Uma visualização em formato de grelha (semelhante ao Excel) para explorar e validar as linhas e colunas importadas.
3. **Exibição de Modelo (Model View):** Onde gerimos os relacionamentos entre diferentes tabelas.

### O Fluxo de Trabalho (Workflow)
O trabalho padrão no Power BI segue geralmente 5 etapas:
1. **Obter Dados:** Ligar às fontes (Excel, SQL, Web, etc.).
2. **Transformar Dados:** Limpar e preparar os dados utilizando o Power Query.
3. **Modelagem:** Criar relações entre tabelas e métricas com a linguagem DAX.
4. **Visualização:** Construir gráficos e painéis interativos.
5. **Publicação:** Partilhar o relatório final no Power BI Service (nuvem).

---

## 💻 Exercício Prático do Dia

**Objetivo:** Realizar a importação de um ficheiro simples, explorar a interface e gerar o primeiro gráfico de forma intuitiva.

**Passos Realizados:**
1. **Criação da Base de Dados:** Criação de um ficheiro Excel (`Campanhas_Teste.xlsx`) contendo dados fictícios sobre campanhas de tráfego pago (Data, Campanha, Cliques, Valor Investido).
2. **Importação:** Ligação do Power BI ao ficheiro Excel local utilizando a funcionalidade "Obter Dados".
3. **Navegação:** Verificação dos dados importados através da *Exibição de Dados*.
4. **Visualização:** Criação de um gráfico de barras na *Exibição de Relatório*, arrastando os campos `Campanha` (Eixo) e `Cliques` (Valores) para o canvas, gerando a visualização automática de desempenho por campanha.

---

---

## 📊 Dia 02: Power Query e ETL (Extração, Transformação e Carga)

Neste segundo dia, o foco foi dominar a "cozinha" do Power BI: o Editor do Power Query. Aprendi como preparar dados do mundo real, que frequentemente chegam com formatações inadequadas de sistemas externos.

### 📚 Introdução Teórica

* **O que é ETL:** Processo de Extrair dados de uma fonte, Transformá-los (limpeza e modelagem) e Carregá-los no modelo do Power BI.
* **O Motor do Power Query:** Uma ferramenta que grava cada passo de limpeza num processo automatizado (Etapas Aplicadas). Se os dados originais mudarem, a limpeza é refeita com um clique.
* **Tipos de Dados:** A importância de definir corretamente o formato de cada coluna (Texto, Número Inteiro, Data/Hora) para permitir cálculos e filtros precisos.
* **Técnicas de Limpeza:** Como utilizar funções para remover linhas e colunas inúteis, preparando a tabela para um formato tabular perfeito.

### 💻 Exercício Prático do Dia

**Objetivo:** Ligar o Power BI a uma folha de cálculo "suja" (simulando a exportação de um sistema de automação de marketing com dados de *Lead Score*) e realizar a limpeza completa utilizando o Power Query.

**Passos Realizados:**
1. **Extração:** Ligação ao ficheiro `Leads_Sujo.xlsx`.
2. **Remoção de Sujidade:** Utilização da função *Remover Linhas Superiores* para apagar títulos inúteis gerados pelo sistema.
3. **Estruturação:** Aplicação da função *Usar a Primeira Linha como Cabeçalho* para definir as colunas corretamente.
4. **Limpeza Profunda:** Remoção de linhas em branco e exclusão de colunas nulas que não acrescentavam valor à análise.
5. **Tipagem:** Ajuste do tipo de dados da coluna `Score_Lead` para *Número Inteiro*.
6. **Carga:** Conclusão com "Fechar e Aplicar", disponibilizando os dados limpos para a criação de relatórios.

**Resultado da Limpeza no Power Query:** ![Tabela Tratada no Power Query](Querytratada.png)

**Dados Carregados no Power BI:** ![Tabela no Power BI](Powerbi.png)

---
---

## 📊 Dia 03: Transformações Avançadas (Limpeza de Dados)

Neste terceiro dia, avancei para técnicas de nível intermediário/avançado no Power Query, focando em transformar relatórios gerenciais (feitos para leitura humana) em modelos tabulares (feitos para leitura de máquinas e bancos de dados).

### 📚 Introdução Teórica

* **Pivoting / Unpivoting:** A técnica de transformar "colunas em linhas". Muitas bases de dados financeiras ou de metas trazem períodos (ex: meses, anos) espalhados em várias colunas. O *Unpivot* condensa essas colunas numa estrutura longa, criando uma coluna de "Atributo" e uma de "Valor", essencial para a criação de inteligência de tempo (Time Intelligence).
* **Dividir Colunas (Split):** Utilização de delimitadores (como hífens, vírgulas ou espaços) para separar dados concatenados numa única célula, permitindo análises granulares (ex: separar o ID numérico do nome textual de uma campanha).

### 💻 Exercício Prático do Dia

**Objetivo:** Converter uma tabela de investimentos anuais "larga" (com os anos de 2024, 2025 e 2026 divididos em colunas) e IDs agrupados para o formato tabular perfeito.

**Passos Realizados:**
1. **Promoção de Cabeçalhos:** Ajuste da primeira linha para identificar corretamente os anos e a coluna de IDs.
2. **Divisão de Colunas:** Uso da ferramenta *Dividir por Delimitador* (hífen) para separar o código numérico (`ID`) do nome da `Campanha`.
3. **Unpivot:** Seleção das colunas âncora (ID e Campanha) e aplicação de *Transformar Outras Colunas em Linhas*, condensando os anos espalhados numa única coluna.
4. **Tipagem e Renomeação:** Ajuste dos tipos de dados (Ano como Texto, Investimento como Número Inteiro) para garantir o funcionamento correto de agregações matemáticas no relatório final.

**Resultado da Transformação (Unpivot & Split):** ![Tabela Unpivot no Power Query](Unpivot_Tratado.png)
