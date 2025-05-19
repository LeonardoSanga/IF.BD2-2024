-- Projeto BD2 - Etapa 3 - DB de Bar
-- LEONARDO MINGUINI SANGA

CREATE TABLE FORNECEDOR
	(
	cnpj_forn VARCHAR (18),
	nome VARCHAR (50),
	email VARCHAR (50),
	rua VARCHAR (40),
	numero INTEGER,
	cidade VARCHAR (40),
	siglaEstado VARCHAR (2),
	cep VARCHAR (9),
	CONSTRAINT pk_fornecedor PRIMARY KEY (cnpj_forn)
	);

CREATE TABLE TelefoneFornecedor
	(
	numero VARCHAR (14),
	cnpj_forn VARCHAR (18),
	CONSTRAINT pk_telefoneFornecedor PRIMARY KEY (numero, cnpj_forn),
	CONSTRAINT fk_fornecedor FOREIGN KEY (cnpj_forn) REFERENCES FORNECEDOR
		ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE PRODUTO 
	(
	id_produto INTEGER,
	nome VARCHAR (35),
	preco REAL,
	qtdEstoque INTEGER,
	CONSTRAINT pk_produto PRIMARY KEY (id_produto)
	);

CREATE TABLE FornecedorForneceProduto
	(
	id_prod INTEGER,
	cnpj_forn VARCHAR (18),
	CONSTRAINT pk_fornecedorForneceProduto PRIMARY KEY (id_prod, cnpj_forn),
	CONSTRAINT fk_produto FOREIGN KEY (id_prod) REFERENCES PRODUTO
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_fornecedor FOREIGN KEY (cnpj_forn) REFERENCES FORNECEDOR
		ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE CLIENTE
	(
	cpf_cli VARCHAR (14),
	nome VARCHAR (40),
	dtaNasc DATE,
	CONSTRAINT pk_cliente PRIMARY KEY (cpf_cli)
	);

CREATE TABLE TelefoneCliente
	(
	numero VARCHAR (14),
	cpf_cli VARCHAR (14),
	CONSTRAINT pk_telefoneCliente PRIMARY KEY (numero, cpf_cli),
	CONSTRAINT fk_cliente FOREIGN KEY (cpf_cli) REFERENCES CLIENTE
		ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE PEDIDO
	(
	id_pedido INTEGER,
	total REAL,
	data_ped DATE,
	cpf_cli VARCHAR (14),
	CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
	CONSTRAINT fk_cliente FOREIGN KEY (cpf_cli) REFERENCES CLIENTE
		ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE ProdutoCompoePedido
	(
	id_prod INTEGER,
	id_pedido INTEGER,
	quantidade INTEGER,
	CONSTRAINT pk_produtoCompoePedido PRIMARY KEY (id_prod, id_pedido),
	CONSTRAINT fk_produto FOREIGN KEY (id_prod) REFERENCES PRODUTO
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES PEDIDO
		ON DELETE CASCADE ON UPDATE CASCADE
	);

INSERT INTO FORNECEDOR VALUES ('11.111.111/1111-11', 'Ambev', 'Ambev@gmail.com', 'Rua Oscar Antonio', 826, 'São Francisco', 'SP', '15710-000'),
								('21.111.141/1111-31', 'Heineken', 'heinekein@gmail.com', 'Av São Paulo', 1826, 'São Paulo', 'SP', '15711-011'),
								('21.122.141/0001-31', 'Coca-Cola', 'coca_cola@gmail.com', 'Av São Matheus', 1226, 'São Paulo', 'SP', '15711-011'),
								('21.333.141/0201-31', 'Dolly', 'dolly@gmail.com', 'Rua Jacaré', 302, 'Rio de Janeiro', 'RJ', '19711-111'),
								('00.667.141/0000-31', 'Petrópolis', 'petropolis@gmail.com', 'Rua Santa Helena', 1426, 'Uberlândia', 'MG', '12711-011'),
								('11.667.141/0000-31', 'Bohemia', 'bohemia@gmail.com', 'Rua Santa Dona', 226, 'Uberlândia', 'MG', '12711-111'),
								('00.122.141/0001-31', 'Eisenbahn', 'eisenbahn@gmail.com', 'Av São Marcos', 1226, 'São Paulo', 'SP', '15711-111'),
								('00.682.141/0301-31', 'Tubaína', 'tubaina@gmail.com', 'Rua São Marcos', 316, 'São Paulo', 'SP', '15711-111'),
								('99.122.141/0001-31', 'Colorado', 'colorado@gmail.com', 'Av Sol Nascente', 1226, 'Uberaba', 'MG', '11711-111'),
								('77.122.141/0001-31', 'Cotuba', 'cotuba@gmail.com', 'Rua Jucelino', 1996, 'São José do Rio Preto', 'SP', '15911-111');

INSERT INTO TelefoneFornecedor VALUES ('(17)99784-2903', '11.111.111/1111-11'),
										('(16)99832-2301', '21.122.141/0001-31'),
										('(17)99832-1022', '11.111.111/1111-11'),
										('(32)99823-1222', '00.667.141/0000-31'),
										('(16)99798-2012', '21.122.141/0001-31'),
										('(11)99484-2903', '77.122.141/0001-31'),
										('(16)99811-2301', '99.122.141/0001-31'),
										('(17)92232-1022', '00.682.141/0301-31'),
										('(32)99823-3333', '00.122.141/0001-31'),
										('(16)99748-4442', '11.667.141/0000-31');

INSERT INTO PRODUTO VALUES (1, 'SKOL LATA 350ML' , 3.75, 384),
							(2, 'ANTARCTICA LATA 350ML' , 3.75, 360),
							(3, 'BRAHMA 600ML' , 6.25, 264),
							(4, 'COCA-COLA 2L' , 10.50, 300),
							(5, 'COTUBA LATA', 3.0, 48),
							(6, 'SKOL 600ML', 6.25, 288),
							(7, 'ANTARCTICA 600ML', 6.25, 288),
							(8, 'FANTA LARANJA 2L', 8.5, 48),
							(9, 'ROLLER 2L', 7.5, 36),
							(10, 'BRAHMA 300ML', 3.5, 144);

INSERT INTO FornecedorForneceProduto VALUES (4, '21.122.141/0001-31'),
											 (1, '11.111.111/1111-11'),
											 (2, '11.111.111/1111-11'),
											 (5, '00.667.141/0000-31'),
											 (3, '11.111.111/1111-11'),
											 (8, '21.122.141/0001-31'),
											 (9, '21.122.141/0001-31'),
											 (10, '11.111.111/1111-11'),
											 (10, '00.667.141/0000-31'),
											 (7, '11.111.111/1111-11'),
											 (6, '11.111.111/1111-11');

INSERT INTO CLIENTE VALUES ('55.932.921-22', 'Luiz', '19/02/1973'),
							('15.232.331-22', 'Claúdio', '11/02/1967'),
							('55.111.921-52', 'Leonardo', '28/06/2008'),
							('33.932.921-95', 'Fernando', '12/03/1995'),
							('44.932.921-22', 'Joel', '19/02/1990'),
							('11.932.921-95', 'Gabriel', '12/03/2009'),
							('22.932.921-95', 'Larissa', '23/06/1999'),
							('66.932.921-95', 'Fernanda', '13/12/1995'),
							('77.932.921-95', 'Lorena', '22/03/1970'),
							('88.932.921-95', 'Paulo', '11/11/2003');

INSERT INTO TelefoneCliente VALUES ('(17)99342-1222', '55.932.921-22'),
									('(17)99823-1233', '33.932.921-95'),
									('(17)99342-1222', '55.111.921-52'),
									('(16)99832-6756', '55.932.921-22'),
									('(17)99764-3233', '44.932.921-22'),
									('(17)99666-3233', '11.932.921-95'),
									('(17)99666-3233', '77.932.921-95'),
									('(17)99777-3773', '77.932.921-95'),
									('(16)99241-3773', '88.932.921-95'),
									('(16)98241-1113', '66.932.921-95');

INSERT INTO PEDIDO VALUES (1, 55.5, '22/11/2024', '55.932.921-22'),
							(2, 10.5, '25/11/2024', '55.111.921-52'),
							(3, 93.75, '12/06/2024', '33.932.921-95'),
							(4, 28.5, '11/02/2024', '44.932.921-22'),
							(5, 63, '12/07/2024', '44.932.921-22'),
							(6, 91.5, '11/11/2024', '77.932.921-95'),
							(7, 24.5, '12/02/2024', '11.932.921-95'),
							(8, 300.0, '29/10/2024', '66.932.921-95'), 
							(9, 150.0, '29/10/2024', '66.932.921-95'),
							(10, 102.0, '21/10/2024', '33.932.921-95');
	

INSERT INTO ProdutoCompoePedido VALUES (2, 5, 14),
										(4, 5, 1),
										(5, 4, 2),
										(1, 4, 6),
										(3, 3, 15),
										(10, 6, 24),
										(9, 6, 1),
										(9, 7, 1),
										(8, 7, 2),
										(7, 8, 48),
										(6, 9, 24),
										(8, 10, 12);
										
	

--DROP TABLE FORNECEDOR CASCADE;
--DROP TABLE TelefoneFornecedor CASCADE;
--DROP TABLE PRODUTO CASCADE;
--DROP TABLE FornecedorForneceProduto CASCADE;
--DROP TABLE CLIENTE CASCADE;
--DROP TABLE TelefoneCliente CASCADE;
--DROP TABLE PEDIDO CASCADE;
--DROP TABLE ProdutoCompoePedido CASCADE;

--DELETE FROM FORNECEDOR CASCADE;
--DELETE FROM TelefoneFornecedor CASCADE;
--DELETE FROM PRODUTO CASCADE;
--DELETE FROM FornecedorForneceProduto CASCADE;
--DELETE FROM CLIENTE CASCADE;
--DELETE FROM TelefoneCliente CASCADE;
--DELETE FROM PEDIDO CASCADE;
--DELETE FROM ProdutoCompoePedido CASCADE;
	
SELECT * FROM FORNECEDOR;
SELECT * FROM TelefoneFornecedor;
SELECT * FROM PRODUTO;
SELECT * FROM FornecedorForneceProduto;
SELECT * FROM CLIENTE;
SELECT * FROM TelefoneCliente;
SELECT * FROM PEDIDO;
SELECT * FROM ProdutoCompoePedido;

-- Faça uma consulta que retorne o nome dos fornecedores seus telefones em ordem decrescente dos nomes.
SELECT f.nome, tf.numero FROM FORNECEDOR f
	INNER JOIN TelefoneFornecedor tf
	ON f.cnpj_forn = tf.cnpj_forn
	ORDER BY f.nome DESC;

-- Faça uma consulta que retorne o nome dos produtos e a quantidade de pedidos que o produto já esteve.
SELECT p.nome, count(pcp.id_prod) FROM PRODUTO p
	INNER JOIN ProdutoCompoePedido pcp
	ON p.id_produto = pcp.id_prod
	GROUP BY p.nome;

-- Faça uma consulta que retorne o nome dos clientes, o total e a data do pedido e os produtos que estavam no pedido.
SELECT c.nome, ped.total, ped.data_ped, pro.nome FROM CLIENTE c
	INNER JOIN PEDIDO ped
	ON c.cpf_cli = ped.cpf_cli
	INNER JOIN ProdutoCompoePedido pcp
	ON ped.id_pedido = pcp.id_pedido
	INNER JOIN PRODUTO pro
	ON pcp.id_prod = pro.id_produto;

-- Faça uma consulta que retorne o nome dos clientes que não possuem telefone.
SELECT c.nome, tc.numero FROM CLIENTE c
	LEFT OUTER JOIN TelefoneCliente tc
	ON c.cpf_cli = tc.cpf_cli
	WHERE tc.numero IS NULL;

-- Faça uma consulta que retorne o nome do cliente que fez o último pedido. Deve ser feito um Join e uma subconsulta.
SELECT c.nome, p.data_ped FROM CLIENTE c
	INNER JOIN Pedido p
	ON c.cpf_cli = p.cpf_cli
	WHERE p.data_ped = 
		(SELECT max(data_ped) FROM PEDIDO);

-- Faça uma consulta que retorne todos os usuários que possuem uma letra ‘a’ e a penúltima letra ‘e’.
SELECT nome FROM CLIENTE
	WHERE nome ILIKE '%a%' AND nome LIKE '%e_';

-- Faça uma consulta que retorne todos os usuários que possuem uma letra ‘r’ e a penúltima letra ‘d’.
SELECT nome FROM CLIENTE
	WHERE nome ILIKE '%r%' AND nome LIKE '%d_';
	