-- Exercício 1

CREATE TABLE LIVRO
	(
	ISBN INTEGER,
	titulo VARCHAR (60),
	nroPgs INTEGER,
	ano INTEGER,
	edicao INTEGER,
	CONSTRAINT pk_livro PRIMARY KEY (ISBN)
	);

CREATE TABLE ALUNO 
	(
	prontuario VARCHAR (10),
	nome VARCHAR (50),
	dtaNasc DATE,
	Rua VARCHAR (30),
	nro INTEGER,
	BAIRRO VARCHAR (30),
	cidade VARCHAR (50),
	CEP VARCHAR (15),
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
	);

CREATE TABLE TELEFONE
	(
	nroTelefone INTEGER,
	prontuario VARCHAR (10),
	CONSTRAINT pk_telefone PRIMARY KEY (nroTelefone, prontuario),
	CONSTRAINT TELEFONE_FKIndex1 FOREIGN KEY (prontuario) REFERENCES ALUNO(prontuario)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
	);

CREATE TABLE RESERVASLIVRO
	(
	ISBN INTEGER,
	prontuario VARCHAR (10),
	dtaRes DATE,
	dtaDev DATE,
	CONSTRAINT pk_reservaslivro PRIMARY KEY (ISBN, prontuario, dtaRes),
	CONSTRAINT LIVRO_has_ALUNO_FKIndex1 FOREIGN KEY (ISBN) REFERENCES LIVRO(ISBN)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT LIVRO_has_ALUNO_FKIndex2 FOREIGN KEY (prontuario) REFERENCES ALUNO(prontuario)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);

-- Exercício 2

INSERT INTO LIVRO
	VALUES (1, 'Enders Game', 324, 1985, 1),
			(2, 'Player One', 350, 1995, 4),
			(3, 'A Game of Thrones', 780, 1998, 5),
			(4, 'The Witcher: The Last Wish', 350, 1989, 2),
			(5, 'Hunger Games', 300, 2009, 3);

INSERT INTO ALUNO
	VALUES ('ll11', 'Leonardo', '28/02/2003', 'Oscar Antonio', 826, 'Centro', 'São Francisco', '15710-011'),
			('ll22', 'Gabriel', '17/05/2000', 'Santa Adelia', 2012, 'Parque Estoril', 'Fernandópolis', '16980-011'),
			('ll33', 'Ariane', '18/10/2004', 'Santa Eufigênia', 45, 'Parque Industrial', 'Araraquara', '13920-000'),
			('ll44', 'Otair', '25/03/1976', 'Oscar Antonio da Costa', 911, 'Centro', 'São Francisco', '15710-000'),
			('ll55', 'Silveria', '13/08/1977', 'Avenida Amadel', 1302, 'Centro', 'Votuporanga', '19902-202');

INSERT INTO TELEFONE
	VALUES (997354932, 'll55'),
			(997357977, 'll44'),
			(997485286, 'll11'),
			(997452632, 'll33'),
			(997564328, 'll22');

INSERT INTO RESERVASLIVRO
	VALUES (1, 'll22', '16/10/2024', '28/11/2024'),
			(3, 'll11', '11/10/2024', '02/02/2025'),
			(4, 'll33', '09/09/2024', '10/11/2024'),
			(4, 'll33', '12/03/2024', '24/05/2024'),
			(2, 'll44', '14/10/2024', '14/11/2024');

SELECT * FROM LIVRO;
SELECT * FROM ALUNO;
SELECT * FROM TELEFONE;
SELECT * FROM RESERVASLIVRO;

-- Exercício 3
UPDATE cidadesBrasil SET idhm = 8.5
	WHERE nomeCidade = 'Florianópolis';

SELECT nomeCidade, idhm FROM cidadesBrasil
	WHERE nomeCidade = 'Florianópolis';

-- Exercício 4
UPDATE cidadesBrasil SET populacao = 900000
	WHERE nomeCidade = 'Teresina';

SELECT nomeCidade, populacao FROM cidadesBrasil
	WHERE nomeCidade = 'Teresina';

-- Exercício 5
DELETE FROM cidadesBrasil
	WHERE idhm < 0.5;

SELECT nomeCidade, idhm FROM cidadesBrasil
	WHERE idhm < 0.5;

--Exercício 6
SELECT nomeCidade, regiao, idhm FROM cidadesBrasil
	WHERE regiao = 'Sul' OR idhm < 0.7
	ORDER BY idhm;

-- Exercício 7
SELECT nomeCidade, regiao, idhm, populacao FROM cidadesBrasil
	WHERE regiao = 'Nordeste' AND idhm > 0.5 AND idhm < 0.8 AND populacao > 20000
	ORDER BY populacao DESC;

-- Exercício 8
SELECT regiao, count(nomeCidade) FROM cidadesBrasil
	GROUP BY regiao
	ORDER BY regiao;

-- Exercício 9
SELECT regiao, sum(populacao) FROM cidadesBrasil
	GROUP BY regiao
	HAVING sum(populacao) > 100000;

-- Exercício 10
SELECT nomeCidade FROM cidadesBrasil
	WHERE nomeCidade LIKE 'A%' OR nomeCidade LIKE '_%r%_' OR nomeCidade LIKE '%i_'
	ORDER BY nomeCidade;

-- Exercício 11
SELECT a.nome, f.nome FROM ator A
	INNER JOIN atorEstrelaFilme aef
	ON a.idAtor = aef.idAtor
	INNER JOIN filme f
	ON aef.codFilme = f.codFilme
	ORDER BY a.nome;

-- Exercício 12
SELECT nome, count(codFilme) FROM ator a
	INNER JOIN atorEstrelaFilme aef
	ON a.idAtor = aef.idAtor
	GROUP BY nome
	ORDER BY nome;

-- Exercício 13
SELECT nome, telefone FROM cliente c
	INNER JOIN telefoneCliente t
	ON c.codCliente = t.codCliente
	ORDER BY nome;

-- Exercício 14
SELECT c.nome, f.nome FROM cliente c
	INNER JOIN clienteAlugaExemplarFilme caef
	ON c.codCliente = caef.codCliente
	INNER JOIN filme f
	ON caef.codFilme = f.codFilme;

-- Exercício 15
SELECT c.nome, f.nome, a.nome FROM cliente c
	INNER JOIN clienteAlugaExemplarFilme caef
	ON c.codCliente = caef.codCliente
	INNER JOIN filme f
	ON caef.codFilme = f.codFilme
	INNER JOIN atorEstrelaFilme aef
	ON f.codFilme = aef.codFilme
	INNER JOIN ator a
	ON aef.idAtor = a.idAtor
	WHERE a.nome ILIKE '%r%'; 
    
    CREATE TABLE cidadesBrasil
	(nomeCidade VARCHAR (70),
	 siglaEstado VARCHAR (4),
	 populacao REAL,
	 regiao VARCHAR (30),
	 idhm real,
	 escolarizacao REAL,
	 CONSTRAINT pk_cidadesBrasil PRIMARY KEY (nomeCidade)
	);
	
--Cidades do Acre
INSERT INTO cidadesBrasil 
	VALUES ('Rio Branco', 'AC', 364756, 'Norte', 0.727, 95.1),
		   ('Feijó', 'AC', 35426, 'Norte', 0.539, 82.9),
		   ('Jordão', 'AC', 9222, 'Norte', 0.469, 71.3);
		   
--Cidades do Alagoas
INSERT INTO cidadesBrasil 
	VALUES ('Maceió', 'AL', 957916, 'Nordeste', 0.721, 95),
		   ('Arapiraca', 'AL', 234696, 'Nordeste', 0.649, 95.9),
		   ('Coruripe', 'AL', 50414, 'Nordeste', 0.626, 97.6);
		   
--Cidades do Amapá
INSERT INTO cidadesBrasil 
	VALUES ('Macapá', 'AP', 442933, 'Norte', 0.733, 94.8),
		   ('Oiapoque', 'AP', 27482, 'Norte', 0.658, 96),
		   ('Serra do Navio', 'AP', 4673, 'Norte', 0.709, 98.4);
	
--Cidades do Amazonas
INSERT INTO cidadesBrasil 
	VALUES ('Manaus', 'AM', 2063689, 'Norte', 0.737, 94.2),
		   ('Parintins', 'AM', 96372, 'Norte', 0.658, 93),
		   ('Humaitá', 'AM', 57473, 'Norte', 0.605, 90.4);	

--Cidades da Bahia
INSERT INTO cidadesBrasil 
	VALUES ('Salvador', 'BA', 2417678, 'Nordeste', 0.759, 95.9),
		   ('Ilhéus', 'BA', 178649, 'Nordeste', 0.690, 96.7),
		   ('Feira de Santana', 'BA', 616272, 'Nordeste', 0.712, 97.4),
		   ('Vitória da Conquista', 'BA', 370879, 'Nordeste', 0.678, 96.8);

--Cidades do Ceará
INSERT INTO cidadesBrasil 
	VALUES ('Fortaleza', 'CE', 2428708, 'Nordeste', 0.754, 96.1),
		   ('Sobral', 'CE', 203023, 'Nordeste', 0.714, 97.9),
		   ('Quixadá', 'CE', 84168, 'Nordeste', 0.659, 95.8);
		   
--Cidades do Espírito Santo
INSERT INTO cidadesBrasil 
	VALUES ('Vitória', 'ES', 322869, 'Sudeste', 0.845, 97.6),
		   ('Serra', 'ES', 520653, 'Sudeste', 0.739, 96.9),
		   ('Guarapari', 'ES', 124656, 'Sudeste', 0.731, 96.2);
		   
--Cidades do Goiás
INSERT INTO cidadesBrasil 
	VALUES ('Goiânia', 'GO', 1437366, 'Centro Oeste', 0.799, 96.4),
		   ('Anápolis', 'GO', 398869, 'Centro Oeste', 0.737, 96.3),
		   ('Catalão', 'GO', 114427, 'Centro Oeste', 0.766, 97.1);
		   
--Cidades do Maranhão
INSERT INTO cidadesBrasil 
	VALUES ('São Luis', 'MA', 1037775, 'Nordeste', 0.768, 96.8),
		   ('Imperatriz', 'MA', 273110, 'Nordeste', 0.731, 98.4),
		   ('Codó', 'MA', 114275, 'Nordeste', 0.595, 97.1);
		   
--Cidades do Mato Grosso
INSERT INTO cidadesBrasil 
	VALUES ('Cuiabá', 'MT', 650877, 'Centro Oeste', 0.785, 95.8),
		   ('Várzea Grande', 'MT', 300078, 'Centro Oeste', 0.734, 95.9),
		   ('Cáceres', 'MT', 89681, 'Centro Oeste', 0.708, 97.8);
		   
--Cidades do Mato Grosso do Sul
INSERT INTO cidadesBrasil 
	VALUES ('Campo Grande', 'MS', 890100, 'Centro Oeste', 0.784, 98),
		   ('Três Lagoas', 'MS', 132152, 'Centro Oeste', 0.744, 97.5),
		   ('Paranaíba', 'MS', 40957, 'Centro Oeste', 0.721, 99.3);
		   
--Cidades das Minas Gerais
INSERT INTO cidadesBrasil 
	VALUES ('Belo Horizonte', 'MG', 2315560, 'Sudeste', 0.810, 97.6),
		   ('Viçosa', 'MG', 76430, 'Sudeste', 0.775, 99),
		   ('Uberlândia', 'MG', 713224, 'Sudeste', 0.789, 98),
		   ('Iturama', 'MG', 38295, 'Sudeste', 0.747, 98.8),
		   ('Poços de Caldas', 'MG', 163742, 'Sudeste', 0.779, 97.7);
		   
--Cidades do Pará
INSERT INTO cidadesBrasil 
	VALUES ('Belém', 'PA', 1303403, 'Norte', 0.746, 96.1),
		   ('Santarém', 'PA', 331942, 'Norte', 0.691, 97.3),
		   ('Marabá', 'PA', 266533, 'Norte', 0.668, 94.7);
		   
--Cidades da Paraíba
INSERT INTO cidadesBrasil 
	VALUES ('João Pessoa', 'PB', 833932, 'Nordeste', 0.763, 96.9),
		   ('Campina Grande', 'PB', 419379, 'Nordeste', 0.720, 97.6),
		   ('Cabedelo', 'PB', 66519, 'Nordeste', 0.748, 97.3);
		   
--Cidades do Paraná
INSERT INTO cidadesBrasil 
	VALUES ('Curitiba', 'PR', 1773718, 'Sul', 0.823, 97.6),
		   ('Foz do Iguaçu', 'PR', 285415, 'Sul', 0.751, 96.4),
		   ('Ponta Grossa', 'PR', 358371, 'Sul', 0.763, 98.2),
		   ('Londrina', 'PR', 555965, 'Sul', 0.778, 97.3);
		   
--Cidades do Pernambuco
INSERT INTO cidadesBrasil 
	VALUES ('Recife', 'PE', 1488920, 'Nordeste', 0.772, 97.1),
		   ('Olinda', 'PE', 349976, 'Nordeste', 0.735, 96.9),
		   ('Ipojuca', 'PE', 98932, 'Nordeste', 0.619, 97.3);
		   
--Cidades do Piauí
INSERT INTO cidadesBrasil 
	VALUES ('Teresina', 'PI', 866300, 'Nordeste', 0.751, 97.8),
		   ('Parnaíba', 'PI', 162159, 'Nordeste', 0.687, 97.5),
		   ('Picos', 'PI', 83090, 'Nordeste', 0.698, 98.3);
		   
--Cidades do Rio de Janeiro
INSERT INTO cidadesBrasil 
	VALUES ('Rio de Janeiro', 'RJ', 6211223, 'Sudeste', 0.799, 96.9),
		   ('Niterói', 'RJ', 481749, 'Sudeste', 0.837, 97),
		   ('Angra dos Reis', 'RJ', 167434, 'Sudeste', 0.724, 96.4),
		   ('Armação dos Búzios', 'RJ', 40006, 'Sudeste', 0.728, 97.6),
		   ('Resende', 'RJ', 129612, 'Sudeste', 0.768, 97);
		   
--Cidades do Rio Grande do Norte
INSERT INTO cidadesBrasil 
	VALUES ('Natal', 'RN', 751300, 'Nordeste', 0.763, 96.3),
		   ('Mossoró', 'RN', 264577, 'Nordeste', 0.720, 97.7),
		   ('Extremoz', 'RN', 61635, 'Nordeste', 0.660, 96.6);

--Cidades do Rio Grande do Sul
INSERT INTO cidadesBrasil 
	VALUES ('Porto Alegre', 'RS', 1332845, 'Sul', 0.805, 96.6),
		   ('Canoas', 'RS', 347657, 'Sul', 0.750, 95.9),
		   ('Gramado', 'RS', 40134, 'Sul', 0.764, 96.9),
		   ('Caxias do Sul', 'RS', 463501, 'Sul', 0.782, 96.3);
		   
--Cidades de Rondônia
INSERT INTO cidadesBrasil 
	VALUES ('Porto Velho', 'RO', 460434, 'Norte', 0.736, 94.5),
		   ('Ariquemes', 'RO', 96833, 'Norte', 0.702, 97.2),
		   ('Cacoal', 'RO', 86887, 'Norte', 0.718, 97.6);
		   
--Cidades de Roraima
INSERT INTO cidadesBrasil 
	VALUES ('Boa Vista', 'RR', 413486, 'Norte', 0.752, 96.6),
		   ('Alto Alegre', 'RR', 20096, 'Norte', 0.542, 56),
		   ('Cantá', 'RR', 18682, 'Norte', 0.619, 96.2);
		   
--Cidades de Santa Catarina
INSERT INTO cidadesBrasil 
	VALUES ('Florianópolis', 'SC', 537211, 'Sul', 0.847, 98.4),
		   ('Camboriú', 'SC', 103074, 'Sul', 0.726, 96.6),
		   ('Blumenau', 'SC', 361261, 'Sul', 0.806, 97),
		   ('Itajaí', 'SC', 264054, 'Sul', 0.795, 97.9);

--Cidades de São Paulo
INSERT INTO cidadesBrasil 
	VALUES ('São Paulo', 'SP', 11451999, 'Sudeste', 0.805, 96),
		   ('Campinas', 'SP', 1139047, 'Sudeste', 0.805, 96),
		   ('Santos', 'SP', 418608, 'Sudeste', 0.840, 98.2),
		   ('Guarujá', 'SP', 287634, 'Sudeste', 0.751, 95.9),
		   ('São José do Rio Preto', 'SP', 480393, 'Sudeste', 0.797, 98),
		   ('Ribeirão Preto', 'SP', 698642, 'Sudeste', 0.800, 96.9),
		   ('Votuporanga', 'SP', 96634, 'Sudeste', 0.790, 98.8),
		   ('Cosmorama', 'SP', 8719, 'Sudeste', 0.722, 97.9),
		   ('Jales', 'SP', 48776, 'Sudeste', 0.776, 98.9);
		   
--Cidades do Sergipe
INSERT INTO cidadesBrasil 
	VALUES ('Aracaju', 'SE', 602757, 'Nordeste', 0.770, 97.4),
		   ('Itabaiana', 'SE', 103440, 'Nordeste', 0.642, 96.4),
		   ('Capela', 'SE', 31645, 'Nordeste', 0.615, 96.3);
		   
--Cidades do Tocantins
INSERT INTO cidadesBrasil 
	VALUES ('Palmas', 'TO', 302692, 'Centro Oeste', 0.788, 98),
		   ('Araguaína', 'TO', 171301, 'Centro Oeste', 0.752, 97.5),
		   ('Pedro Afonso', 'TO', 14055, 'Centro Oeste', 0.732, 97.4);
		   
--Distrito federal
INSERT INTO cidadesBrasil 
	VALUES ('Brasília', 'DF', 2817381, 'Centro Oeste', 0.824, 97.5);

-- Tabela Cliente
CREATE TABLE cliente (codCliente integer PRIMARY KEY, nome character varying(50) NOT NULL, rua character varying (30), nro integer, CEP integer, cidade character varying (40));
-- drop table cliente

-- Tabela Filme 
CREATE TABLE filme (codFilme integer NOT NULL, nome character varying (50) NOT NULL, genero character varying (20) NOT NULL, dtaLanc date NOT NULL, PRIMARY KEY(codFilme));
-- drop table filme

-- Tabela Ator
CREATE TABLE ator (idAtor integer PRIMARY KEY, nome character varying (30) NOT NULL, dtaNasc date);
-- drop table ator


-- tabela exemplar 
CREATE TABLE exemplar (nroExemplar integer not null, codFilme integer references filme (codFilme) ON DELETE CASCADE ON UPDATE CASCADE,
			PRIMARY KEY (nroExemplar,codFilme));
-- drop table exemplar


-- Tabela telefoneCliente -- atributo Multivalorado telefone
CREATE TABLE telefoneCliente (codCliente integer references cliente (codCliente) ON DELETE CASCADE ON UPDATE CASCADE,
			telefone character varying (13), PRIMARY KEY (codCliente,telefone));
-- drop table telefoneCliente

-- Tabela clienteAlugaFilme
CREATE TABLE clienteAlugaExemplarFilme (codCliente integer references cliente (codCliente) ON DELETE CASCADE ON UPDATE CASCADE , 
				codFilme integer, nroExemplar integer, dtaRet date, dtaDev date, 
				 FOREIGN KEY (codFilme,nroExemplar) REFERENCES exemplar (codFilme,nroExemplar) ON DELETE CASCADE ON UPDATE CASCADE,
				  PRIMARY KEY (codCliente, codFilme, nroExemplar, dtaRet, dtaDev));
-- drop table clienteAlugaFilme


-- Tabela atorEstrelaFilme
CREATE TABLE atorEstrelaFilme (idAtor integer references ator (idAtor) ON DELETE CASCADE ON UPDATE CASCADE,
				codFilme integer, FOREIGN KEY (codFilme) REFERENCES filme (codFilme),
				 PRIMARY KEY (idAtor,codFilme));

-- drop table atorEstrelaFilme





-- populando as tabelas 
-- tabela cliente
INSERT INTO cliente values (1, 'Carlos Alberto Ramos','Rua Tocantins', 1050, 15500000, 'Votuporanga');
INSERT INTO cliente values (2, 'Ana Mara Silva','Rua São Paulo', 1234, 15500000, 'Votuporanga');
INSERT INTO cliente values (3, 'José Antônio','Rua 15', 3040, 15700000, 'Santa Fé do Sul');
INSERT INTO cliente values (4, 'Rubens Cardoso','Rua 21', 2012, 15700000, 'Santa Fé do Sul');
INSERT INTO cliente values (5, 'Carla Bruni','Rua Amazonas', 3050, 15500000, 'Votuporanga');
INSERT INTO cliente values (6, 'Derci Gonçalves','Rua Sergipe', 2222, 15500000, 'Votuporanga');
INSERT INTO cliente values (7, 'Joana Maranhão','Rua Pernambuco', 3232, 15500000, 'Votuporanga');
INSERT INTO cliente values (8, 'Cesar Cielo','Av. Pansani', 1050, 15500000, 'Votuporanga');
INSERT INTO cliente values (9, 'Ana Moser','Rua Canadá', 1010, 15500000, 'Votuporanga');
INSERT INTO cliente values (10, 'Thomaz Bellucci','Rua Tocantins', 3070, 15500000, 'Votuporanga');
INSERT INTO cliente values (11, 'Maurren Higa Maggi','Rua Pernambuco', 4032, 15500000, 'Votuporanga');
INSERT INTO cliente values (12, 'Beto Barbosa','Rua Argentina', 1050, 15500000, 'Votuporanga');
INSERT INTO cliente values (13, 'Falcão Cantor','Rua 18', 715, 15700000, 'Santa Fé do Sul');
INSERT INTO cliente values (14, 'Maria Sharapova','Rua 10', 812, 15700000, 'Santa Fé do Sul');
INSERT INTO cliente values (15, 'Roger Federer','Rua Chile', 850, 15500000, 'Votuporanga');
INSERT INTO cliente values (16, 'Rafael Nadal','Rua Peru', 1000, 15500000, 'Votuporanga');
INSERT INTO cliente values (17, 'Paula Fernandes','Rua Amapá', 1050, 15500000, 'Votuporanga');
INSERT INTO cliente values (18, 'Ana Paula Arósio','Rua Uruguai', 2050, 15500000, 'Votuporanga');
INSERT INTO cliente values (19, 'Joana de Assis','Rua Paraguai', 1111, 15500000, 'Votuporanga');
INSERT INTO cliente values (20, 'Fátima Bernades','Rua 13', 1313, 15700000, 'Santa Fé do Sul');
INSERT INTO cliente values (21, 'Odete Roitman','Rua Uruguai', 2020, 15500000, 'Votuporanga');

-- tabela telefoneCliente
INSERT INTO telefoneCliente VALUES (1,01733332222);
INSERT INTO telefoneCliente VALUES (1,01798332222);
INSERT INTO telefoneCliente VALUES (2,01734332222);
INSERT INTO telefoneCliente VALUES (3,01733331111);
INSERT INTO telefoneCliente VALUES (4,01733333333);
INSERT INTO telefoneCliente VALUES (4,01798332222);
INSERT INTO telefoneCliente VALUES (6,01733334444);
INSERT INTO telefoneCliente VALUES (7,01733335555);
INSERT INTO telefoneCliente VALUES (8,01733336666);
INSERT INTO telefoneCliente VALUES (8,01798732222);
INSERT INTO telefoneCliente VALUES (9,01733337777);
INSERT INTO telefoneCliente VALUES (9,01798762222);
INSERT INTO telefoneCliente VALUES (9,01798765222);
INSERT INTO telefoneCliente VALUES (10,01733338888);
INSERT INTO telefoneCliente VALUES (12,01733339999);
INSERT INTO telefoneCliente VALUES (13,01733442222);
INSERT INTO telefoneCliente VALUES (14,01733452222);
INSERT INTO telefoneCliente VALUES (14,01795222222);
INSERT INTO telefoneCliente VALUES (15,01733462222);
INSERT INTO telefoneCliente VALUES (15,01799912222);
INSERT INTO telefoneCliente VALUES (16,01796262222);
INSERT INTO telefoneCliente VALUES (18,01793132222);
INSERT INTO telefoneCliente VALUES (19,01733482222);
INSERT INTO telefoneCliente VALUES (19,01782182222);
INSERT INTO telefoneCliente VALUES (20,01734332222);
INSERT INTO telefoneCliente VALUES (21,01735842222);
INSERT INTO telefoneCliente VALUES (21,01797852222);

--alter table filme alter column nome type character varying (50)
-- Filme
INSERT INTO filme VALUES (1,'Um Sonho de Liberdade','Drama','14/10/1994');
INSERT INTO filme VALUES (2,'O Poderoso Chefão','Crime','24/03/1972');
INSERT INTO filme VALUES (3,'O Poderoso Chefão II','Crime','20/12/1974');
INSERT INTO filme VALUES (4,'Pulp Fiction - Tempo de Violência','Crime','18/02/1995');
INSERT INTO filme VALUES (5,'Três Homens em Conflito','Aventura','29/12/1967');
INSERT INTO filme VALUES (6,'12 Homens e uma Sentença','Drama','04/04/1957');
INSERT INTO filme VALUES (7,'A Lista de Schindler','Drama','17/12/1993');
INSERT INTO filme VALUES (8,'Batman - O Cavaleiro das Trevas','Ação','20/07/2008');
INSERT INTO filme VALUES (9,'O Senhor dos Anéis - O Retorno do Rei','Aventura','17/12/2003');
INSERT INTO filme VALUES (10,'Star Wars - Episódio 5 - O Império Contra Ataca','Aventura','21/05/1980');
INSERT INTO filme VALUES (11,'Clube da Luta','Drama','29/10/1999');
INSERT INTO filme VALUES (12,'Os Setes Samurais','Ação','19/11/1956');
INSERT INTO filme VALUES (13,'A Origem','Aventura','06/08/2010');
INSERT INTO filme VALUES (14,'O Senhor dos Anéis - As Duas Torres','Aventura','27/12/2002'); --ok
INSERT INTO filme VALUES (15,'Gladiador','Ação','19/05/2000');
INSERT INTO filme VALUES (16,'Uma Mente Brilhante','Drama','15/02/2002'); --ok
INSERT INTO filme VALUES (17,'Cidade de Deus','Crime','30/07/2002'); --ok
INSERT INTO filme VALUES (18,'O Auto da Compadecida','Comédia','10/09/2000');
INSERT INTO filme VALUES (19,'Titanic','Drama','16/01/1998');
INSERT INTO filme VALUES (20,'Os Infiltrados','Crime','10/11/2006'); --ok
INSERT INTO filme VALUES (21,'Onze Homens e um Segredo','Aventura','22/02/2002');
INSERT INTO filme VALUES (22,'Como Se Fosse a Primeira Vez','Comédia','30/04/2004');
INSERT INTO filme VALUES (23,'Entrando Numa Fria','Comédia','12/01/2001');
INSERT INTO filme VALUES (24,'Um Sonho Possível','Drama','19/03/2010');
INSERT INTO filme VALUES (25,'Pânico 4','Suspense','15/04/2011');
INSERT INTO filme VALUES (26,'Um Estranho no Ninho','Drama','21/11/1975');


INSERT INTO filme VALUES (27,'American Pie I','Comédia','29/10/1999');
INSERT INTO filme VALUES (28,'Entrevista com o Vampiro','Drama','11/11/1994');



-- tabela ator
INSERT INTO ator values (1,'Nave Campbell','03/10/1973'); -- pânico 4
INSERT INTO ator values (2,'Courtney Cox','15/06/1964'); -- pânico 4
INSERT INTO ator values (3,'Morgan Freeman','01/06/1937'); -- um sonho de liberdade, Batman - o cavaleiro das trevas
INSERT INTO ator values (4,'Tim Robbins','16/10/1958'); -- um sonho de liberdade
INSERT INTO ator values (5,'Marlon Brando','03/04/1924'); -- o poderoso chefão I 
INSERT INTO ator values (6,'Al Pacino','25/04/1940'); -- o poderoso chefão I e II
INSERT INTO ator values (7,'Robert De Niro','17/08/1943'); -- o poderoso chefão II e Entrando Numa Fria
INSERT INTO ator values (8,'John Travolta','18/02/1954'); -- Pulp Fiction
INSERT INTO ator values (9,'Bruce Willis','19/03/1955'); -- Pulp Fiction
INSERT INTO ator values (10,'Julia Roberts','28/10/1967'); -- 11 homens e um segredo
INSERT INTO ator values (11,'Leonardo DiCaprio','11/11/1974'); -- A Origem e Titanic, Os infiltrados
INSERT INTO ator values (12,'Brad Pitt','18/12/1963'); -- Cluve da Luta, 11 homens e um segredo
INSERT INTO ator values (13,'Matt Damon','08/10/1970'); -- Os Infiltrados, Onze homens e um segredo
INSERT INTO ator values (14,'Jack Kugman','27/04/1922'); -- 12 homens e uma sentença
INSERT INTO ator values (15,'Clint Eastwood','31/05/1930'); -- 3 homens e um conflito
INSERT INTO ator values (16,'Eli Wallach','07/12/1915'); -- 3 homens e um conflito
INSERT INTO ator values (17,'Liam Neeson','07/06/1952'); -- A lista de schindler
INSERT INTO ator values (18,'Ralph Fiennes','22/12/1962'); -- A lista de schindler
INSERT INTO ator values (19,'Heath Ledger','04/04/1979'); -- Batman - o cavaleiro das trevas
INSERT INTO ator values (20,'Elijah Wood','28/01/1981'); -- O senhor dos aneis - o retorno do rei e as duas torres
INSERT INTO ator values (21,'Orlando Bloom','13/01/1977'); -- O senhor dos aneis - o retorno do rei e as duas torres
INSERT INTO ator values (22,'Dominic Monaghan','08/12/1976'); -- O senhor dos aneis - o retorno do rei e as duas torres
INSERT INTO ator values (23,'Liv Tyler','01/07/1977');-- O senhor dos aneis - o retorno do rei e as duas torres
INSERT INTO ator values (24,'Danny DeVito','17/11/1974'); -- Um estranho no ninho
INSERT INTO ator values (25,'Harrison Ford','13/07/1942'); -- Star Wars
INSERT INTO ator values (26,'Carrie Fisher','21/10/1951'); -- Star Wars
INSERT INTO ator values (27,'David Andrews','12/12/1952'); -- Clube da luta
INSERT INTO ator values (28,'Toshirô Mifune','01/04/1920'); -- Os Setes Samurais
INSERT INTO ator values (29,'Ellen Page','21/02/1987'); -- A Origem
INSERT INTO ator values (30,'Russel Crowe','07/04/1964'); -- Gladiador e Mente Brilhante
INSERT INTO ator values (31,'Joaquin Phoenix','28/10/1974'); -- Gladiador
INSERT INTO ator values (32,'Jennifer Connely','12/12/19170'); -- Uma Mente brilhante
INSERT INTO ator values (33,'Matheus Nachtergaele','03/01/1969'); -- Cidade de Deus e Auto da Compadecida
INSERT INTO ator values (34,'Alexandre Rodrigues','21/05/1983'); -- cidade de deus
INSERT INTO ator values (35,'Selton Mello','30/12/1972'); -- O Auto da Compadecida
INSERT INTO ator values (36,'Denise Fraga','15/10/1965'); -- O auto da Compadecida
INSERT INTO ator values (37,'Kate Winslet','05/10/1975'); -- Titanic
INSERT INTO ator values (38,'Jack Nicholson','22/04/1937'); -- Os Infiltrados
INSERT INTO ator values (39,'George Clooney','06/05/1961'); -- Onze Homens e um Segredo
INSERT INTO ator values (40,'Adam Sandler','09/09/1966'); -- Como se fosse a primeira vez
INSERT INTO ator values (41,'Drew Barrymore','22/02/1975'); -- Como se fosse a primeira vez
INSERT INTO ator values (42,'Ben Stiller','30/11/1965'); -- Entrando numa Fria
INSERT INTO ator values (43,'Lily Collins','18/03/1989'); -- Um Sonho POssível
INSERT INTO ator values (44,'Sandra Bullock','26/07/1964'); -- Um Sonho POssível
INSERT INTO ator values (45,'Tim McGraw','01/05/1967'); -- Um Sonho POssível

INSERT INTO ator values (46,'Seann William Scott','03/10/1976');


-- atorEstrelaFilme
INSERT INTO atorEstrelaFilme VALUES (1,25); -- (idAtor, codFilme)
INSERT INTO atorEstrelaFilme VALUES (2,25);
INSERT INTO atorEstrelaFilme VALUES (3,1);
INSERT INTO atorEstrelaFilme VALUES (3,8);
INSERT INTO atorEstrelaFilme VALUES (4,1);
INSERT INTO atorEstrelaFilme VALUES (5,2);
INSERT INTO atorEstrelaFilme VALUES (6,2);
INSERT INTO atorEstrelaFilme VALUES (6,3);
INSERT INTO atorEstrelaFilme VALUES (7,3);
INSERT INTO atorEstrelaFilme VALUES (7,23);
INSERT INTO atorEstrelaFilme VALUES (8,4);
INSERT INTO atorEstrelaFilme VALUES (9,4);
INSERT INTO atorEstrelaFilme VALUES (10,21);
INSERT INTO atorEstrelaFilme VALUES (11,13);
INSERT INTO atorEstrelaFilme VALUES (11,19);
INSERT INTO atorEstrelaFilme VALUES (11,20);
INSERT INTO atorEstrelaFilme VALUES (12,11);
INSERT INTO atorEstrelaFilme VALUES (12,21);
INSERT INTO atorEstrelaFilme VALUES (13,20);
INSERT INTO atorEstrelaFilme VALUES (13,21);
INSERT INTO atorEstrelaFilme VALUES (14,6);
INSERT INTO atorEstrelaFilme VALUES (15,3);
INSERT INTO atorEstrelaFilme VALUES (16,3);
INSERT INTO atorEstrelaFilme VALUES (17,7);
INSERT INTO atorEstrelaFilme VALUES (18,7);
INSERT INTO atorEstrelaFilme VALUES (19,8);
INSERT INTO atorEstrelaFilme VALUES (20,9);
INSERT INTO atorEstrelaFilme VALUES (20,14);
INSERT INTO atorEstrelaFilme VALUES (21,9);
INSERT INTO atorEstrelaFilme VALUES (21,14);
INSERT INTO atorEstrelaFilme VALUES (22,9);
INSERT INTO atorEstrelaFilme VALUES (22,14);
INSERT INTO atorEstrelaFilme VALUES (23,9);
INSERT INTO atorEstrelaFilme VALUES (23,14);
INSERT INTO atorEstrelaFilme VALUES (24,26);
INSERT INTO atorEstrelaFilme VALUES (25,10);
INSERT INTO atorEstrelaFilme VALUES (26,10);
INSERT INTO atorEstrelaFilme VALUES (27,11);
INSERT INTO atorEstrelaFilme VALUES (28,12);
INSERT INTO atorEstrelaFilme VALUES (29,13);
INSERT INTO atorEstrelaFilme VALUES (30,15);
INSERT INTO atorEstrelaFilme VALUES (30,16);
INSERT INTO atorEstrelaFilme VALUES (31,15);
INSERT INTO atorEstrelaFilme VALUES (32,16);
INSERT INTO atorEstrelaFilme VALUES (33,17);
INSERT INTO atorEstrelaFilme VALUES (33,18);
INSERT INTO atorEstrelaFilme VALUES (34,17);
INSERT INTO atorEstrelaFilme VALUES (35,18);
INSERT INTO atorEstrelaFilme VALUES (36,18);
INSERT INTO atorEstrelaFilme VALUES (37,19);
INSERT INTO atorEstrelaFilme VALUES (38,20);
INSERT INTO atorEstrelaFilme VALUES (39,21);
INSERT INTO atorEstrelaFilme VALUES (40,22);
INSERT INTO atorEstrelaFilme VALUES (41,22);
INSERT INTO atorEstrelaFilme VALUES (42,23);
INSERT INTO atorEstrelaFilme VALUES (43,24);
INSERT INTO atorEstrelaFilme VALUES (44,24);
INSERT INTO atorEstrelaFilme VALUES (45,24);


INSERT INTO atorEstrelaFilme VALUES (46,27);
INSERT INTO atorEstrelaFilme VALUES (12,28);




-- tabela exemplar
INSERT INTO exemplar VALUES (1,1);
INSERT INTO exemplar VALUES (2,1);
INSERT INTO exemplar VALUES (3,1);
INSERT INTO exemplar VALUES (1,2);
INSERT INTO exemplar VALUES (2,2);
INSERT INTO exemplar VALUES (3,2);
INSERT INTO exemplar VALUES (1,3);
INSERT INTO exemplar VALUES (2,3);
INSERT INTO exemplar VALUES (3,3);
INSERT INTO exemplar VALUES (1,4);
INSERT INTO exemplar VALUES (2,4);
INSERT INTO exemplar VALUES (1,5);
INSERT INTO exemplar VALUES (2,5);
INSERT INTO exemplar VALUES (3,5);
INSERT INTO exemplar VALUES (1,6);
INSERT INTO exemplar VALUES (2,6);
INSERT INTO exemplar VALUES (3,6);
INSERT INTO exemplar VALUES (1,7);
INSERT INTO exemplar VALUES (1,8);
INSERT INTO exemplar VALUES (2,8);
INSERT INTO exemplar VALUES (3,8);
INSERT INTO exemplar VALUES (4,8);
INSERT INTO exemplar VALUES (1,9);
INSERT INTO exemplar VALUES (2,9);
INSERT INTO exemplar VALUES (1,10);
INSERT INTO exemplar VALUES (2,10);
INSERT INTO exemplar VALUES (3,10);
INSERT INTO exemplar VALUES (1,11);
INSERT INTO exemplar VALUES (2,11);
INSERT INTO exemplar VALUES (1,12);
INSERT INTO exemplar VALUES (2,12);
INSERT INTO exemplar VALUES (3,12);
INSERT INTO exemplar VALUES (1,13);
INSERT INTO exemplar VALUES (2,13);
INSERT INTO exemplar VALUES (1,14);
INSERT INTO exemplar VALUES (2,14);
INSERT INTO exemplar VALUES (3,14);
INSERT INTO exemplar VALUES (4,14);
INSERT INTO exemplar VALUES (5,14);
INSERT INTO exemplar VALUES (1,15);
INSERT INTO exemplar VALUES (2,15);
INSERT INTO exemplar VALUES (1,16);
INSERT INTO exemplar VALUES (2,16);
INSERT INTO exemplar VALUES (3,16);
INSERT INTO exemplar VALUES (1,17);
INSERT INTO exemplar VALUES (1,18);
INSERT INTO exemplar VALUES (2,18);
INSERT INTO exemplar VALUES (1,19);
INSERT INTO exemplar VALUES (2,19);
INSERT INTO exemplar VALUES (1,20);
INSERT INTO exemplar VALUES (2,20);
INSERT INTO exemplar VALUES (3,20);
INSERT INTO exemplar VALUES (1,21);
INSERT INTO exemplar VALUES (2,21);
INSERT INTO exemplar VALUES (1,22);
INSERT INTO exemplar VALUES (2,22);
INSERT INTO exemplar VALUES (3,22);
INSERT INTO exemplar VALUES (1,23);
INSERT INTO exemplar VALUES (1,24);
INSERT INTO exemplar VALUES (2,24);
INSERT INTO exemplar VALUES (1,25);
INSERT INTO exemplar VALUES (1,27);
INSERT INTO exemplar VALUES (2,27);

-- populando clienteAlugaExemplarFilme -- tabela gerada pelo relacionamento 
-- ou seja, todo vez que um cliente alugar um exemplar de um filme, dados de ambos devem ser armazenados nessa tabela
-- esses dados são chaves primárias das tabelas envolvidas (que vem como chave estrangeira e ajudam a compor a chave primária) + atributos do relacionamento (quando ocorrer)
INSERT INTO clienteAlugaExemplarFilme VALUES (1,1,1,'11/04/2005','12/04/2005'); -- (idCliente,codigoFilme, nroExemplar, dtaRet,dtaDev)
INSERT INTO clienteAlugaExemplarFilme VALUES (1,1,1,'18/06/2005','19/06/2005');
INSERT INTO clienteAlugaExemplarFilme VALUES (2,2,1,'17/05/2008','18/05/2008');
INSERT INTO clienteAlugaExemplarFilme VALUES (3,5,1,'19/03/2009','20/03/2009');
INSERT INTO clienteAlugaExemplarFilme VALUES (3,6,2,'28/03/2009','29/03/2009');
INSERT INTO clienteAlugaExemplarFilme VALUES (4,8,1,'15/08/2010','16/08/2010');
INSERT INTO clienteAlugaExemplarFilme VALUES (5,20,1,'11/04/2011','12/04/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (6,18,2,'25/05/2011','26/05/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (7,21,2,'11/02/2012','12/02/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (7,3,1,'04/04/2009','04/04/2009');
INSERT INTO clienteAlugaExemplarFilme VALUES (8,15,1,'25/09/2011','26/09/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (9,16,3,'23/07/2010','24/07/2010');
INSERT INTO clienteAlugaExemplarFilme VALUES (10,1,1,'14/03/2008','15/03/2008');
INSERT INTO clienteAlugaExemplarFilme VALUES (10,11,1,'11/04/2012','12/04/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (11,2,2,'20/04/2011','21/04/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (12,12,1,'11/03/2012','12/03/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (13,24,1,'19/02/2011','20/02/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (14,20,2,'20/04/2012','21/04/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (15,20,3,'20/04/2012','21/04/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (15,17,1,'10/11/2011','11/11/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (15,15,1,'21/08/2011','22/08/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (16,16,1,'11/01/2012','12/01/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (17,11,2,'15/01/2012','16/01/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (18,4,1,'11/10/2011','12/10/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (18,5,1,'21/09/2011','22/09/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (19,19,1,'19/12/2008','20/12/2008');
INSERT INTO clienteAlugaExemplarFilme VALUES (19,22,1,'22/03/2012','23/03/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (20,23,1,'15/08/2011','16/08/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (20,24,2,'11/04/2011','12/04/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (20,25,1,'07/02/2012','08/02/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (21,10,2,'13/06/2009','14/06/2009');
INSERT INTO clienteAlugaExemplarFilme VALUES (21,11,1,'18/04/2010','19/04/2010');
INSERT INTO clienteAlugaExemplarFilme VALUES (21,13,1,'21/04/2012','22/04/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (21,14,5,'18/03/2012','19/03/2012');
INSERT INTO clienteAlugaExemplarFilme VALUES (20,1,1,'22/02/2008','23/02/2008');
INSERT INTO clienteAlugaExemplarFilme VALUES (18,19,1,'11/05/2010','12/05/2010');
INSERT INTO clienteAlugaExemplarFilme VALUES (19,21,1,'14/04/2010','15/04/2010');
INSERT INTO clienteAlugaExemplarFilme VALUES (17,11,1,'12/09/2011','13/09/2011');
INSERT INTO clienteAlugaExemplarFilme VALUES (16,15,1,'23/08/2010','24/08/2010');
INSERT INTO clienteAlugaExemplarFilme VALUES (15,8,1,'11/10/2011','12/10/2011');