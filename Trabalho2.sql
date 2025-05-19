-- 1 
SELECT inq.nome AS "Inquilino", cor.nome AS "Corretor", imo.tipoImovel, alu.dataIniLocacao FROM INQUILINO inq
	INNER JOIN ALUGUEL alu
	ON inq.cpf = alu.cpfInquilino
	INNER JOIN CORRETOR cor
	ON cor.creci = alu.creciCorretor
	INNER JOIN IMOVEL imo
	ON imo.idImovel = alu.idImovel
	ORDER BY alu.dataIniLocacao;

-- 2
SELECT inq.nome, alu.dataIniLocacao FROM INQUILINO inq
	INNER JOIN ALUGUEL alu
	ON inq.cpf = alu.cpfInquilino
	WHERE alu.dataIniLocacao =
		(SELECT max(dataIniLocacao) FROM ALUGUEL); 

-- 3
SELECT nome FROM INQUILINO
	INNER JOIN ALUGUEL
	ON cpf = cpfInquilino
	WHERE nome IN
		(SELECT nome FROM CORRETOR 
			INNER JOIN ALUGUEL
			ON creci = creciCorretor);

-- 5
SELECT nome, telefone FROM CLIENTE c
	LEFT JOIN TelefoneCliente t
	ON c.codCliente = t.codCliente
	WHERE telefone IS NULL;

-- 6
SELECT f.genero, count(caef.codFilme) AS "qtd. filmes alugados" FROM filme f
	INNER JOIN clienteAlugaExemplarFilme caef
	ON f.codFilme = caef.codFilme
	GROUP BY f.genero;

-- 7
SELECT DISTINCT a.nome FROM ATOR a
	INNER JOIN atorEstrelaFilme aef
	ON a.idAtor = aef.idAtor
	INNER JOIN FILME f
	ON aef.codFilme = f.codFilme
	WHERE f.genero IN 
		(SELECT genero FROM FILME 
			WHERE genero = 'Drama' OR genero = 'Ação');

