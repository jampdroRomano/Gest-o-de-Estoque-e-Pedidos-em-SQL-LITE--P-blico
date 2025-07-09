# 🛍️ Projeto SQL - Sistema de Vendas e Estoque

Este projeto simula um sistema de vendas com controle de estoque utilizando **SQLite** e o gerenciador DBeaver. Ele foi criado com o objetivo de praticar habilidades em **SQL**, como:

- Criação de tabelas com `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`
- Inserção de dados com `INSERT INTO`
- Criação de `VIEWS` para relatórios e análises
- Consultas com `JOIN`, `SUM`, `GROUP BY`, `CASE`, etc.

---

## 📂 Estrutura do Projeto

```
sql-loja-vendas/
├── BD_LOJA_DE_VENDAS.db
├── 1_criacao_tabelas.sql
├── 2_Exemplo_consultas.sql
├── 3_inserts.sql
├── 4_views.sql
```

---

## ⚙️ Tecnologias Utilizadas

- SQLite
- DBeaver
- SQL puro
- VS Code (para edição dos `.sql` e `.md`)

---

## ✅ Funcionalidades

- Cadastro de produtos, clientes e pedidos
- Registro de movimentações de estoque (entrada e saída)
- Geração de relatórios com `VIEWS` para:
  - Estoque atual
  - Estoque crítico
  - Vendas por cliente
  - Vendas por categoria
  - Produtos mais vendidos
  - Detalhes completos dos pedidos

---

## 🧠 Como Executar

1. **Abra o DBeaver** e crie uma conexão com SQLite
2. Execute os arquivos na seguinte ordem:

```
1_criacao_tabelas.sql
2_inserts.sql
3_views.sql
```

3. Execute as consultas com:

```sql
SELECT * FROM vw_estoque_atual;
SELECT * FROM vw_pedidos_com_detalhes;
```

---

## 📊 Consultas Rápidas

```sql
-- Ver estoque atual de todos os produtos
SELECT * FROM vw_estoque_atual;

-- Ver produtos com estoque crítico
SELECT * FROM vw_estoque_critico;

-- Ver total de vendas por cliente
SELECT * FROM vw_vendas_por_cliente;

-- Ver produtos mais vendidos
SELECT * FROM vw_produtos_mais_vendidos;

-- Ver todos os itens de pedidos detalhados
SELECT * FROM vw_pedidos_com_detalhes;
```

---

## 👨‍💻 Autor

Desenvolvido por [Seu Nome Aqui] como parte dos estudos em SQL e bancos de dados relacionais.
