-- 1. Faça uma consulta que retorne a sigla do partido e a quantidade de deputados que cada partido possui.
SELECT p.siglaPartido, count(d.idDeputado) FROM PARTIDO p
	INNER JOIN DEPUTADO d
	ON p.idPartido = d.idPartido
	GROUP BY p.siglaPartido;

-- 2. Utilizando subconsultas, faça uma consulta que retorne o nome dos deputados que não participaram de nenhuma seção.
SELECT d.nomeDeputado FROM DEPUTADO d
	WHERE d.idDeputado NOT IN (SELECT idDeputado FROM PARTICIPACAO);

-- 3. Repita o exercício 2 usando LEFT ou RIGHT JOIN
SELECT d.nomeDeputado FROM DEPUTADO d
	LEFT JOIN PARTICIPACAO p
	ON d.idDeputado = p.idDeputado
	WHERE p.idDeputado IS NULL;

-- 5. Faça uma subconsulta que retorne todos os autores que escreveram algum livro de romance.
SELECT a.nome_autor FROM AUTOR a
	INNER JOIN livro_autor la
	ON a.nome_autor = la.nome_autor
	WHERE la.cod_livro IN (SELECT cod_livro FROM LIVRO
								WHERE genero = 'Romance');

-- 6. Faça uma consulta que verifique todos os livros que o autor escreveu e, caso não tenha escrito, apareça NULL para o campo cod_livro. Deve ser retornado o nome do autor e o código do livro.
SELECT a.nome_autor, la.cod_livro FROM AUTOR a
	LEFT JOIN livro_autor la
	ON a.nome_autor = la.nome_autor;

-- 7. Selecione o nome de todos os clientes, dos filmes que já alugaram e dos atores que estavam naquele filme. (unir FILME com clienteAlugaExemplar direto, sem passar pela exemplar)
SELECT c.nome, f.nome, a.nome FROM CLIENTE c
	INNER JOIN clienteAlugaExemplarFilme caef
	ON c.codCliente = caef.codCliente
	INNER JOIN FILME f
	ON caef.codFilme = f.codFilme
	INNER JOIN atorEstrelaFilme aef
	ON f.codFilme = aef.codFilme
	INNER JOIN ATOR a
	ON aef.idAtor = a.idAtor
	ORDER BY c.nome;

-- 8. Utilizando subconsultas, selecione o nome dos atores que fizeram algum filme de Ação e de Drama (usar duas subconsultas e separar cada uma com o AND, Exemplo dos barcos da cor Marrom e Azul)
SELECT a.nome FROM ATOR a
	WHERE a.idAtor IN (SELECT a.idAtor FROM ATOR a
							INNER JOIN atorEstrelaFilme aef
							ON a.idAtor = aef.idAtor
							INNER JOIN FILME f
							ON aef.codFilme = f.codFilme
							WHERE f.genero = 'Ação')
		AND a.idAtor IN (SELECT a.idAtor FROM ATOR a
							INNER JOIN atorEstrelaFilme aef
							ON a.idAtor = aef.idAtor
							INNER JOIN FILME f
							ON aef.codFilme = f.codFilme
							WHERE f.genero = 'Drama');

-- 9. Faça uma consulta que retorne o gênero e a quantidade de alugueis de cada gênero. Ordene em ordem decrescente
SELECT f.genero, count(caef.codFilme) FROM FILME f
	INNER JOIN clienteAlugaExemplarFilme caef
	ON f.codFilme = caef.codFilme
	GROUP BY f.genero
	ORDER BY count(caef.codFilme) DESC;


-- 1
begin;
-- 3
UPDATE CURSO SET nomeCurso = 'Licenciatura em Biologia' WHERE idCurso = 5;
SELECT * FROM CURSO;
-- 4
commit;

-- 2
begin;
-- 5
UPDATE CURSO SET nroSemestres = 10 WHERE nomeCurso = 'Licenciatura em Biologia';
SELECT * FROM CURSO;
-- 6
commit;