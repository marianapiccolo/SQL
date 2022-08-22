/*Crie um banco de dados para um serviço de um açougue, o nome do banco deverá ter o
seguinte nome db_cidade_das_carnes, onde o sistema trabalhará com as informações dos
produtos desta empresa.*/

CREATE database db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categoria(
id int not null auto_increment, -- id
vaca varchar(20), -- sim ou não
ave varchar(20), -- sim ou não
peixe varchar(20), -- sim ou não
primary key (id)
);

-- popoulando tabela categoria com 5 dados
INSERT INTO tb_categoria (vaca, ave, peixe) values ("N", "S", "S");
INSERT INTO tb_categoria (vaca, ave, peixe) values ("N", "S", "N");
INSERT INTO tb_categoria (vaca, ave, peixe) values ("S", "S", "S");
INSERT INTO tb_categoria (vaca, ave, peixe) values ("N", "S", "S");
INSERT INTO tb_categoria (vaca, ave, peixe) values ("S", "N", "N");


SELECT*FROM tb_categoria; -- // visualizando a tabela

CREATE TABLE tb_produto (
id int not null auto_increment,
nome_cliente varchar(20), -- nome do comprador
valor double not null, -- preco do produto
congelado varchar(20) not null, -- S ou N
peso double not null, 
quantidade int not null, -- número de pacotes 
idcategoria int,
primary key (id),
foreign key (idcategoria) references tb_categoria(id)
);

-- -- popoulando tabela produto com 8 dados
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Maria", "20", "S", "2", "3");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Joao", "100", "N", "5", "2");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Antonio", "70", "S", "5", "1");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Thais", "55", "N", "5", "2");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Leonardo", "200", "N", "15", "3");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Pedro", "30", "S", "1", "1");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Patricia", "45", "N", "2", "1");
INSERT INTO tb_produto (nome_cliente, valor, congelado, peso, quantidade) values ("Marcos", "115", "N", "5", "2");


SELECT*FROM tb_produto; -- // visualizando a tabela

SELECT * FROM tb_produto -- valor maior que 50 reais
where tb_produto.valor > 50;

SELECT * FROM tb_produto -- pode usar BETWEEN TAMBÉM
where tb_produto.valor > 2 and tb_produto.valor < 61;

SELECT * FROM tb_produto -- nome cliente com a letra c
where tb_produto.nome_cliente like "c%"

SELECT * FROM tb_categoria -- duas tabelas juntas ordenadas pelo nome cliente
JOIN tb_produto on tb_categoria.id = tb_produto.id
ORDER BY nome_cliente

SELECT tb_categoria.vaca -- carne de vaca mais que 50 reais
FROM tb_categoria
INNER JOIN tb_produto on tb_produto.id = tb_categoria.id
where tb_produto.valor>50