SELECT f.nomeFunc, v.dtaVenda FROM FUNCIONARIO f
	INNER JOIN VENDAS v
	ON f.codFunc = v.codFunc
	WHERE v.dtaVenda != 'Novembro';

SELECT c.nome, v.totalVenda, p.nomeProd FROM CLIENTE c
	INNER JOIN VENDAS v
	ON c.codCliente = v.codCliente
	INNER JOIN produtosVenda pv
	on v.codVenda = pv.codVenda
	INNER JOIN PRODUTO p
	ON pv.codProd = p.codProd;

SELECT c.nome, v.totalVenda FROM CLIENTE c
	INNER JOIN VENDAS v
	ON c.codCliente = v.codCliente
	WHERE v.totalVenda = (SELECT max(totalVenda) FROM VENDAS);

SELECT p.marca, sum(pv.quantidade) FROM PRODUTO p
	INNER JOIN produtosVenda pv
	ON p.codProd = pv.codProd
	GROUP BY p.marca;

SELECT p.marca, sum(pv.quantidade) FROM PRODUTO p
	INNER JOIN produtosVenda pv
	ON p.codProd = pv.codProd
	INNER JOIN VENDAS v
	ON pv.codVenda = v.codVenda
	WHERE p.preco > 1000 AND YEAR(v.dtaVenda) = '2024'
	GROUP BY p.marca
	ORDER BY sum(pv.quantidade);