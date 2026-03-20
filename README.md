# 🚴 Adventure Works: Transformando Dados em Decisões

Olá! Este repositório é o resultado de um projeto focado em transformar os dados brutos da Adventure Works em inteligência de negócio. Aqui, utilizei o **dbt** e o **Databricks** para construir um pipeline de dados moderno, seguindo boas práticas de engenharia de dados.

## 🎯 O que este projeto faz?
A ideia principal foi pegar aquele "emaranhado" de tabelas transacionais e organizar tudo em um modelo dimensional voltado para análise. O objetivo final é deixar os dados prontos para que dashboards no Power BI respondam perguntas de negócio de forma rápida, confiável e com rastreabilidade.

## 🏗️ Como organizei a casa
Dividi o projeto em camadas para garantir que o dado seja tratado com clareza antes de virar indicador:

🔵 **Camada Staging:** É onde acontece a limpeza e padronização dos dados. Aqui renomeio colunas, ajusto tipos de dados e preparo as tabelas para as próximas transformações. O foco é simplicidade, consistência e legibilidade.

🟢 **Camada Marts:** Aqui os dados passam a ser organizados para consumo analítico. Nessa camada concentrei as dimensões e a tabela fato de vendas, estruturando o modelo para facilitar análises e visualizações no Power BI.

## 🚀 Evolução e Qualidade
Baseado em feedbacks reais de arquitetura, implementei melhorias que fazem diferença no projeto:

- **Chega de Joins Brutos:** Agora tudo passa primeiro pela camada Staging.
- **Rastreabilidade Total:** Uso `{{ source() }}` e `{{ ref() }}` para que a linhagem dos dados fique clara e auditável.
- **Dados Blindados:** Adicionei testes automáticos para garantir integridade, unicidade e consistência entre os modelos.
- **Validação de Faturamento:** Criei um teste específico para validar o faturamento de 2011 com tolerância controlada, considerando diferenças residuais de arredondamento entre o cálculo em nível de item e os valores consolidados do pedido.

## 💻 Como rodar no VS Code
Se você estiver usando a extensão do dbt no VS Code, basta abrir o terminal e executar:
```bash
dbt build