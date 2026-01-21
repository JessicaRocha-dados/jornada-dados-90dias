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
