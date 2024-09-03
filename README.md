Claro! Aqui está o enunciado em Markdown para o projeto:

```markdown
# Projeto: Sistema de Gerenciamento de Restaurante

## Descrição

Desenvolva um sistema para gerenciar as operações de um restaurante. O sistema deve permitir o gerenciamento de clientes, mesas e pedidos. Utilize comandos SQL para implementar o banco de dados necessário para suportar as seguintes funcionalidades.

## Comandos Utilizados

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT`
- `SELECT`
- `UPDATE`
- `DELETE`
- `JOIN`

## Passos

### 1. Criar o Banco de Dados

Crie um banco de dados chamado `RestauranteDB`.

```sql
CREATE DATABASE RestauranteDB;
USE RestauranteDB;
```

### 2. Criar as Tabelas

#### Clientes

Crie uma tabela para armazenar informações sobre os clientes com os seguintes campos:

- `id_cliente` (chave primária, inteiro, auto-incremento)
- `nome` (texto)
- `telefone` (texto)
- `email` (texto)

```sql
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);
```

#### Mesas

Crie uma tabela para gerenciar as mesas do restaurante com os seguintes campos:

- `id_mesa` (chave primária, inteiro, auto-incremento)
- `numero_mesa` (inteiro)
- `capacidade` (inteiro)

```sql
CREATE TABLE Mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT,
    capacidade INT
);
```

#### Pedidos

Crie uma tabela para armazenar informações sobre os pedidos com os seguintes campos:

- `id_pedido` (chave primária, inteiro, auto-incremento)
- `id_cliente` (chave estrangeira referenciando `Clientes.id_cliente`)
- `id_mesa` (chave estrangeira referenciando `Mesas.id_mesa`)
- `data_pedido` (data e hora)
- `total` (decimal)

```sql
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_mesa INT,
    data_pedido DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa)
);
```

#### Itens_Pedido

Crie uma tabela para gerenciar os itens de cada pedido com os seguintes campos:

- `id_item` (chave primária, inteiro, auto-incremento)
- `id_pedido` (chave estrangeira referenciando `Pedidos.id_pedido`)
- `descricao_item` (texto)
- `quantidade` (inteiro)
- `preco_unitario` (decimal)

```sql
CREATE TABLE Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    descricao_item VARCHAR(255),
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);
```

### 3. Inserir Dados

Adicione alguns registros fictícios às tabelas `Clientes`, `Mesas`, `Pedidos` e `Itens_Pedido`.

### 4. Consultar Dados

Escreva consultas para:

- Listar todos os clientes
- Listar todas as mesas
- Listar todos os pedidos
- Mostrar todos os itens de um pedido específico, incluindo o total do pedido

### 5. Atualizar Dados

Altere as informações de um cliente e de uma mesa. Certifique-se de que as atualizações sejam refletidas corretamente em todas as tabelas relacionadas.

### 6. Deletar Dados

Exclua um pedido e todos os itens relacionados a ele. Certifique-se de que a exclusão de um pedido remova os itens associados sem deixar dados órfãos.

## Objetivos

- Utilizar comandos SQL para criar e manipular um banco de dados funcional.
- Garantir a integridade referencial entre as tabelas.
- Implementar consultas para obter e visualizar informações relevantes.
- Praticar a atualização e exclusão de dados enquanto mantém a integridade do banco de dados.
