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
