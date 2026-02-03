# 📊 Projeto: Relatório de Estoque e Precificação

Este projeto marca o início da minha jornada intensiva em **Excel para Análise de Dados**. O objetivo foi transformar uma lista de dados brutos em um relatório gerencial automatizado e visualmente profissional.

## 🛠️ Tecnologias e Conceitos Aplicados

### 1. Tratamento e Estruturação de Dados
- **Limpeza de Dados:** Padronização de tipos de dados (Texto vs. Números) e ajustes de layout.
- **Design de Interface:** Aplicação de conceitos de UI (User Interface) em planilhas (remoção de gridlines, hierarquia visual, mesclagem estratégica).

### 2. Lógica e Fórmulas Matemáticas
- **Operações Fundamentais:** Criação de colunas calculadas para `Total` (Quantidade * Valor) e projeções.
- **Funções de Agregação:** Uso de `SOMA`, `MÉDIA` e `MÁXIMO` para gerar o rodapé de *Business Intelligence* (BI).
- **Referências Absolutas ($):** Implementação de taxa de imposto dinâmica (Input de 10%), utilizando o travamento de células para automatizar o recálculo em massa.

## 📈 Resultado
O projeto resultou em uma planilha 100% dinâmica: ao alterar a taxa de imposto ou a quantidade vendida, todos os indicadores financeiros e totais gerais são recalculados instantaneamente.

---

### 📊 Atualização - Dia 7: Data Visualization
Transformação de dados numéricos em insights visuais.
- Criação de **Gráfico de Colunas** para análise de faturamento.
- **Storytelling:** Ajuste de títulos e rótulos de dados para leitura executiva.
- **Limpeza Visual (Data Ink Ratio):** Remoção de linhas de grade e eixos desnecessários para focar na informação.

## 🧠 Fase 2: Lógica e Texto (Dias 8 a 14)
**Objetivo:** Transformar o Excel em uma ferramenta de tomada de decisão, utilizando lógica condicional para automatizar regras de negócio.

### 📅 Diário de Evolução:

- [x] **Dia 8: Lógica Condicional (`SE`)**
  - Criação de um Boletim Escolar automatizado.
  - Aplicação da função `=SE()` para classificar dados automaticamente baseados em critérios numéricos.
  - *Arquivo:* `Dia_08_Logica_SE.xlsx`

- [x] **Dia 9: Análise Seletiva (`SOMASE` e `CONT.SE`)**
  - Criação de resumo de vendas por vendedor.
  - Utilização de `=SOMASE()` para agregações condicionais.
  - Utilização de `=CONT.SE()` para contagem de ocorrências.
  - **Prática de Debugging:** Identificação e correção de erros de referência em fórmulas.
  - *Arquivo:* `Dia_09_Condicionais.xlsx`

---
- [x] **Dia 10: Lógica Complexa (`E`, `OU` e `SE Aninhado`)**
  - Criação de regras de bônus com múltiplos critérios.
  - Uso da função `E` (todas as condições verdadeiras) e `OU` (pelo menos uma verdadeira).
  - Implementação de **SE Aninhado** (Nested IF) para criar sistema de medalhas (Ouro/Prata/Bronze).
  - Aplicação de **Formatação Condicional** para indicadores visuais automáticos.
  - *Arquivo:* `Dia_10_Logica_Avancada.xlsx`
---
### 📅 Diário de Evolução:

- [x] **Dia 11: Higienização de Texto (`ARRUMAR` e `PRI.MAIÚSCULA`)**
  - Tratamento de erros comuns de input (espaços extras, caixa alta/baixa misturada).
  - Criação de pipelines de limpeza aninhando funções.
  - *Arquivo:* `Dias_11_12_Manipulacao_Texto.xlsx` (Aba: 11_Limpeza_Padronizacao)

- [x] **Dia 12: Extração e Manipulação de Strings (`ESQUERDA`, `DIREITA`, `LOCALIZAR`)**
  - Lógica de extração dinâmica baseada em delimitadores (espaço).
  - Separação de Nome e Sobrenome de forma automatizada, independente do tamanho do texto.
  - Combinação de `NÚM.CARACT` com `LOCALIZAR` para cálculos de posição.
  - *Arquivo:* `Dias_11_12_Manipulacao_Texto.xlsx` (Aba: 12_Extracao_Dinamica)

---
- [x] **Dia 13: Engenharia Temporal ( `HOJE`, `DATADIF` e `DIA.DA.SEMANA` )**

  - Compreensão de datas como números seriais para criação de contadores regressivos e cálculo de prazos.
  - Uso da função oculta `DATADIF` para cálculo de idade exata e formatação personalizada (`dddd`) para dias da semana.
  - *Arquivo:* `Dia_13_Datas_e_Revisao.xlsx` (Aba: 13_Datas_Prazos)
---
[x] **Dia 14: Gestão Temporal e Visual ( `[h]:mm`, Lógica Booleana e `FORMATAÇÃO CONDICIONAL` )**

  - Compreensão de horas como frações decimais para cálculo de turnos noturnos e criação de "semáforos" financeiros automáticos.
  - Aplicação de lógica booleana `+(Saída<Entrada)` para correção de virada de dia e regras de formatação baseadas em fórmulas compostas (`E` e `LOCALIZAR`).
  - *Arquivo:* `Dia_14_Logica_e_Cores.xlsx` (Aba: 14_Horas_Condicional)

    ---

    [x] Dia 15-16: Sistema de Consulta de Preços (PROCV & Tratamento de Erros)

* **Objetivo:** Criação de uma ferramenta de "Frente de Caixa" simulada, separando a camada de dados (Cadastro) da interface de usuário (UI) para eliminar erros manuais.

* **Técnica:** Aplicação da função `PROCV` (VLOOKUP) com correspondência exata para busca de dados, integrada com a função `SEERRO` para blindar a interface contra códigos inexistentes ("Produto não cadastrado").

---

[x] Dia 17: O Moderno PROCX (XLOOKUP & Dashboard Dinâmico)

* **Evolução:** Implementação de buscas bidirecionais (recuperando dados à esquerda e à direita da chave) utilizando `PROCX`, superando as limitações de contagem de colunas do antigo PROCV.

* **Blindagem Lógica:** Uso do argumento nativo de erro do PROCX para mensagens personalizadas e combinação com a função `SE` para limpeza visual de células vazias em consultas em lote (prevenção de zeros no dashboard).

* Arquivo: `Dia_16_17 Sistema de Consulta_PROCX..xlsx`

---
 [x] Dia 18: Tabela Dinâmica e Dashboards Interativos

* **Transformação de Dados:** Criação de Tabela Dinâmica (Pivot Table) para sumarizar bases de vendas, utilizando agrupamento hierárquico (Vendedor > Produto) e temporal (Meses).

* **Interatividade:** Implementação de Segmentação de Dados (Slicers) para filtragem visual por lojas.

* **UI/UX:** Aplicação de conceitos de Design de Dashboard, separando a camada de visualização (Front-end) da base de dados (Back-end) e removendo linhas de grade para um visual limpo ("Clean").

* Arquivo: `Dia_18_Dashboard_Vendas.xlsx`
  
