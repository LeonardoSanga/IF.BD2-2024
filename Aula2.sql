-- TABELA CLIENTE
CREATE TABLE CLIENTE
	(
	cpf VARCHAR (13)NOT NULL,
	nome VARCHAR (60) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY (cpf)
	);

-- TABELA PEDIDO
CREATE TABLE PEDIDO
	(
	idPedido INTEGER NOT NULL,
	valor REAL NOT NULL,
	cpf_cli VARCHAR (13)NOT NULL,
	CONSTRAINT pk_pedido PRIMARY KEY (idPedido),
	CONSTRAINT fk_pedido_cliente FOREIGN KEY (cpf_cli) REFERENCES CLIENTE ON UPDATE CASCADE ON DELETE CASCADE
	);

INSERT INTO CLIENTE VALUES ('1A', 'Rafael'), ('2B', 'Leonardo');

INSERT INTO PEDIDO VALUES (1, 89.78, '1A'), (2, 100.50, '1A'), (3, 299, '2B');

DELETE FROM CLIENTE WHERE cpf = '1A';
UPDATE CLIENTE SET cpf = '2A' WHERE cpf = '1A';

DROP TABLE PEDIDO;

SELECT * FROM PEDIDO;


-- 1x1
CREATE TABLE GERENTE 
	(
	cpf_ger INTEGER,
	nome_ger VARCHAR (50) NOT NULL,
	CONSTRAINT pk_gerente PRIMARY KEY (cpf_ger)
	);

INSERT INTO GERENTE VALUES (123456, 'João Gomes'), (233333, 'Carlos Silva');

CREATE TABLE DEPARTAMENTO
	(
	cod_dep INTEGER,
	nome_dep VARCHAR (50) NOT NULL,
	gerente_cpf_ger INTEGER NOT NULL UNIQUE,  -- UNIQUE garante 1x1
	CONSTRAINT pk_departamento PRIMARY KEY (cod_dep),
	CONSTRAINT fk_gerente_departamento FOREIGN KEY (gerente_cpf_ger) REFERENCES GERENTE
	);

INSERT INTO DEPARTAMENTO VALUES (1, 'TI', 123456);
INSERT INTO DEPARTAMENTO VALUES (2, 'CC', 123456); -- 1x1 garantido pelo UNIQUE
INSERT INTO DEPARTAMENTO VALUES (3, 'MD', 233333);

SELECT nome_ger, nome_dep FROM GERENTE
	INNER JOIN DEPARTAMENTO
	ON gerente_cpf_ger = cpf_ger;

-- O mesmo do de cima
SELECT nome_ger, nome_dep FROM GERENTE, DEPARTAMENTO 
	WHERE gerente_cpf_ger = cpf_ger;

-- produto cartesiano: junta cada linha da primeira tabela com todas as linhas da segunda
SELECT nome_ger, nome_dep FROM GERENTE, DEPARTAMENTO


-- TABELA CURSO
CREATE TABLE CURSO
	(
	codCurso INTEGER,
	nome VARCHAR (50) NOT NULL,
	valor REAL,
	CONSTRAINT pk_curso PRIMARY KEY (codCurso)
	);

-- TABELA ALUNO
CREATE TABLE ALUNO
	(
	ra VARCHAR (20),
	nomeAluno VARCHAR (50) NOT NULL,
	endereco VARCHAR (100),
	codCurso INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (codCurso) REFERENCES CURSO
	);

-- TABELA CORDENADOR
CREATE TABLE COORDENADOR
	(
	cpf_coord INTEGER,
	nome VARCHAR (50) NOT NULL,
	codCurso INTEGER UNIQUE,
	CONSTRAINT pk_coordenador PRIMARY KEY (cpf_coord),
	CONSTRAINT fk_coord_curso FOREIGN KEY (codCurso) REFERENCES CURSO
	);



-- NxN
-- TABELA FUNCIONARIO
CREATE TABLE FUNCIONARIO
	(
	cpf VARCHAR (13),
	nome VARCHAR (50) NOT NULL,
	CONSTRAINT pk_func PRIMARY KEY (cpf)
	);

INSERT INTO FUNCIONARIO VALUES ('123.133' , 'João Augusto'), ('543.432', 'Ana Maria'),
								('123.321' , 'Carlos Augusto'), ('543.583', 'Anya Clara');

-- TABELA PROJETO
CREATE TABLE PROJETO
	(
	idProjeto INTEGER,
	nomeProj VARCHAR (50),
	CONSTRAINT pk_projeto PRIMARY KEY (idProjeto)
	);

INSERT INTO PROJETO VALUES (1, 'Vendas'), (2, 'Expansão');

-- TABELA TRABALHA
CREATE TABLE TRABALHA
	(
	cpf_func VARCHAR (13),
	idProjeto INTEGER,
	CONSTRAINT pk_trabalha PRIMARY KEY (cpf_func, idProjeto),
	CONSTRAINT fk_trabalha_func FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO,
	CONSTRAINT fk_trabalha_proj FOREIGN KEY (idProjeto) REFERENCES PROJETO
	);

INSERT INTO TRABALHA VALUES ('123.133', 1), ('123.133', 2);
INSERT INTO TRABALHA VALUES ('543.432', 1), ('543.583', 2);

SELECT * FROM TRABALHA;

SELECT nome, nomeProj FROM funcionario
	INNER JOIN trabalha
	ON cpf_func = cpf
	INNER JOIN  projeto
	ON trabalha.idProjeto = projeto.idProjeto;



-- Multivalorado
CREATE TABLE EMPREGADO
	(
	idEmp SERIAL,
	pnome VARCHAR (20),
	snome VARCHAR (40),
	salario REAL,
	sexo VARCHAR(1),
	CONSTRAINT pk_funcionario PRIMARY KEY (idEmp)
	);

INSERT INTO EMPREGADO (pnome, snome, salario, sexo)
							VALUES ('Pedro', 'Augusto', 2500, 'M'),
							('Laura', 'Santos', 1350, 'F'),
							('Artur', 'Carvalho', 4000, 'M'),
							('Lucas', 'Vieira', 5500, 'M');

SELECT * FROM EMPREGADO;

CREATE TABLE TELEFONEEMP
	(
	idEmp INTEGER,
	telefone VARCHAR (15),
	CONSTRAINT pk_telefone PRIMARY KEY (idEmp, telefone),
	CONSTRAINT fk_telefone_emp FOREIGN KEY (idEmp) REFERENCES EMPREGADO
	);

INSERT INTO TELEFONEEMP VALUES (1, '(17)99758-4634'), (1, '(17)99651-5432'),
								(2, '(17)99758-4634'), (2, '(17)99671-3331'),
								(3, '(16)99758-4634'), (4, '(18)99758-4634');

SELECT pnome, telefone FROM EMPREGADO
	INNER JOIN telefoneEmp
	ON empregado.idEmp = telefoneEmp.idEmp;



-- Agregação
CREATE TABLE MEDICO
	(
	crm VARCHAR (15),
	nome VARCHAR (40),
	CONSTRAINT pk_medico PRIMARY KEY (CRM)
	);

CREATE TABLE PACIENTE
	(
	cpf VARCHAR (15),
	nome VARCHAR (40),
	CONSTRAINT pk_paciente PRIMARY KEY (cpf)
	);

CREATE TABLE CONSULTA
	(
	crm VARCHAR (15),
	cpf VARCHAR (15),
	dtaCons DATE,
	CONSTRAINT pk_consulta PRIMARY KEY (crm, cpf, dtaCons),
	CONSTRAINT fk_medico_consulta FOREIGN KEY (crm) REFERENCES MEDICO,
	CONSTRAINT fk_paciente_consulta FOREIGN KEY (cpf) REFERENCES PACIENTE
	);

CREATE TABLE EXAME
	(
	idExame INTEGER,
	nome VARCHAR (40),
	CONSTRAINT pk_exame PRIMARY KEY (idExame)
	);

CREATE TABLE examesConsulta
	(
	idExame INTEGER,
	crm VARCHAR (15),
	cpf VARCHAR (15),
	dtaCons DATE,
	CONSTRAINT pk_examesConsulta PRIMARY KEY (idExame, crm, cpf, dtaCons),
	CONSTRAINT fk_examesCons1 FOREIGN KEY (idExame) REFERENCES EXAME,
	CONSTRAINT fk_examesCons2 FOREIGN KEY (crm, cpf, dtaCons) REFERENCES CONSULTA
	);