# 🚴 Adventure Works: Transformando Dados em Decisões

Olá! Este repositório é o resultado de um projeto focado em transformar os dados brutos da Adventure Works em inteligência de negócio. Aqui, utilizei o **dbt** e o **Databricks** para construir um pipeline de dados moderno, seguindo as melhores práticas de engenharia.

## 🎯 O que este projeto faz?
A ideia principal foi pegar aquele "emaranhado" de tabelas transacionais e organizar tudo em um modelo dimensional (Star Schema). O objetivo final? Deixar os dados prontos para que qualquer dashboard no Power BI responda perguntas de negócio de forma rápida e confiável.

## 🏗️ Como organizei a casa
Dividi o projeto em camadas para garantir que o dado seja tratado com carinho antes de virar um indicador:

🔵 **Camada Staging:** É onde a mágica da limpeza acontece. Aqui eu renomeio colunas, trato tipos de dados e garanto que tudo esteja padronizado. Nada de joins complexos aqui; o foco é simplicidade e clareza.
🟢 **Camada Marts:** Aqui é onde o negócio brilha. Criei as Dimensões (quem, onde, quando) e as Fatos (quanto vendeu) usando referências inteligentes para garantir que a linhagem dos dados esteja sempre visível.

## 🚀 Evolução e Qualidade
Baseado em feedbacks reais de arquitetura, implementei melhorias que fazem a diferença:
- **Chega de Joins Brutos:** Agora tudo passa pela Staging primeiro.
- **Rastreabilidade Total:** Uso as funções `{{ source() }}` e `{{ ref() }}` para que o dbt saiba exatamente de onde vem cada informação.
- **Dados Blindados:** Adicionei testes automáticos para garantir que não existam IDs duplicados ou vendas sem produtos.
- **Validação de Ouro:** Criei um teste específico para garantir que o faturamento de 2011 bata exatamente com o valor esperado pelo desafio.

## 💻 Como rodar no VS Code
Se você estiver usando a extensão do dbt no VS Code, basta abrir o terminal e digitar:
```bash
dbt build