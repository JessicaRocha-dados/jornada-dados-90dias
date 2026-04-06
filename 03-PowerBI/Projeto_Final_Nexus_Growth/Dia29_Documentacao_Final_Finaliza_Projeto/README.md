# 📊 Relatório Executivo: Nexus Growth Analytics

## 🎯 Visão Geral do Projeto
O **Nexus Growth Analytics** é um produto de dados desenvolvido para fornecer visibilidade total sobre a performance das campanhas de marketing digital e o funil de aquisição de clientes. Este dashboard consolida métricas vitais de *Growth*, permitindo que a liderança tome decisões baseadas em dados (Data-Driven) sobre onde alocar o orçamento de mídia paga para maximizar o retorno.

---

## 🖼️ Dashboard Final (Visão Q1 2026)

![Dashboard Final Nexus Growth](Dia29_Nexus_growth_resultado_final%20.jpg)

*(Para visualizar a interatividade, faça o download do arquivo `.pbix` neste repositório)*

---

## 🛠️ Engenharia de Dados e ETL (O Motor do Projeto)
Muitas vezes a etapa de ETL e modelagem acaba não recebendo a devida atenção no desenvolvimento de relatórios, mas ela é super importante para sustentar a precisão de tudo o que é exibido no painel final. 

Neste projeto, a integridade dos dados foi tratada como prioridade técnica absoluta através do **Power Query (M Language)**:
* **Padronização de Nomenclaturas:** Correção de inconsistências na base original, unificando variações de canais como ("Meta", "Meta Ads", " Meta ") e ("Tik Tok", "Tiktok") em categorias únicas. Isso garantiu que o cálculo de ROAS e CAC não sofresse distorções de agrupamento.
* **Limpeza e Tipagem:** Tratamento de valores nulos, conversão de moedas e estruturação de datas para viabilizar a inteligência de tempo (Time Intelligence).

## 🧠 Modelagem e DAX
A arquitetura de dados foi construída no modelo *Star Schema* para otimizar o tempo de processamento:
* **Tabelas Fato:** `f_sessoes_marketing` concentrando os eventos transacionais e custos.
* **Tabelas Dimensão:** `D_Calendario`, `D_UTMs`, `d_leads_scoring` para segmentação e filtros.
* **Linguagem DAX:** Criação de medidas explícitas para os KPIs centrais do negócio, com formatação financeira rigorosa (ex: ajuste de casas decimais para o Custo de Aquisição).

## 🎨 UI/UX e Data Storytelling
O design da interface seguiu princípios de **Clean Tech** e redução de carga cognitiva:
* **Hierarquia Visual:** Utilização de *White Space* (respiros), sombras suaves e cantos arredondados (10px) para direcionar o olhar do usuário primeiramente aos KPIs globais, descendo para análises mais granulares.
* **Interatividade Avançada:** Substituição de filtros estáticos por menus suspensos (Dropdowns) para `Período` e `Canal`, fixados no cabeçalho. Isso liberou 20% mais espaço de tela para a análise de dados e conferiu um aspecto de software moderno.
* **Linguagem de Negócios:** Renomeação de campos técnicos (de `utm_source` para `Canal`) diretamente na camada visual, garantindo que o usuário de negócios navegue sem atritos técnicos.

---

## 📈 Principais Indicadores (KPIs)
O ecossistema de métricas construído permite monitorar:
* **Receita Total (R$ 2,04 Mi):** Volume financeiro total gerado pelas campanhas no período selecionado.
* **CAC (R$ 472,65):** Custo de Aquisição de Clientes, indicando a saúde financeira das operações de marketing.
* **Investimento Total (R$ 338,89 Mil):** Capital alocado nas plataformas de mídia paga.
* **ROAS (6,01):** Return on Ad Spend. A cada R$ 1,00 investido, a Nexus Growth retorna R$ 6,01 em receita.

## 🚀 Conclusão
A entrega deste dashboard marca a transição de relatórios estáticos e descentralizados para uma central de inteligência automatizada. A estruturação sólida do ETL garante que os dados sejam confiáveis, enquanto o design focado em UX permite que qualquer executivo extraia insights de alto valor em poucos segundos.
