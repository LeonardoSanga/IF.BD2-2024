SELECT pnome, cargo FROM empregado;
SELECT pnome, snome, salario FROM empregado;
SELECT pnome, cargo, idade FROM empregado;

SELECT pnome, idade FROM empregado
	WHERE idade = 32;
SELECT pnome, salario FROM empregado
	WHERE salario > 3000
	ORDER BY salario;

SELECT pnome FROM empregado
	WHERE pnome > 'Carlos'
	ORDER BY pnome;

SELECT pnome, cargo FROM empregado
	WHERE cargo <> 'Vendedor';

-- DISTINCT
SELECT pnome FROM empregado ORDER BY pnome;
SELECT DISTINCT pnome FROM empregado ORDER BY pnome;

SELECT cargo FROM empregado ORDER BY cargo;
SELECT DISTINCT cargo FROM empregado ORDER BY cargo;

SELECT DISTINCT cargo, idade FROM empregado ORDER BY cargo;

SELECT pnome, snome, idade FROM empregado WHERE idade > 30 ORDER BY idade;

SELECT pnome, cargo, salario FROM empregado WHERE cargo = 'Vendedor';

SELECT pnome, cargo FROM empregado WHERE cargo = 'Secretária' OR cargo = 'Gerente';
SELECT pnome, cargo, salario FROM empregado WHERE cargo = 'Vendedor' OR salario > 3000 ORDER BY salario;

SELECT pnome, cargo, salario FROM empregado
	WHERE cargo = 'Analista de Sistemas' AND salario > 4000;
SELECT pnome, cargo FROM empregado WHERE cargo = 'Gerente' AND pnome = 'Pedro';

SELECT pnome, cargo FROM empregado
	WHERE cargo IN ('Gerente', 'Estagiário', 'Vendedor'); 

SELECT pnome, cargo, salario FROM empregado
	WHERE cargo IN ('Técnico em Segurança', 'Analista de Sistemas') AND salario > 2000;

SELECT pnome, cargo FROM empregado
	WHERE cargo NOT IN ('Gerente', 'Estagiário', 'Vendedor');  

SELECT pnome, salario FROM empregado
	WHERE salario BETWEEN 2500 AND 4000
	ORDER BY salario DESC, pnome;  

SELECT pnome AS "Primeiro Nome", salario AS "Salário", cargo AS "Cargo" FROM empregado
	WHERE salario > 2500
	ORDER BY salario DESC;

SELECT avg(salario) AS "Média dos salários", sum(salario) AS "Folha Salarial" FROM empregado;

SELECT pnome FROM empregado
	WHERE pnome LIKE 'A%';

SELECT pnome FROM empregado
	WHERE pnome ILIKE '%a%';

SELECT pnome FROM empregado
	WHERE pnome LIKE '_e%' OR pnome LIKE '%i_';

SELECT pnome FROM empregado
	WHERE pnome ILIKE '%a%s%';

-- GROUP BY

SELECT cargo, avg(salario) FROM EMPREGADO
	GROUP BY cargo;

SELECT max(idade) AS "Idade do empregado mais velho", min(idade) FROM EMPREGADO;

SELECT count(*) FROM EMPREGADO
	WHERE salario > 3000;

SELECT count(*) AS "Quantidade de Gerentes" FROM EMPREGADO
	WHERE cargo = 'Gerente';

SELECT * FROM EMPREGADO;
SELECT count(*) FROM EMPREGADO;
SELECT cargo, count(*) FROM EMPREGADO
	GROUP BY cargo
	ORDER BY count(*);

SELECT cargo, avg(salario) FROM EMPREGADO
	GROUP BY cargo DESC;

SELECT cargo, sum(salario) FROM EMPREGADO
	GROUP BY cargo;

SELECT cargo, sum(salario) FROM EMPREGADO
	GROUP BY cargo
	HAVING sum(salario) > 10000; 

-- JUNÇÃO

-- produto cartesiano - errado
SELECT pnome, nomeCurso FROM curso, aluno;

-- Junções

-- forma clássica
SELECT pnome, nomeCurso FROM curso C, aluno A
	WHERE C.idCurso = A.idCurso;

-- INNER JOIN
SELECT pnome, nomeCurso, sexo FROM curso C
	INNER JOIN aluno A
	ON C.idCurso = A.idCurso
	WHERE sexo = 'F'
	ORDER BY nomeCurso;

SELECT pnome, ano FROM professor, professorLecionaAluno
	WHERE prontuario = prontuarioProfessor AND ano = 2009;

SELECT P.pnome, L.ano FROM professor P
	INNER JOIN professorLecionaAluno L
	ON P.prontuario = L.prontuarioProfessor
	WHERE ano = 2009;

SELECT pnome, ano, nomeCurso FROM ALUNO A, professorLecionaAluno pla, CURSO C
	WHERE A.prontuario = pla.prontuarioAluno AND A.idCurso = C.idCurso AND pla.nota > 7;

SELECT A.pnome, pla.ano, C.nomeCurso, pla.nota FROM ALUNO A
	INNER JOIN professorLecionaAluno pla
	ON A.prontuario = pla.prontuarioAluno
	INNER JOIN CURSO C
	ON A.idCurso = C.idCurso
	WHERE pla.nota > 7
	ORDER BY pla.nota;
    
    
    
-- Scripts utilizados:

CREATE TABLE EMPREGADO(idEmp integer PRIMARY KEY, pNome character varying (20) NOT NULL, sNome character varying(20) NOT NULL, idade integer, salario real NOT NULL, cargo character varying(30) NOT NULL);

--drop table empregado

INSERT INTO empregado VALUES (1,'Carlos','Alberto',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (2,'Pedro','Augusto',32,3500,'Analista de Sistemas');
INSERT INTO empregado VALUES (3,'Mara','Antonia',27,1200,'Secretária');
INSERT INTO empregado VALUES (4,'Derci','Gonçalves',56,6500,'Gerente');
INSERT INTO empregado VALUES (5,'Pedro','Bueno',28,1500,'Estagiário');
INSERT INTO empregado VALUES (6,'Edson','Arantes',60,7500,'Gerente');
INSERT INTO empregado VALUES (7,'Odete','Roitman',54,2000,'Técnico em Segurança');
INSERT INTO empregado VALUES (8,'Antonio','Da Lua',38,2500,'Analista de Sistemas');
INSERT INTO empregado VALUES (9,'Sassa','Mutema',55,3000,'Vendedor');
INSERT INTO empregado VALUES (10,'José','Silvério',42,2800,'Vendedor');
INSERT INTO empregado VALUES (11,'Gabriel','Oliveira',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (12,'Flávia','Camargo',29,4200,'Analista de Sistemas');
INSERT INTO empregado VALUES (13,'Marina','Delbonis',20,1000,'Secretária');
INSERT INTO empregado VALUES (14,'Paulo','Roberto',33,1500,'Vendedor');
INSERT INTO empregado VALUES (15,'José','Carlos da Silva',27,2900,'Analista de Sistemas');
INSERT INTO empregado VALUES (16,'Rúbia','Miranda',29,3500,'Administrador');
INSERT INTO empregado VALUES (17,'Roberto','Andrade Silva',35,3300,'Vendedor');
INSERT INTO empregado VALUES (18,'Ana','Julia',31,2900,'Secretária');
INSERT INTO empregado VALUES (19,'Pedro','Antonio',41,3500,'Administrador');
INSERT INTO empregado VALUES (20,'Ana','Mara',22,2200,'Psicóloga');
INSERT INTO empregado VALUES (21,'João','Augusto',44,5500,'Gerente');

select * from empregado;



create table curso (idCurso integer PRIMARY KEY, nomeCurso character varying (30) NOT NULL, nroSemestres integer NOt NULL, dtaFundacao date);
-- drop table curso
--SELECT * FROM curso;

create table aluno(prontuario character varying (20) Primary key, pnome character varying (15) NOT NULL, snome character varying(30) not null, dtaNasc date, sexo char (1));
--DROP TABLE aluno
-- Adicionando chave estrangeira
ALTER TABLE aluno ADD column idCurso integer references curso (idCurso)ON DELETE CASCADE ON UPDATE CASCADE;

--SELECT * FROM aluno;


-- populando a tabela curso

INSERT INTO curso values (1, 'Ciência da Computação', 8, '01/03/1986');
INSERT INTO curso values (2, 'Direito', 8, '14/12/1975');
INSERT INTO curso values (3, 'Medicina', 12, '05/07/2000');
INSERT INTO curso values (4, 'Engenharia Elétrica', 10, '10/12/1996');
INSERT INTO curso values (5, 'Biologia', 8, '06/06/1993');
INSERT INTO curso values (6, 'Matemática', 8, '01/07/1968');

-- populando a tabela aluno

INSERT INTO aluno values ('11aa', 'Paulo', 'Henrique', '01/07/1986','M',1);
INSERT INTO aluno values ('11bb', 'Ana', 'Paula Siqueira', '08/07/1990','F',5);
INSERT INTO aluno values ('11cc', 'Júlio', 'Cesar', '08/05/1980','M',3);
INSERT INTO aluno values ('11dd', 'Carlos', 'Augusto', '10/11/1983','M',2);
INSERT INTO aluno values ('11ee', 'Gabriele', 'Antunes', '08/05/1990','F',3);
INSERT INTO aluno values ('11ff', 'Antônio', 'Fagundes', '15/06/1955','M',4);
INSERT INTO aluno values ('11gg', 'Ana', 'Paula Arósio', '08/12/1975','F',5);
INSERT INTO aluno values ('11hh', 'Mara', 'Maravilha', '07/07/1970','F',1);
INSERT INTO aluno values ('11ii', 'Roberto', 'Carlos', '01/07/1956','M',3);
INSERT INTO aluno values ('11jj', 'Carmen', 'Miranda', '03/02/1950','F',2);
INSERT INTO aluno values ('11kk', 'Rubens', 'Cardoso', '09/11/1974','M',4);
INSERT INTO aluno values ('11ll', 'Joana', 'de Assis', '07/04/1982','F',1);
INSERT INTO aluno values ('11mm', 'Paola', 'de Oliveira', '06/03/1985','F',6);
INSERT INTO aluno values ('11nn', 'Joaquim', 'Silva', '25/10/1968','M',6);
INSERT INTO aluno values ('11oo', 'Padre', 'Irlandês', '30/10/1960','M',5);
INSERT INTO aluno values ('11pp', 'Angelina', 'Jolie', '20/03/1978','F',4);
INSERT INTO aluno values ('11qq', 'Derci', 'Golçalves', '02/04/1920','F',3);
INSERT INTO aluno values ('11rr', 'Túlio', 'Maravilha', '30/08/1972','M',3);
INSERT INTO aluno values ('11ss', 'Carla', 'Ribeiro', '08/03/1988','F',2);
INSERT INTO aluno values ('11tt', 'Olivia', 'Palito', '18/09/1977','F',1);
INSERT INTO aluno values ('11uu', 'Marinheiro', 'Popeye', '21/02/1968','M',2);
INSERT INTO aluno values ('11vv', 'Alberto', 'Roberto', '15/03/1955','M',4);
INSERT INTO aluno values ('11ww', 'Julia', 'Roberts', '07/05/1972','F',5);
INSERT INTO aluno values ('11xx', 'Thais', 'Ferçosa', '16/04/1983','F',6);
INSERT INTO aluno values ('11yy', 'Barack', 'Obama', '18/09/1956','M',1);
INSERT INTO aluno values ('11zz', 'Osama', 'Bin Laden', '13/12/1960','M',1);
INSERT INTO aluno values ('22aa', 'Paula', 'Fernandes', '03/03/1983','F',2);
INSERT INTO aluno values ('22bb', 'Lara', 'Rodrigues', '10/10/1991','F',2);
INSERT INTO aluno values ('22cc', 'Mariana', 'Ximenes', '07/08/1982','F',3);
INSERT INTO aluno values ('22dd', 'Marcos', 'Paulo', '18/06/1975','M',4);
INSERT INTO aluno values ('22ee', 'Beatriz', 'Seagal', '15/12/1965','F',4);
INSERT INTO aluno values ('22ff', 'Luciano', 'Huck', '04/06/1978','M',5);
INSERT INTO aluno values ('22gg', 'Marcelo', 'Taz', '06/04/1972','M',6);
INSERT INTO aluno values ('22hh', 'Sabrina', 'Sato', '08/11/1982','F',6);
INSERT INTO aluno values ('22ii', 'Vovó', 'Mafalda', '04/11/1950','F',5);
INSERT INTO aluno values ('22jj', 'Joana', 'Darc', '07/07/1955','F',3);
INSERT INTO aluno values ('22ll', 'Henrique', 'VIII', '15/03/1942','M',1);
INSERT INTO aluno values ('22kk', 'Charles', 'Chapilin', '03/11/1926','M',2);
INSERT INTO aluno values ('22mm', 'Frodo', 'Baggins', '08/12/1975','M',3);
INSERT INTO aluno values ('22nn', 'Lady', 'Gaga', '23/07/1985','F',4);
INSERT INTO aluno values ('22oo', 'Katherina', 'Zeta Jones', '07/12/1977','F',5);
INSERT INTO aluno values ('22pp', 'Katherina', 'Zeta Jones', '07/12/1977','F',4);


-- tabela professor
CREATE table professor(prontuario integer primary key, pnome character varying(20) NOT NULL, snome character varying(30) NOT NULL, dtaNasc date);
--DROP TABLE professor


-- populando tabela professor
INSERT INTO professor values (1,'Rafael','Miani','11/01/1984');
INSERT INTO professor values (2,'Pedro','Antonio','15/07/1980');
INSERT INTO professor values (3,'Natal','Henrique','22/12/1981');
INSERT INTO professor values (4,'Carla','Joana','30/10/1972');
INSERT INTO professor values (5,'Raquel','Silva','03/04/1980');
INSERT INTO professor values (6,'Ana','Carla','07/08/1978');
INSERT INTO professor values (7,'Roberto','Silva','13/07/1960');
INSERT INTO professor values (8,'Mariana','Cunha','18/05/1982');
INSERT INTO professor values (9,'Sebastião','Roberto','15/03/1980');
INSERT INTO professor values (10,'Mauro','Augusto','21/03/1978');


-- tabela professorLecionaAluno
create table professorLecionaAluno (prontuarioAluno character varying(20) NOT NULL references aluno (prontuario) ON DELETE CASCADE ON UPDATE CASCADE,
		prontuarioProfessor integer NOT NULL references professor (prontuario) ON DELETE CASCADE ON UPDATE CASCADE,
		 ano integer not null, semestre integer not null, nota real, PRIMARY KEY (prontuarioAluno,prontuarioProfessor,ano,semestre));
		 
-- drop table professorLecionaAluno
--ALTER TABLE professorLecionaAluno ADD column nota real;

-- populando tabela professorLecionaAluno
INSERT INTO professorLecionaAluno VALUES ('11aa',1,2009,2,8.5);
INSERT INTO professorLecionaAluno VALUES ('11aa',3,2011,1,7);
INSERT INTO professorLecionaAluno VALUES ('11bb',4,2008,2,6.5);
INSERT INTO professorLecionaAluno VALUES ('11cc',1,2010,1,9);
INSERT INTO professorLecionaAluno VALUES ('11dd',5,2009,1,4.5);
INSERT INTO professorLecionaAluno VALUES ('11ee',4,2008,2,7.5);
INSERT INTO professorLecionaAluno VALUES ('11ff',3,2011,2,9.5);
INSERT INTO professorLecionaAluno VALUES ('11bb',6,2010,1,5.5);
INSERT INTO professorLecionaAluno VALUES ('11cc',9,2009,1,6);
INSERT INTO professorLecionaAluno VALUES ('11gg',7,2009,2,8);
INSERT INTO professorLecionaAluno VALUES ('11bb',5,2010,1,7.5);

SELECT * FROM ALUNO;
SELECT * FROM CURSO;