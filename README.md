# Adventure Works Analytics

Este repositório contém os modelos SQL utilizados na construção do Data Warehouse
do projeto Adventure Works, desenvolvido como parte da Certificação em Engenharia
de Analytics da Indicium.

Os modelos estão organizados seguindo a lógica do dbt, incluindo:
- models/staging: tratamento e padronização dos dados brutos
- models/marts/dim: dimensões de negócio
- models/marts/fct: tabelas fato

Os testes de qualidade e a documentação dos modelos estão definidos no arquivo
schema.yml, utilizando testes declarativos do dbt.

A execução dos modelos foi realizada em ambiente Databricks.