CREATE DATABASE DB_2ANO;
USE DB_2ANO;



CREATE TABLE tbCLIENTE(
idCLI INT PRIMARY KEY IDENTITY(1,1),
Endereco VARCHAR(255),
NomeCLI VARCHAR(255),
UF CHAR(2),
Cidade VARCHAR(255),
TelCLI NUMERIC(8,0),
CelCLI NUMERIC(9,0));

CREATE TABLE tbNOTAFISCAL(
NotaFiscal INT PRIMARY KEY IDENTITY(1,1),
DataNota DATE,
TotalNota DECIMAL(8,2) NOT NULL,
idCLI INT REFERENCES tbCLIENTE(idCLI),
idFUNC INT REFERENCES tbFUNCIONARIO(idFUNC));

CREATE TABLE tbFUNCIONARIO(
idFUNC INT PRIMARY KEY IDENTITY(1,1),
TelFUNC NUMERIC(8,0),
NomeFUNC VARCHAR(255),
Endereco VARCHAR(255));

SELECT * FROM tbCLIENTE;
SELECT * FROM tbFUNCIONARIO;
SELECT * FROM tbNOTAFISCAL;



INSERT INTO tbCLIENTE(Endereco, NomeCLI, UF, Cidade, TelCLI, CelCLI)
VALUES('Rua Estou Mal, 33', 'Fulano', 'SP', 'São Paulo', 99998888, 888889999),
	  ('Rua Estou Ferrado, 23', 'Beltrano', 'SP', 'São Paulo', 79998888, 788889999),
	  ('Rua Estou Mal, 33', 'Fulana', 'SP', 'São Paulo', 59998888, 588889999);

INSERT INTO tbFUNCIONARIO(TelFUNC, NomeFUNC, Endereco)
VALUES(78787878, 'Já Era', 'Av. Não Esquecer de Tabular, 44'),
	  (58787878, 'Já Fui', 'Av. Não Esquecer do Usuário, 44'),
	  (98787878, 'Já Dancei', 'Av. Não Esquecer de Utilizar o Join, 84');

INSERT INTO tbNOTAFISCAL(DataNota, TotalNota, idCLI, idFUNC)
VALUES('2016-10-02', 450.88, 1, 3),
	  ('2016-10-12', 650.88, 3, 3),
	  ('2016-10-22', 330.88, 2, 3),
	  ('2016-10-22', 1450.88, 3, 2),
	  ('2016-10-15', 750.88, 1, 2),
	  ('2016-10-13', 990.88, 2, 2),
	  ('2016-10-07', 600, 1, 2),
	  ('2016-10-02', 400, 2, 2),
	  ('2016-10-02', 850, 2, 3),
	  ('2016-10-13', 120, 2, 3),
	  ('2016-10-19', 548, 1, 3),
	  ('2016-10-18', 100, 3, 3),
	  ('2016-10-17', 780, 3, 1),
	  ('2016-10-24', 378, 3, 1),
	  ('2016-10-08', 201, 1, 3),
	  ('2016-10-06', 199, 1, 1);

SELECT * FROM tbCLIENTE;
SELECT * FROM tbFUNCIONARIO;
SELECT * FROM tbNOTAFISCAL;



--  Exercício 1  --
SELECT TOP 1 NomeCLI, Cidade, UF, TelCLI, CelCLI, NomeFUNC, NotaFiscal, TotalNota, DataNota
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
WHERE tbCLIENTE.idCli = 2
ORDER BY DataNota DESC;

--  Exercício 2  --
SELECT NomeCLI
FROM tbCLIENTE
WHERE NomeCLI LIKE '%Fu%'; -- LIKE: ao usar o LIKE eu não preciso digitar o nome inteiro, e a porcentagem significa que tem algo depois ou antes do nome que eu dei

--  Exercício 3  --
SELECT NotaFiscal, TotalNota, DataNota
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
WHERE NomeCLI = 'Fulano'
ORDER BY DataNota DESC;

--  Exercício 4  --
SELECT TOP 1 NomeCLI, Cidade, UF, TelCLI, CelCLI, NomeFUNC, NotaFiscal, TotalNota, DataNota
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
WHERE NomeCLI = 'Fulana'
ORDER BY DataNota DESC;

--  Exercício 5  --
SELECT NotaFiscal, TotalNota, DataNota
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI)
WHERE tbCLIENTE.idCLI = 1
ORDER BY DataNota DESC;

--  Exercício 6  --
SELECT NomeFUNC, NomeCLI, COUNT(NotaFiscal) AS [Quantidade de Vendas]
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
GROUP BY NomeFUNC, NomeCLI;

--  Exercício 7  --
SELECT NomeCLI, SUM(TotalNota) AS [Valor]
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
GROUP BY NomeCLI;

--  Exercício 8  --
SELECT TOP 1 NomeFUNC, MAX(TotalNota) AS [Valor]
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
GROUP BY NomeFUNC, TotalNota
ORDER BY TotalNota DESC;

--  Exercício 9  --
SELECT tbFUNCIONARIO.idFUNC, NomeFUNC, UF, COUNT(NotaFiscal) AS [Quantidade de Vendas]
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
GROUP BY tbFUNCIONARIO.idFUNC, NomeFUNC, UF;

--  Exercício 10  --
SELECT TOP 1 NotaFiscal, DataNota, TotalNota, tbFUNCIONARIO.idFUNC
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
GROUP BY NotaFiscal, DataNota, TotalNota, tbFUNCIONARIO.idFUNC
ORDER BY DataNota DESC;



--  Exemplo 1  --
--  Junção de produto cartesiano - É a junção entre duas tabelas que origina uma "terceira tabela"	constituida por todos os elementos da primeira combinadas com todos os elementos da segunda.
	SELECT NomeCLI, NotaFiscal, TotalNota
	FROM tbCLIENTE, tbNOTAFISCAL
	WHERE tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI;

--  Exemplo 2  --
--  Junção interna - Funciona de forma semalhante à junção de produto cartesiano. Porém, utiliza uma sintaxe diferente.
	SELECT NomeCLI, NotaFiscal, TotalNota
	FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI);

--  Exemplo 3  --
--  IN - Usado junto ao WHERE e pega dados de uma condição exata
	SELECT * FROM tbCLIENTE
	WHERE idCLI IN (1, 2, 3);

--  Exemplo 4  --
--  BETWEEN - Usado para pegar entre um intevalo de dados
	SELECT * FROM tbNOTAFISCAL
	WHERE DataNota BETWEEN '2016-10-10' AND '2016-10-20';



-- Faça uma consulta que mostre o NOME DO CLIENTE e QUANTOS CARACTERES cada nome possui
-- Resposta:
	SELECT NomeCLI, LEN(NomeCLI) AS [Quantidade de Caracteres]
	FROM tbCLIENTE;

-- Faça uma consulta que mostre o ENDEREÇO e QUANTOS CARACTERES cada um possui
-- Resposta:
	SELECT Endereco, LEN(Endereco) AS [Quantidade de Caracteres]
	FROM tbCLIENTE;

-- Faça uma consulta que mostre TOTAL DE CARACTERES da coluna endereço
-- Resposta:
	SELECT SUM(LEN(Endereco)) AS [Quantidade de Caracteres]
	FROM tbCLIENTE;

-- Faça uma consulta que mostre o NOME DO CLIENTE junto ao NOME DO FUNCIONARIO pelo qual ele ja foi atendido
-- Resposta:
	SELECT RTRIM(NomeCLI) + ',' + SPACE(2) +  LTRIM(NomeFUNC)
	FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON (tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON (tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
	GROUP BY NomeCLI, NomeFUNC;

-- Faça uma consulta que mostre o CODIGO DA NOTA junto ao TOTAL
-- Resposta:
	SELECT RTRIM(NotaFiscal) + ',' + SPACE(2) +  LTRIM(TotalNota)
	FROM tbNOTAFISCAL
	GROUP BY NotaFiscal, TotalNota;

-- Faça uma consulta que mostre o NOME DO CLIENTE, NOME DO FUNCIONARIO, TOTAL DA NOTA, DATA DA NOTA no qual estejam todos juntos
-- Resposta: 
	SELECT RTRIM(NomeCLI) + ',' + SPACE(2) +  LTRIM(NomeFUNC) + ',' + SPACE(2) +  LTRIM(TotalNota) + ',' + SPACE(2) +  LTRIM(DataNota)
	FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON (tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON (tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
	GROUP BY NomeCLI, NomeFUNC, TotalNota, DataNota;



-- Exercício 1
SELECT REPLICATE(NomeCLI, 2)
FROM tbCLIENTE;

-- Exercício 2
SELECT REPLICATE(NomeCLI + SPACE(8), 2)
FROM tbCLIENTE;

-- Exercício 3
SELECT REPLICATE(idCLI, 2)
FROM tbCLIENTE;

-- Exercício 4
SELECT idCLI, UPPER(Endereco) AS [Endereco], UPPER(NomeCLI) AS [Nome do Cliente], UF, UPPER(Cidade) AS [Cidade], TelCLI, CelCLI
FROM tbCLIENTE;

-- Exercício 5
SELECT UPPER(NomeCLI), TotalNota
FROM tbCLIENTE INNER JOIN tbNOTAFISCAL ON(tbCLIENTE.idCLI = tbNOTAFISCAL.idCLI) INNER JOIN tbFUNCIONARIO ON(tbNOTAFISCAL.idFUNC = tbFUNCIONARIO.idFUNC)
GROUP BY NomeCLI, TotalNota, DataNota
ORDER BY DataNota DESC;

-- Exercício 6
SELECT idCLI, UPPER(Endereco) AS [Endereco], NomeCLI, UF, Cidade, TelCLI, CelCLI
FROM tbCLIENTE;