Create table Curso (
	idCurso integer NOT NULL,
	nomeCurso varchar(30) NOT NULL,
	nroSemestres INTEGER,
	dtaFundacao date,
	constraint pk_idCurso primary key (idCurso)
	);

insert INTO CURSO VALUES (1, 'Ciência da Computação', 8, '11/01/1970');
insert INTO CURSO VALUES (2, 'Biologia', 8, '11/01/1980');
insert INTO CURSO VALUES (3, 'ADS', 6, '11/01/2013');

--4 a)
-- Usuário A
begin;
UPDATE Curso SET nomeCurso = 'Sistemas de Informação' WHERE idCurso = 1;
commit;

-- Usuário B
begin;
UPDATE Curso SET nroSemestres = 10 WHERE nomeCurso = 'Sistemas de Informação';
commit;

--4 b)
-- Usuário A
begin;
INSERT INTO Curso VALUES (4, 'Medicina', 10, '11/01/2024');
rollback;

-- Usuário B
begin;
SELECT * FROM Curso;
UPDATE Curso SET nroSemestres = 8 WHERE idCurso = 4;
commit;

-- Nesse caso, o usuário B veria o curso Medicina e faria uma alteração nela, no entanto, o curso de Medicina 
--não estaria presente na tabela, uma vez que o usuário A rodou o comando rollback
