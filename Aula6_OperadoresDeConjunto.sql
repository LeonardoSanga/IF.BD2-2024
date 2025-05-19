--Exemplos operadores de conjuntos
CREATE TABLE ALUNO (prontuario VARCHAR(10),
				    nomeAlu VARCHAR (50),
				    CONSTRAINT pk_aluno PRIMARY KEY (prontuario));

--dados dos alunos
INSERT INTO ALUNO VALUES
		('VP10', 'Ana Paula'), ('VP11', 'Carlos'), ('VP12', 'Danilo'),
		('VP13', 'Pedro'), ('VP14', 'Marcela'), ('VP15', 'Cecília'),
		('VP16', 'Carla'), ('VP17', 'Joana'), ('VP18', 'Júlio');

CREATE TABLE PROFESSOR (prontuario VARCHAR(10),
				    nomePro VARCHAR (50),
				    CONSTRAINT pk_professor PRIMARY KEY (prontuario));

--Dados do professor
INSERT INTO PROFESSOR VALUES
		('VP10', 'Daniela'), ('VP11', 'Cristiane'), ('VP12', 'André'),
		('VP13', 'Joana'), ('VP14', 'Carlos');
		
CREATE TABLE FUNCIONARIO (idFunc INTEGER,
				    nomeFunc VARCHAR (50),
				    CONSTRAINT pk_Funcionario PRIMARY KEY (idFunc));
					
INSERT INTO FUNCIONARIO VALUES
		(1, 'Carlos'), (2, 'Otávio'), (3, 'Ana Paula'), (4, 'Marcela'),
		(5, 'Thiago');

--drop table imovel
CREATE TABLE imovel(idImovel INTEGER,
		    tipoImovel varchar(30) NOT NULL,
		    Rua varchar(50),
		    cidade varchar(50),
		    CEP varchar(10),
		    preco numeric(10,2),
		    constraint pk_imovel PRIMARY KEY (idImovel));

--inserindo imóveis
INSERT INTO imovel VALUES(1, 'Casa', 'Rua Alagoas', 'Votuporanga', '15505-555', 980.00),
			 (2, 'Casa', 'Rua Ceará', 'Votuporanga', '15505-551', 789.55),
			 (3, 'Casa', 'Av. Paschoalino Pedrazzoli', 'Votuporanga', '15505-550', 1200.00),
			 (4, 'Casa', 'Rua Alagoas', 'Votuporanga', '15505-555', 990.00),
			 (5, 'Casa', 'Rua Uruguai', 'Votuporanga', '15505-557', 15000.00),
			 (6, 'Casa', 'Rua Chile', 'Votuporanga', '15505-558', 650.00),
			 (7, 'Apartamento', 'Rua Amazonas', 'Votuporanga', '15505-556', 1450.00),
			 (8, 'Apartamento', 'Av. Andaló', 'São José do Rio Preto', '13505-555', 2000.00),
			 (9, 'Apartamento', 'Av. Murchid Homsi', 'São José do Rio Preto', '13405-555', 1620.00),
			 (10, 'Sobrado', 'Rua Pernambuco', 'Votuporanga', '15500-555', 700.00),
			 (11, 'Sobrado', 'Rua Alagoas', 'Votuporanga', '15505-555', 1000.00);

CREATE TABLE inquilino(cpf varchar(15),
		       nome VARCHAR(50) NOT NULL,
		       dtaNascimento date,
		       sexo varchar(1));

ALTER TABLE inquilino ADD CONSTRAINT pk_inquilino PRIMARY KEY (cpf);

insert INTO inquilino VALUES('123.456.789','Alberto Roberto', '11/05/1988', 'M'),
			    ('223.456.789','Joana', '11/05/1990', 'F'),
			    ('123.458.789','Pedro', '10/06/1991', 'M'),
			    ('123.456.987','Mara', '20/08/1996', 'F'),
			    ('124.456.789','Carlos', '10/07/1991', 'M'),
			    ('153.456.789','João', '25/10/1988', 'M'),
			    ('323.456.789','Silvia', '15/06/1995', 'F'),
			    ('225.456.789','Julio', '10/09/1997', 'M'),
			    ('183.256.789','Marcelo', '21/05/1978', 'M'),
			    ('427.496.280','Renata', '11/02/2001', 'F');

CREATE TABLE corretor(creci varchar(15),
		       nome VARCHAR(50) NOT NULL,
		       dtaNascimento date,
		       sexo varchar(1));
ALTER TABLE corretor ADD CONSTRAINT pk_corretor PRIMARY KEY (creci);

insert INTO corretor VALUES('12sd12','Rodolfo', '22/08/1988', 'M'),
			    ('12sd13','Joana', '15/11/1989', 'F'),
			    ('12sd14','Ana Mara', '12/07/1990', 'F'),
			    ('12sd16','Marcelo', '19/07/1985', 'M'),
			    ('12sd21','Renata', '11/09/2001', 'F');

create table ALUGUEL(cpfInquilino varchar(15),
		     creciCorretor varchar(15),
		     idImovel integer,
		     dataIniLocacao date NOT NULL,
		     dataFimLocacao date,
		     CONSTRAINT pk_aluguel PRIMARY KEY (cpfInquilino, creciCorretor, idImovel, dataIniLocacao),
		     CONSTRAINT fk_cpfInq FOREIGN KEY (cpfInquilino) references inquilino, 
		     CONSTRAINT fk_cpfCorret FOREIGN KEY (creciCorretor) references corretor,
		     CONSTRAINT fk_idImovel FOREIGN KEY (idImovel) references imovel);

INSERT into aluguel VALUES ('123.456.789', '12sd21', 1, '01/01/2018'),
			   ('427.496.280', '12sd13', 2, '02/02/2018'),
			   ('123.456.987', '12sd21', 3, '07/03/2017'),
			   ('124.456.789', '12sd16', 4, '05/06/2019'),
			   ('323.456.789', '12sd16', 5, '10/01/2017'),
			   ('183.256.789', '12sd14', 8, '01/08/2016'),
			   ('123.456.789', '12sd21', 9, '01/01/2017');

INSERT into aluguel VALUES ('124.456.789', '12sd21', 4, '01/01/2016', '05/05/2019');

-- Union
SELECT nome FROM corretor ORDER BY nome;
SELECT nome FROM inquilino ORDER BY nome;

SELECT nome FROM corretor
UNION
SELECT nome FROM inquilino ORDER BY nome;

SELECT nome FROM corretor
UNION ALL
SELECT nome FROM inquilino ORDER BY nome;

SELECT nomePro FROM professor
UNION
SELECT nomeAlu FROM aluno
UNION
SELECT nomeFunc FROM funcionario ORDER BY nomePro;

SELECT nomePro FROM professor
UNION ALL
SELECT nomeAlu FROM aluno
UNION ALL
SELECT nomeFunc FROM funcionario ORDER BY nomePro;

SELECT nome, sexo FROM inquilino
INTERSECT
SELECT nome, sexo FROM corretor

SELECT nome FROM inquilino
EXCEPT
SELECT nome FROM corretor
ORDER BY nome;

SELECT nome FROM corretor
EXCEPT
SELECT nome FROM inquilino
ORDER BY nome;

