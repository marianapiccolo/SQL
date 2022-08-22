/*Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria. */

CREATE database db_farmacia_do_bem;
USE db_farmacia_do_bem;

CREATE TABLE tb_categoria(
id int not null auto_increment, -- id
cosmeticos varchar(20),  
pressao varchar(20), -- marca do remedio de pressao
dor varchar(20), -- marca do remedio de espinha
primary key (id)
);

-- popoulando tabela categoria com 5 dados -- remédios de pressao tem nomes AP, BP, CP. Remédios dor tem nomes AD, BD, CD.

INSERT INTO tb_categoria (cosmeticos, pressao, dor) values ("espinha", "AP", "CD");
INSERT INTO tb_categoria (cosmeticos, pressao, dor) values ("rugas", "BP", "AD");
INSERT INTO tb_categoria (cosmeticos, pressao, dor) values ("manchas", "BP", "BD");
INSERT INTO tb_categoria (cosmeticos, pressao, dor) values ("rugas", "CP", "AD");
INSERT INTO tb_categoria (cosmeticos, pressao, dor) values ("espinha", "AP", "CD");

SELECT*FROM tb_categoria; -- // visualizando a tabela

CREATE TABLE tb_produto (
id int not null auto_increment,
nome varchar(20), -- nome do remedio
valor double not null, -- preco do remedio
receita varchar(20) not null, -- S se precisa de receita N se não tem
estoque varchar(20) not null, -- S se tem no estoque N se não
quantidade int not null, -- número de comprimidos em cada caixa
idcategoria int,
primary key (id),
foreign key (idcategoria) references tb_categoria(id)
);

-- -- popoulando tabela produto com 8 dados
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("xxx", "100", "S", "S", "10");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("bbb", "50", "N", "S", "5");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("ttt", "40", "N", "N", "60");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("lll", "150", "S", "S", "120");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("fff", "30", "N", "S", "10");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("eee", "200", "N", "S", "20");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("mmm", "10", "N", "S", "10");
INSERT INTO tb_produto (nome, valor, receita, estoque, quantidade) values ("sss", "3", "N", "S", "1");

SELECT*FROM tb_produto; -- // visualizando a tabela

SELECT * FROM tb_produto -- valor maior que 50
where tb_produto.valor > 50;

SELECT * FROM tb_produto -- valor entre 3 e 60
where tb_produto.valor > 2 and tb_produto.valor < 61;

SELECT * FROM tb_produto -- produto que começa com b
where tb_produto.nome like "b%"

SELECT * FROM tb_categoria -- duas tabelas
JOIN tb_produto on tb_categoria.id = tb_produto.id;

SELECT tb_categoria.cosmeticos -- tipo de cosmeticos com valor maior que 100
FROM tb_categoria
INNER JOIN tb_produto on tb_categoria.id = tb_produto.id
where tb_produto.valor>100