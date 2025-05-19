-- Exercício 1
SELECT nome, especialidade FROM medico m
	INNER JOIN especialidadeMedico em
	ON m.crm = em.crm
	ORDER BY nome;

-- Exercício 2 
SELECT m.nome, p.nome, dtaConsulta FROM medico m
	INNER JOIN consultas c
	ON m.CRM = c.crm
	INNER JOIN paciente p
	ON c.cpf = p.cpf
	ORDER BY dtaConsulta;

-- Exercício 3
SELECT nome, especialidade, dtaConsulta FROM medico m
	INNER JOIN especialidadeMedico em
	ON m.crm = em.crm
	INNER JOIN consultas c
	ON m.crm = c.crm
	WHERE especialidade = 'Cardiologista' AND dtaConsulta > '10/07/2024';

SELECT nome, especialidade, dtaConsulta FROM medico m, especialidadeMedico em, consultas c
	WHERE m.crm = em.crm AND m.crm = c.crm AND especialidade = 'Cardiologista' AND dtaConsulta > '10/07/2024'
	ORDER BY nome;

-- Exercício 4
SELECT m.nome, p.nome, especialidade, dtaConsulta FROM medico m
	INNER JOIN especialidadeMedico em
	ON m.crm = em.crm
	INNER JOIN consultas c
	ON m.crm = c.crm
	INNER JOIN paciente p
	ON c.cpf = p.cpf
	WHERE especialidade = 'Cardiologista' AND dtaConsulta > '10/07/2024';

-- Exercício 5
SELECT nome, count(dtaConsulta) AS "Quantidade de Consultas" FROM paciente p
	INNER JOIN consultas c
	ON p.cpf = c.cpf
	GROUP BY nome
	HAVING count(dtaConsulta) > 1;

-- Exercício 6
SELECT nome, count(codFilme) AS "Quantidade de Filmes Estrelados" FROM ator a
	INNER JOIN atorEstrelaFilme aef
	ON a.idAtor = aef.idAtor
	GROUP BY nome;

-- Exercício 7
SELECT a.nome, f.nome FROM ator a
	INNER JOIN atorEstrelaFilme aef
	ON a.idAtor = aef.idAtor
	INNER JOIN filme f
	ON aef.codFilme = f.codFilme
	ORDER BY a.nome;

-- Exercício 8
SELECT genero, count(genero) FROM filme f
	INNER JOIN clienteAlugaExemplarFilme caef
	ON f.codFilme = caef.codFilme
	WHERE genero = 'Comédia'
	GROUP BY genero;

-- Exercício 9
SELECT nome, telefone FROM cliente c
	INNER JOIN telefoneCliente tc
	on c.codCliente = tc.codCliente
	ORDER BY nome;

-- Exercício 10
SELECT c.nome, f.nome FROM cliente c
	INNER JOIN clienteAlugaExemplarFilme caef
	ON c.codCliente = caef.codCliente
	INNER JOIN filme f
	ON caef.codFilme = f.codFilme
	ORDER BY c.nome;
    
    
-- Scripts utilizados:

-- CRIAÇÃO DE TABELAS - CONSULTASMEDICAS
-- TABELA PACIENTE
CREATE TABLE PACIENTE 
	(CPF INTEGER,
	 nome VARCHAR (50),
	 rua VARCHAR (40),
	 cidade VARCHAR (50),
	 CEP VARCHAR (15),
	 CONSTRAINT pk_paciente PRIMARY KEY (CPF)
	);
	
--TABELA MÉDICO
CREATE TABLE MEDICO 
	(CRM VARCHAR(20),
	 nome VARCHAR (50),
	 rua VARCHAR (40),
	 cidade VARCHAR (50),
	 CEP VARCHAR (15),
	 CONSTRAINT pk_medico PRIMARY KEY (CRM)
	);
	
--TABELA consultas
CREATE TABLE consultas
	(CRM VARCHAR (20),
	 CPF INTEGER,
	 dtaConsulta DATE,
	 CONSTRAINT fk_pacienteConsulta FOREIGN KEY (CPF) REFERENCES PACIENTE,
	 CONSTRAINT fk_medicoConsulta FOREIGN KEY (CRM) REFERENCES MEDICO,
	 CONSTRAINT pk_consultas PRIMARY KEY (CRM,CPF, dtaConsulta)
	);
	
--especialidadeMedico
CREATE TABLE especialidadeMedico
	(especialidade VARCHAR (40),
	 CRM VARCHAR (20),
	 CONSTRAINT pk_especialidadeMedico PRIMARY KEY (especialidade, CRM),
	 CONSTRAINT fk_especMedico FOREIGN KEY (CRM) REFERENCES medico
	);
	
--Dados Paciente
INSERT INTO PACIENTE VALUES 
	(123456, 'Carlos Augusto', 'Rua Amazonas', 'Votuporanga', '15505000'),
	(222456, 'Natália Ramos', 'Avenida da Amazonas', 'Votuporanga', '15505050'),
	(333456, 'Thiago Andrade', 'Av. Central', 'Cardoso', '15570000'),
	(444456, 'Pedro Antonio', 'Av. Rui Barbosa', 'Cardoso', '15570000'),
	(555456, 'Marcelo Gonçalves', 'Rua Brasil', 'Valentin Gentil', '15520000'),
	(666456, 'Silvia Maria', 'Av. Raphael Cavalin', 'Valentin Gentil', '15520000'),
	(777456, 'José Augusto', 'Rua Pernambuco', 'Votuporanga', '15505000'),
	(888456, 'Danilo Oliveira', 'Rua São Paulo', 'Votuporanga', '15505000'),
	(999456, 'Beto Arantes', 'Av. Pedro Pedrosa', 'Nhandeara', '15190000'),
	(123123, 'Ana Flávia', 'Av. Fernando Felício', 'Cosmorama', '15530000');
	
--DADOS DO MÉDICO
INSERT INTO MEDICO VALUES
	('12ABC', 'Roberto Carlos', 'Rua Amazonas', 'Votuporanga', '15505000'),
	('22ABC', 'Helena Bastos', 'Rua Tocantins', 'Votuporanga', '15505010'),
	('33ABC', 'Guilherme Arantes', 'Rua Mato Grosso', 'Votuporanga', '15515000'),
	('44ABC', 'Fernanda Vasconcelos', 'Rua Rio de Janeiro', 'Fernandópolis', '15600000'),
	('12BBB', 'Juliana Silva', 'Av. Francisco Costa', 'Fernandópolis', '15600000'),
	('12CCC', 'Rogério Tramontina', 'Rua Espírito Santo', 'Fernandópolis', '15600000'),
	('12DDD', 'Silvio Ralio', 'Av. José Munia', 'São José do Rio Preto', '15085895'),
	('12EEE', 'Carla Maria', 'Av. José Munia', 'São José do Rio Preto', '15085895'),
	('12FFF', 'Elisa Silvestre', 'Av. Dr. Alberto Andaló', 'São José do Rio Preto', '15015000'),
	('12GGG', 'Cristiane Silva', 'Av. Dr. Alberto Andaló', 'São José do Rio Preto', '15015000'),
	('12HHH', 'Lucas Augusto', 'Av. Franscisco Jales', 'Jales', '15700022');
	
--DADOS ESPECIALIDADES DO MÉDICO
INSERT INTO especialidadeMedico VALUES
	('Cardiologista', '12ABC'),
	('Ortopedista', '22ABC'),
	('Oncologista', '33ABC'),
	('Pediatra', '44ABC'),
	('Obstetra', '12BBB'),
	('Cardiologista', '12CCC'),
	('Cardiologista', '12DDD'),
	('Ortopedista', '12EEE'),
	('Pediatra', '12FFF'),
	('Obstetra', '12GGG'),
	('Oncologista', '12HHH');
	
--Dados Consulta
INSERT INTO consultas VALUES
	('12ABC', '123456', '10/07/2024'), ('12ABC', '123456', '10/08/2024'),
	('22ABC', '222456', '20/07/2024'), ('33ABC', '123456', '10/09/2024'),
	('22ABC', '333456', '05/10/2024'), ('44ABC', '222456', '22/09/2024'),
	('33ABC', '333456', '16/09/2024'), ('44ABC', '444456', '10/08/2024'),
	('44ABC', '444456', '17/08/2024'), ('12BBB', '444456', '02/10/2024'),
	('12ABC', '555456', '22/09/2024'), ('12EEE', '555456', '17/07/2024'),
	('12BBB', '666456', '25/08/2024'), ('12EEE', '666456', '18/08/2024'),
	('12FFF', '777456', '26/09/2024'), ('12FFF', '666456', '19/09/2024'),
	('12DDD', '777456', '11/09/2024'), ('12GGG', '777456', '01/10/2024'),
	('12CCC', '777456', '04/10/2024'), ('12CCC', '888456', '13/09/2024'),
	('12HHH', '888456', '28/07/2024'), ('12HHH', '999456', '21/07/2024'),
	('12CCC', '999456', '28/08/2024'), ('12HHH', '123123', '10/09/2024');

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