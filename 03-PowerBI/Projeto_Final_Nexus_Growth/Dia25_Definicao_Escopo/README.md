#  Dia 25: Definição do Projeto Final - Escopo e Planejamento

Chegamos à reta final dos 90 Dias de Dados! O objetivo desta última semana é construir um Projeto de Conclusão de ponta a ponta. 

Hoje, o foco foi 100% no planejamento, definição de escopo e arquitetura de dados.

##  O Cenário de Negócio: Projeto "Nexus Growth Analytics"

**A Empresa:** NexusTech (Empresa de software SaaS).
**O Desafio:** A equipe de Growth Marketing investe pesadamente em tráfego pago (Google Ads, Meta Ads) e automação de e-mails. Eles utilizam Inteligência Artificial para classificar leads (Lead Scoring) e um Chatbot no site. No entanto, os dados estão descentralizados. A diretoria não sabe qual campanha traz o melhor Retorno sobre Investimento (ROAS) e se a IA realmente está otimizando o funil de vendas.
**A Missão:** Desenvolver o "Nexus Growth Dashboard" para rastrear a jornada completa do usuário, desde o clique no anúncio (via UTMs) até a conversão final, validando a eficiência da Automação e da IA.

## Perguntas de Negócio 

O projeto foi desenhado para responder a 5 perguntas estratégicas:

1. **Performance de Tráfego (UTMs):** Quais campanhas (`utm_campaign`) e origens (`utm_source`) trazem o maior volume de tráfego qualificado?
2. **Eficiência de Custos (CAC e ROAS):** Qual é o Custo de Aquisição de Clientes (CAC) por plataforma e qual anúncio gera o melhor Retorno sobre Investimento (ROAS)?
3. **Impacto da Automação (Chatbot/IA):** Usuários que interagem com o Chatbot de IA possuem uma Taxa de Conversão superior aos que utilizam apenas o formulário padrão?
4. **Validação do Lead Scoring:** A classificação preditiva da IA (Quente, Morno, Frio) está correta? Leads "Quentes" realmente geram mais receita no fundo do funil?
5. **Jornada de Automação:** Qual fluxo de automação de e-mail gera mais conversões no menor tempo?

##  Arquitetura de Dados Planejada (Star Schema)

Para responder a essas perguntas, a modelagem de dados será estruturada em um **Star Schema** contendo:
* **Tabela Fato:** `F_Sessoes_Conversoes` (Granularidade: 1 linha por sessão de usuário no site).
* **Tabelas Dimensão:** `D_Calendario`, `D_UTMs` (Source, Medium, Campaign), `D_Interacao_IA` (Chatbot, Fluxo de E-mail) e `D_Lead_Score` (Classificação da IA).

**Próximo Passo (Dia 26):** Extração, Transformação e Carga (ETL) utilizando Power Query e construção do Modelo Relacional.
