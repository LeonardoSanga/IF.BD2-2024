-- Exercícios

UPDATE cidadesBrasil
	SET populacao = 900000
	WHERE nomeCidade =  'Campo Grande';

UPDATE cidadesBrasil
	SET idhm = 0.81
	WHERE nomeCidade = 'Palmas';

UPDATE cidadesBrasil
	SET idhm = 0.77, escolarizacao = 0.96
	WHERE nomeCidade = 'Salvador';

DELETE FROM cidadesBrasil
	WHERE idhm < 0.6;

DELETE FROM cidadesBrasil
	WHERE populacao < 20000;

DELETE FROM cidadesBrasil
	WHERE idhm < 0.7 AND regiao = 'Sudeste';
-- Não há nenhuma cidade do sudeste com idhm menor do que 0.7 na tabela cidadesBrasil

SELECT * FROM cidadesBrasil;



-- Scripts utilizados:
--tabela CURSO
CREATE TABLE CURSO
	(idCurso INTEGER,
	nomeCurso VARCHAR (30),
	nroSemestres INTEGER,
	dtaFundacao DATE,
	CONSTRAINT pk_curso PRIMARY KEY (idCurso)
	);

--tabela ALUNO
CREATE TABLE ALUNO
	(prontuario VARCHAR (30),
	nomeAluno VARCHAR (30),
	dataNasc DATE,
	sexo CHAR (1),
	idCurso INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (idCurso) REFERENCES CURSO ON UPDATE CASCADE
	);

--inserindo dados na tabela CURSO
INSERT INTO CURSO (idCurso, nomeCurso, nroSemestres, dtaFundacao)
	VALUES (1, 'Ciência da Computação', 8, '01/03/1986'),
			(2, 'Direito', 8, '14/12/1975'),
			(3, 'Medicina', 12, '05/07/2000'),
			(4, 'Engenharia Elétrica', 10, '10/12/1996'),
			(5, 'Biologia', 8, '06/06/1993'),
			(6, 'Matemática', 8, '01/07/1968');

--inserindo dados na tabela ALUNO
INSERT INTO ALUNO (prontuario, nomeAluno, dataNasc, sexo, idCurso)
	VALUES ('llaa', 'Paulo', '01/07/1986', 'M', 1),
			('llbb', 'Ana', '08/07/1990', 'F', 5),
			('llcc', 'Júlio', '08/05/1980', 'M', 3 ),
			('lldd', 'Carlos', '10/11/1983', 'M', 2 ),
			('llee', 'Gabriele', '08/05/1990', 'F', 3 ),
			('llff', 'Antônio', '15/06/1955', 'M', 4 ),
			('llgg', 'Ana', '08/12/1975', 'F', 5 ),
			('llhh', 'Mara', '07/07/1970', 'F', 1 ),
			('llii', 'Roberto', '01/07/1956', 'M', 3 ),
			('lljj', 'Carmem', '03/02/1950', 'F', 2 );

--inserindo Pedro Roberto
INSERT INTO ALUNO (prontuario, nomeAluno, dataNasc, sexo, idCurso)
	VALUES ('llkk', 'Pedro Roberto', '11/01/2000', 'M', 3 );

--DELETE
DELETE FROM CURSO
	WHERE idCurso = 2; -- Não é possível excluir - violação de chave estrangeira (fk_aluno_curso)

DELETE FROM ALUNO
	WHERE idCurso = 2;

DELETE FROM CURSO
	WHERE idCurso = 2; -- Agora é possível excluir o curso de Direito

--UPDATE
UPDATE CURSO SET idCurso = 10
	WHERE idCurso = 3; -- Não é possível fazer essa atualização, já que o idCurso de medicina (3)
--é referênciado pela tabela ALUNO. Essa operação viola a restrição de chave estrangeira (fk_aluno_curso)

UPDATE ALUNO SET nomeAluno = 'Ana Paula'
	WHERE prontuario = 'llgg';


SELECT * FROM CURSO;
SELECT * FROM ALUNO;



--cidadesBrasil.sql
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