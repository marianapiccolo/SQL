/*Atividade 2
Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as
informações dos produtos desta empresa.*/

CREATE database db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
id int not null auto_increment, -- id
integral varchar(20), -- S(sim) ou N(não) se a massa da pizza é integral ou não
salgada varchar(20), -- S(sim) ou N(não) se pizza é salgada ou não
tamanho varchar(20), -- pequena, media, grande
primary key (id)
);

-- popoulando tabela categoria com 5 dados
INSERT INTO tb_categoria (integral, salgada, tamanho) values ("N", "S", "grande");
INSERT INTO tb_categoria (integral, salgada, tamanho) values ("S", "S", "grande");
INSERT INTO tb_categoria (integral, salgada, tamanho) values ("N", "N", "pequena");
INSERT INTO tb_categoria (integral, salgada, tamanho) values ("N", "S", "media");
INSERT INTO tb_categoria (integral, salgada, tamanho) values ("S", "S", "pequena");

SELECT*FROM tb_categoria; -- // visualizando a tabela

CREATE TABLE tb_pizza (
id int not null auto_increment,
sabor varchar(20), -- sabor da pizza
valor varchar(20), -- preco da pizza
tem_ingredientes varchar(20), -- S se tem ingredientes no estoque e N se não tem
acompanha_refri varchar(20), -- S se acompanha refrigerante e N se não
delivery varchar(20), -- S se é para entrega N se não é 
idcategoria int not null auto_increment,
primary key (id),
foreign key (idcategoria) references tb_categoria (id)
);

-- -- popoulando tabela categoria com 8 dados
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("calabresa", "50", "S", "S", "N");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("mussarela", "30", "S", "S", "S");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("portuguesa", "65", "S", "N", "S");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("brocolis", "44", "N", "N", "N");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("ricota", "55", "S", "N", "S");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("calabresa", "50", "S", "N", "S");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("rucula", "25", "S", "S", "S");
INSERT INTO tb_pizza (sabor, valor, tem_ingredientes, acompanha_refri, delivery) values ("mussarela", "50", "S", "S", "N");

SELECT*FROM tb_pizza; -- // visualizando a tabela

SELECT * FROM tb_pizza -- valor maior que 45
where tb_pizza.valor > 45;

SELECT * FROM tb_pizza -- valor entre 29 e 60. pode usar between 
where tb_pizza.valor > 28 and tb_pizza.valor < 61;

SELECT * FROM tb_pizza -- sabor que começa com C 
where tb_pizza.sabor like "C%"

SELECT * FROM tb_categoria -- as duas tabelas
INNER JOIN tb_pizza on tb_categoria.id = tb_pizza.id;

SELECT * FROM tb_categoria -- pizzas doces
INNER JOIN tb_pizza on tb_categoria.id = tb_pizza.id
WHERE tb_categoria.salgada IN ("N")







