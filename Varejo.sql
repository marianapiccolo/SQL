INSERT INTO db_varejoboaz.tb_produto (produto, preco)
VALUES
("Tomate", 2.50),
("Cebola", 3.70),
("Alface", 1.50),
("Rucula", 2.20),
("Almerão", 2.00),
("Laranja", 9.00),
("Maça", 6.00),
("Pera", 6.00),
("Melancia", 12.00),
("Kiwi", 7.00);

SELECT * FROM db_varejoboaz.tb_produto;

-- Inserindo vendas com produto cadastrado.
INSERT INTO db_varejoboaz.tb_venda (id_produto, nome_cliente)
VALUES
(2, "Corina"),
(4, "Corina"),
(1, "Julia"),
(7, "Julia"),
(8, "Julia");

-- Inserindo venda de produto nao cadastrado
INSERT INTO db_varejoboaz.tb_venda (nome_cliente)
VALUES
("Francisco"),
("Francisco"),
("Raimundo"),
("Raimundo"),
("Raimundo");

SELECT id_produto, nome_cliente FROM db_varejoboaz.tb_venda;


-- Listar venda de produtos que foram vendidos que possuem cadastro
SELECT db_varejoboaz.tb_produto.produto, db_varejoboaz.tb_venda.id_venda, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_produto
INNER JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto;

-- Lista venda de produtos vendidos cadastrados e não cadastrados
SELECT db_varejoboaz.tb_produto.produto, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_venda
LEFT JOIN db_varejoboaz.tb_produto
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto;

-- Listar apenas venda de produtos vendidos não cadastrados
SELECT db_varejoboaz.tb_produto.produto, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_venda
LEFT JOIN db_varejoboaz.tb_produto
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto
WHERE db_varejoboaz.tb_venda.id_produto IS NULL;

-- Lista vendas realizadas
SELECT db_varejoboaz.tb_venda.id_venda, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_produto
RIGHT JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto;

-- Contagên de itens levados por cliente (Função COUNT())
SELECT db_varejoboaz.tb_venda.nome_cliente, COUNT(*) AS n_itens
FROM db_varejoboaz.tb_venda
GROUP BY db_varejoboaz.tb_venda.nome_cliente;

-- Valor pago por compradores (Função SUM())
SELECT db_varejoboaz.tb_venda.nome_cliente, SUM(db_varejoboaz.tb_produto.preco) AS total_pago
FROM db_varejoboaz.tb_produto
RIGHT JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto
GROUP BY db_varejoboaz.tb_venda.nome_cliente;

-- Media dos valores dos produtos comprados por cliente (Função AVG())
SELECT db_varejoboaz.tb_venda.nome_cliente, AVG(db_varejoboaz.tb_produto.preco) AS media_pagamento
FROM db_varejoboaz.tb_produto
RIGHT JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto
GROUP BY db_varejoboaz.tb_venda.nome_cliente;

-- Retornando quem levou um produto em especifico
SELECT db_varejoboaz.tb_produto.produto, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_produto
RIGHT JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto
WHERE db_varejoboaz.tb_produto.produto IN ('Rucula', 'Pera');

-- Retornando quem levou um produto em um range de preço
SELECT db_varejoboaz.tb_produto.produto, db_varejoboaz.tb_produto.preco, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_produto
RIGHT JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto
WHERE db_varejoboaz.tb_produto.preco BETWEEN 1.00 AND 3.00;

-- Selecionar um item pelo seu conteudo
SELECT db_varejoboaz.tb_produto.produto, db_varejoboaz.tb_produto.preco, db_varejoboaz.tb_venda.nome_cliente
FROM db_varejoboaz.tb_produto
RIGHT JOIN db_varejoboaz.tb_venda
ON db_varejoboaz.tb_produto.id_produto = db_varejoboaz.tb_venda.id_produto
WHERE db_varejoboaz.tb_produto.produto LIKE '%a';


