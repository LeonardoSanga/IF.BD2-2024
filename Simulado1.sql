# 2
SELECT siglaPartido, count(*) FROM Partido P
	INNER JOIN Deputado D
	ON P.idPartido = D.idPartido
	GROUP BY silgalPartido;

# 3
SELECT nome_marin FROM MARINHEIROS M 
	INNER JOIN RESERVAS R
	ON M.id_marin = R.id_marin;

# 4
SELECT cor, count(*) FROM Barcos B
	INNER JOIN Reservas R
	ON B.id_barco = R.id_barco
	GROUP BY cor;

# 5 - B
SELECT nome_marin, nome_barco FROM Marinheiros M
	INNER JOIN Reservas R
	ON M.id_marin = R.id_marin
	INNER JOIN Barcos B
	ON R.id_barco = B.id_barco
	WHERE nome_marin ILIKE '%c%' AND nome_barco ILIKE '%o%';

# 6
CREATE TABLE MedicoAtendePaciente
		(
		CRM VARCHAR(15),
		CPF VARCHAR(15),
		dtaConsulta DATE,
		CONSTRAINT pk_MedicoAtendePaciente PRIMARY KEY (CRM, CPF, dtaConsulta),
		CONSTRAINT fk_MedicoAtendePacienteIndex1 FOREIGN KEY (CRM) REFERENCES Medico (CRM),
		CONSTRAINT fk_MedicoAtendePacienteIndex2 FOREIGN KEY (CPF) REFERENCES Paciente (CPF),
		);

# 7
SELECT M.nome, P.nome, dtaConsulta FROM Medico M
	INNER JOIN MedicoAtendePaciente MAP
	ON M.CRM = MAP.CRM
	INNER JOIN Paciente P
	ON MAP.CPF = P.CPF
	WHERE dtaConsulta > '11/11/2014';




CREATE TABLE marinheiros (id_marin integer PRIMARY KEY, nome_marin VARCHAR (40), avaliacao integer, idade integer);

INSERT INTO marinheiros VALUES (1,'Capitão Gancho', 8, 57),(2,'Alma Negra', 9, 37),
			(3,'Jack Sparrow', 5, 35),(4,'Marujo Frajuto', 3, 42),(5,'Barba Branca', 10, 67);

--INSERT INTO marinheiros VALUES (6,'Willy caolho', 8, 59)
CREATE TABLE barcos (id_barco INTEGER PRIMARY KEY, nome_barco VARCHAR (40), cor VARCHAR(10));

INSERT INTO barcos VALUES (1, 'Pérola Negra', 'Preto'), (2, 'Azul do Mar', 'Azul'),(3, 'Catraca voadora', 'Verde')
			,(4, 'Sigano do Mar', 'Marron'),(5, 'Jóia do Oceano', 'Preto'),(6, 'Marinheiros Gayvotenses', 'Rosa');

CREATE TABLE reservas (id_marin INTEGER REFERENCES marinheiros (id_marin), id_barco INTEGER REFERENCES barcos (id_barco), data_res date,
			PRIMARY KEY (id_marin,id_barco,data_res));

INSERT INTO reservas values (1,2,'01/01/2013'),(2,4,'07/04/2013'),(3,1,'05/06/2013'),(2,2,'07/08/2013'),(4,2,'05/03/2013'),
(5,6,'24/10/2013'),(3,5,'08/02/2013'),(2,4,'12/08/2013'),(5,5,'03/04/2013'),(3,5,'07/04/2013'),(1,6,'25/09/2013');

SELECT * FROM marinheiros;
SELECT * FROM barcos;
SELECT * FROM reservas;

--CRIAÇÃO DE TABELAS
CREATE TABLE CURSO 
		(codCurso VARCHAR (5),
		 nomeCurso VARCHAR (50) NOT NULL,
		 CONSTRAINT pk_curso PRIMARY KEY (codCurso)
		);
		
CREATE TABLE ALUNO
		(prontuario VARCHAR (10),
		 nomeAluno VARCHAR (50) NOT NULL,
		 dtaNasc DATE,
		 cidade VARCHAR (50),
		 codCurso VARCHAR (5),
		 CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
		 CONSTRAINT fk_aluno_curso FOREIGN KEY (codCurso) REFERENCES CURSO 		
		);
		
CREATE TABLE teleAluno 
		(prontuario VARCHAR (10),
		 telefone VARCHAR (15),
		 CONSTRAINT pk_telefoneAluno PRIMARY KEY (prontuario, telefone),
		 CONSTRAINT fk_alunoTele FOREIGN KEY (prontuario) REFERENCES ALUNO
		);
--INSERT
INSERT INTO CURSO VALUES ('BSI', 'Bacharelado em Sistemas de Informação'),
						 ('ELE', 'Bacharelado em Engenharia Elétrica'),
						 ('FIS', 'Licenciatura em Física');

INSERT INTO ALUNO VALUES
			('VP10', 'Ana Paula', '10/05/2000', 'Votuporanga', 'BSI'),
			('VP11', 'Carlos Augusto', '20/04/2000', 'Tanabi', 'ELE'),
			('VP12', 'Danilo Xavier', '10/07/1999', 'Cardoso', 'BSI'),
			('VP13', 'Evandro Silva', '04/11/2000', 'Fernandópolis', 'FIS'),
			('VP14', 'Franciele Cardoso', '22/08/2001', 'Votuporanga', 'BSI'),
			('VP15', 'Mauro Antonio', '27/11/2002', 'Fernandópolis', 'ELE'),
			('VP16', 'Marcela Cunha', '11/11/2000', 'Votuporanga', 'FIS'),
			('VP17', 'Pedro Paulo', '14/08/1999', 'Cardoso', 'ELE'),
			('VP18', 'Rodolfo Menezes', '10/04/2003', 'Tanabi', 'BSI'),
			('VP19', 'Joana de Assis', '20/05/2000', 'Votuporanga', 'BSI');

INSERT INTO teleAluno VALUES ('VP10', '(17)999998888'),
							 ('VP10', '(17)999997777'),
							 ('VP11', '(17)999996666'),
							 ('VP11', '(17)999997777'),
							 ('VP12', '(18)999995555'),
							 ('VP13', '(17)999994444');



--UPDATE
UPDATE ALUNO SET cidade = 'Votuporanga'
		WHERE prontuario = 'VP12';
SELECT * FROM aluno;

--DELETE
DELETE FROM aluno
		WHERE dtaNasc < '01/01/1995';

--SELECT
SELECT nomeAluno, cidade FROM aluno
	WHERE cidade = 'Votuporanga' OR cidade = 'Cardoso';

SELECT nomeAluno, cidade FROM aluno
	WHERE cidade IN ('Votuporanga', 'Cardoso')
	ORDER BY nomeAluno DESC;

SELECT nomeAluno, cidade, dtaNasc FROM aluno
	WHERE cidade = 'Votuporanga' AND dtaNasc >= '01/01/2000';

SELECT nomeAluno, dtaNasc FROM aluno
	WHERE dtaNasc >= '04/11/2000' AND dtaNasc <= '01/01/2005';
	
SELECT nomeAluno, dtaNasc FROM aluno
	WHERE dtaNasc BETWEEN '04/11/2000' AND '01/01/2005';
	
--LIKE
SELECT nomeAluno FROM aluno
	WHERE nomeAluno LIKE 'M%';

SELECT nomeAluno FROM aluno
	WHERE nomeAluno LIKE '%n%a%';

--GROUP BY
SELECT nomeAluno, cidade FROM aluno
		ORDER BY cidade;
		
SELECT cidade, count(cidade) FROM aluno
	GROUP BY cidade
	HAVING count(cidade) > 1
	ORDER BY count(cidade);		
		
--JUNÇÃO
SELECT nomeAluno, nomeCurso FROM aluno a, curso c, teleAluno ta
	WHERE c.codCurso = a.codCurso AND ta.prontuario = a.prontuario;
	
SELECT nomeAluno, nomeCurso, telefone FROM aluno a
	INNER JOIN curso c
	ON c.codCurso = a.codCurso
	INNER JOIN teleAluno ta
	ON ta.prontuario = a.prontuario
	ORDER BY nomeCurso;

SELECT nomeCurso, count(nomeALuno) FROM aluno a
	INNER JOIN curso c
	ON a.codCurso = c.codCurso
	GROUP BY nomeCurso
	ORDER BY nomeCurso;

