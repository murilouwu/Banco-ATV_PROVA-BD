/*criando banco*/
CREATE DATABASE lojaroupa;
USE lojaroupa;

/*tabela cliente*/
CREATE TABLE cliente(
	cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
	/*nome*/
	nm_nome VARCHAR(450),
	/*se ele possui o cartão da loja*/
	cartao BOOLEAN,
	/*idade*/
	idade INT(10)
);

/*tabela fornecedor*/
CREATE TABLE fornecedor(
	cd_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
	/*nome do fonecedor*/
	nome VARCHAR(450),
	/*nome da marca ao qual fornece*/
	nomemarca VARCHAR(450)
);

/*tabela estoque de roupa*/
CREATE TABLE estoque(
	cd_estoque INT PRIMARY KEY AUTO_INCREMENT,
	/*quantidade de roupas*/
	qt_roupas INT(10)
);

/*tabela da roupa*/
CREATE TABLE roupa(
	cd_roupa INT PRIMARY KEY AUTO_INCREMENT,
	/*preço*/
	vl_roupa DECIMAL(45),
	/*cor da estampa*/
	ds_cor VARCHAR(100),
	/*tipo de roupa*/
	ds_tipo VARCHAR(100),
	/*tamanho*/
	tamanho DECIMAL(45),
	/*conecta com o estoque*/
	id_estoque INT,
	FOREIGN KEY (id_estoque) REFERENCES estoque(cd_estoque),
	/*conecta com o fornecedor*/
	id_fonecedor INT,
	FOREIGN KEY (id_fonecedor) REFERENCES fornecedor(cd_fornecedor)
);

/*tabela categoria*/
CREATE TABLE categoria(
	cd_categoria INT PRIMARY KEY AUTO_INCREMENT,
	/*sexo de corpo molde*/
	ds_sexo VARCHAR(200),
	/*estilo que a roupa segue*/
	ds_estilo VARCHAR(200),
	/*cultura a qual gosta da roupa*/
	ds_cultura VARCHAR(200),
	/*conecta a roupa*/
	id_roupa INT,
	FOREIGN KEY (id_roupa) REFERENCES roupa(cd_roupa)
);

/*tabela carrinho*/
CREATE TABLE carrinho(
	cd_carrinho INT PRIMARY KEY AUTO_INCREMENT,
	/*conecta o cliente*/
	id_cliente INT,
	FOREIGN KEY (id_cliente) REFERENCES cliente(cd_cliente)
);

/*tabela sacola*/
CREATE TABLE sacola(
	cd_sacola INT PRIMARY KEY AUTO_INCREMENT,
	/*quantidade da roupa em questão*/
	quantidade INT(45),
	/*conecta a roupa*/
	id_roupa INT,
	FOREIGN KEY (id_roupa) REFERENCES roupa(cd_roupa),
	/*conecta ao carrinho*/
	id_carrinho INT,
	FOREIGN KEY (id_carrinho) REFERENCES carrinho(cd_carrinho)
);

/*tabela de compra*/
CREATE TABLE compra(
	cd_compra INT PRIMARY KEY AUTO_INCREMENT,
	/*conecta ao carrinho*/
	id_carrinho INT,
	FOREIGN KEY (id_carrinho) REFERENCES carrinho(cd_carrinho),
	/*valor total*/
	valor DECIMAL(45),
	/*data da compra*/
	datacompra VARCHAR(45)
);

/*inserts*/

/*-Cliente-*/

/*Cliente Paulo cd=1*/
INSERT INTO cliente(nm_nome, cartao, idade) VALUES ('Paulo', false, 24);

/*-Fonecedor das ropas-*/

/*fornecedor chacal cd=1*/
INSERT INTO fornecedor(nome, nomemarca) VALUES ('Chacal', 'SUPREME');

/*-Estoque-*/

/*estoque das calças jeans cd=1*/
INSERT INTO estoque(qt_roupas) VALUES (20);

/*estoque das Pantufas cd=2*/
INSERT INTO estoque(qt_roupas) VALUES (50);

/*-Roupa-*/

/*pantufa cd=1*/
INSERT INTO roupa(vl_roupa, ds_cor, ds_tipo, tamanho, id_estoque, id_fonecedor) VALUES (199.00,'ROSA','Pantufa',45.00, 2, 1);
/*Calça Jeans cd=2*/
INSERT INTO roupa(vl_roupa, ds_cor, ds_tipo, tamanho, id_estoque, id_fonecedor) VALUES (90.00,'PRETO','Calça Jeans',38.00, 1, 1);

/*-Categoria-*/

/*categoria da pantufa*/
INSERT INTO categoria(ds_sexo, ds_estilo, ds_cultura, id_roupa) VALUES ('MASC','Roupa de banho', 'Punk', 1);
/*categoria da Calça*/
INSERT INTO categoria(ds_sexo, ds_estilo, ds_cultura, id_roupa) VALUES ('MASC','Social', 'Rock', 2);

/*-Carrinho-*/

/*o carrinho cd=1*/
INSERT INTO carrinho(id_cliente) VALUES (1);

/*-Sacola-*/

/*a sacola cd=1*/
INSERT INTO sacola(quantidade, id_roupa, id_carrinho) VALUES (1, 1, 1);
/*a sacola cd=2*/
INSERT INTO sacola(quantidade, id_roupa, id_carrinho) VALUES (2, 2, 1);

/*-Compra-*/
/*a compra*/						 /*vl_pantufa X qt_in_sacola + vl_jeans X qt_in_sacola*/
INSERT INTO compra(id_carrinho, valor, datacompra) VALUES(1, 199 * 1 + 90 * 2,'30/05/2022');
