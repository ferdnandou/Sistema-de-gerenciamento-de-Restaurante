-- Criar o banco de dados
CREATE DATABASE RestauranteDB;
USE RestauranteDB;

-- Criar a tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Criar a tabela Mesas
CREATE TABLE Mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT,
    capacidade INT
);

-- Criar a tabela Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_mesa INT,
    data_pedido DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa)
);

-- Criar a tabela Itens_Pedido
CREATE TABLE Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    descricao_item VARCHAR(255),
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

-- Inserir dados fictícios
INSERT INTO Clientes (nome, telefone, email) VALUES
('João Silva', '1234-5678', 'joao.silva@example.com'),
('Maria Oliveira', '2345-6789', 'maria.oliveira@example.com');

INSERT INTO Mesas (numero_mesa, capacidade) VALUES
(1, 4),
(2, 2),
(3, 6);

INSERT INTO Pedidos (id_cliente, id_mesa, data_pedido, total) VALUES
(1, 2, NOW(), 75.00),
(2, 3, NOW(), 120.00);

INSERT INTO Itens_Pedido (id_pedido, descricao_item, quantidade, preco_unitario) VALUES
(1, 'Pizza Margherita', 1, 30.00),
(1, 'Refrigerante', 2, 10.00),
(2, 'Hambúrguer', 2, 20.00),
(2, 'Batata Frita', 1, 15.00);

-- Consultar dados
SELECT * FROM Clientes;
SELECT * FROM Mesas;
SELECT * FROM Pedidos;

SELECT i.descricao_item, i.quantidade, i.preco_unitario, (i.quantidade * i.preco_unitario) AS subtotal
FROM Itens_Pedido i
JOIN Pedidos p ON i.id_pedido = p.id_pedido
WHERE p.id_pedido = 1;

SELECT total FROM Pedidos WHERE id_pedido = 1;

-- Atualizar dados
UPDATE Clientes SET telefone = '9876-5432' WHERE id_cliente = 1;
UPDATE Mesas SET capacidade = 5 WHERE id_mesa = 2;

-- Deletar dados
DELETE FROM Itens_Pedido WHERE id_pedido = 1;
DELETE FROM Pedidos WHERE id_pedido = 1;
```
