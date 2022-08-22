/*Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco
deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.*/

-- CREATE DATABASE db_cursoDaMinhaVida;
USE db_cursoDaMinhaVida;

CREATE TABLE tb_categoria(
id_categoria INT AUTO_INCREMENT NOT NULL,
area VARCHAR(100),
nivel VARCHAR(20),
modulo VARCHAR(20),
PRIMARY KEY (id_categoria));

-- Populando tabela categoria -- modulo tem 3 niveis
INSERT INTO tb_categoria (area, nivel, modulo) VALUES 
("idiomas","intermediario","2"),
("programacao","basico","3"),
("financas","avancado","1"),
("economia","intermediario","3"),
("pacote office","basico","1"); 

SELECT * FROM tb_categoria;

CREATE TABLE  tb_produtos(
id_produto INT AUTO_INCREMENT NOT NULL,
nome_curso VARCHAR(100),
valor double,
certificado VARCHAR(2), -- tem certificado S ou N
dias_semana VARCHAR(2), -- quantos dias por semana
duracao VARCHAR(10),
categoria_id INT NOT NULL,

PRIMARY KEY (id_produto),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id_categoria));

-- Populando tabela produto

INSERT INTO tb_produtos (nome_curso, valor, certificado, dias_semana, duracao, categoria_id) VALUES
("francês","800","S","2","5 meses",1),
("java","1500","S","4","2 meses",1),
("investindo em renda variável","500","N","1","6 meses",1),
("inglês","1000","S","2","4 meses",1),
("python","700","N","2","3 meses",1),
("italiano","800","S","3","2 meses",2),
("financas pessoais","300","N","1","1",3),
("investindo em renda fica","200","S","2","2 meses",4);

SELECT * FROM tb_produtos;

-- Produtos com o valor maior do que 50 reais.
SELECT * FROM tb_produtos
WHERE valor> 50
ORDER BY valor ASC;

-- Produtos com valor entre 3 e 60 reais.
SELECT DISTINCT nome_curso, valor, certificado,dias_semana, duracao, duracao FROM tb_produtos
WHERE valor BETWEEN 3 AND 60
ORDER BY valor ASC;

-- Produtos com a letra C.*/
SELECT * FROM tb_produtos
WHERE nome_curso LIKE "C%";

-- Select com Inner join entre tabela categoria e produto.*/
SELECT * FROM tb_categoria -- duas tabelas
INNER JOIN tb_produtos on id_categoria.id = id_produtos.id

-- categoria idiomas

SELECT * FROM tb_categoria
INNER JOIN tb_produtos ON categoria_id=produtos_id
WHERE area IN ("idiomas")






