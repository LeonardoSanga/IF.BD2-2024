CREATE TABLE FILME 
	(
	codigo_filme SERIAL,
	nome VARCHAR (30),
	genero VARCHAR (30),
	produtora VARCHAR (30),
	diretor VARCHAR (30),
	classficacao_indicativa INTEGER,
	disponivel BOOLEAN,
	CONSTRAINT pk_filme PRIMARY KEY (codigo_filme)
	);

CREATE TABLE CLIENTE
	(
	codigo_cliente SERIAL,
	nome VARCHAR (50),
	idade INTEGER,
	CONSTRAINT pk_cliente PRIMARY KEY (codigo_cliente)
	);

CREATE TABLE ClienteAlugaFilme
	(
	codigo_filme INTEGER,
	codigo_cliente INTEGER,
	data_aluga DATE,
	data_devolve DATE,
	CONSTRAINT pk_ClienteAlugaFilme PRIMARY KEY (codigo_filme, codigo_cliente),
	CONSTRAINT fk_filme FOREIGN KEY (codigo_filme) REFERENCES FILME,
	CONSTRAINT fk_cliente FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE
	);

--DROP TABLE FILME CASCADE;
--DROP TABLE CLIENTE CASCADE;
--DROP TABLE CLIENTEALUGAFILME CASCADE;

--BEGIN;
--SET CONSTRAINTS ALL DEFERRED;

-- Deleta todos os registros da tabela
--DELETE FROM FILME CASCADE;
--DELETE FROM CLIENTE CASCADE;
--DELETE FROM CLIENTEALUGAFILME CASCADE;

-- Finaliza a transação, reativando as restrições
--COMMIT;


SELECT * FROM FILME;
SELECT * FROM CLIENTE;
SELECT * FROM clienteAlugaFilme;

--DELETE FROM FILME;

SELECT f.nome, c.nome FROM ClienteAlugaFilme caf
INNER JOIN Filme f
ON caf.codigo_filme = f.codigo_filme
  INNER JOIN Cliente c
            ON caf.codigo_cliente = c.codigo_cliente
