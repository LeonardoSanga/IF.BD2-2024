-- Exercício 1:
SELECT v.nome_vendedor, count(p.codigo_vendedor) FROM vendedor v
	LEFT OUTER JOIN pedido p
	ON v.codigo_vendedor = p.codigo_vendedor
	GROUP BY v.nome_vendedor;

SELECT v.nome_vendedor, p.prazo_entrega FROM vendedor v
	LEFT OUTER JOIN pedido p
	ON v.codigo_vendedor = p.codigo_vendedor;

-- Exercício 2:
SELECT m.nome_marin, r.data_res FROM marinheiros m
	LEFT OUTER JOIN reservas r
	ON m.id_marin = r.id_marin
	WHERE r.data_res IS NULL;

-- Exercício 3:
SELECT b.nome_barco, r.data_res FROM reservas r
	RIGHT OUTER JOIN barcos b
	ON b.id_barco = r.id_barco
	WHERE r.data_res IS NULL;

-- Exercício 4:
CREATE TABLE departamento (
		id_departamento INTEGER,
		nome_departamento VARCHAR (255) NOT NULL,
		CONSTRAINT PK_DEP  PRIMARY  KEY  (id_departamento)
	);

CREATE TABLE empregado (
		id_empregado INTEGER,
		nome_empregado VARCHAR (255),
		id_departamento INTEGER,
        CONSTRAINT PK_EMP  PRIMARY  KEY  (id_empregado),
        CONSTRAINT FK_EMP_DEP FOREIGN KEY (ID_DEPARTAMENTO) references departamento
	);

-- Exercício 5:
INSERT INTO departamento VALUES (1, 'Sales'),
								(2, 'Marketing'),
								(3, 'HR'),
								(4, 'IT'),
								(5, 'Production');

INSERT INTO empregado VALUES (1, 'Bette Nicholson', 1),
							 (2, 'Christian Gable', 1),
							 (3, 'Joe Swank', 2),
							 (4, 'Fred Costner', 3),
							 (5, 'Sandra Kilmer', 4),
							 (6, 'Julia Mcqueen', null);  

SELECT * FROM departamento;
SELECT * FROM empregado;

-- Exercício 6:
SELECT d.nome_departamento FROM departamento d
	LEFT OUTER JOIN empregado e
	ON d.id_departamento = e.id_departamento
	WHERE e.nome_empregado IS NULL;

-- Exercício 7:
SELECT e.nome_empregado, d.nome_departamento FROM empregado e
	LEFT OUTER JOIN departamento d
	ON e.id_departamento = d.id_departamento
	WHERE d.nome_departamento IS NULL;

-- Exercício 8:
SELECT d.nome_departamento, e.nome_empregado FROM departamento d
	FULL OUTER JOIN empregado e
	ON e.id_departamento = d.id_departamento
	WHERE d.nome_departamento IS NULL OR e.nome_empregado IS NULL;

