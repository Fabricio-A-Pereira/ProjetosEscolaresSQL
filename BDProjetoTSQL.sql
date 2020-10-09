CREATE DATABASE BDProjetoTSQL;
USE BDProjetoTSQL;


CREATE TABLE TBCliente(
NomeCLI VARCHAR(100),
EnderecoCLI VARCHAR(100),
TelefoneCLI VARCHAR(25),
EmailCLI VARCHAR(100));


SELECT * FROM TBCliente;


ALTER TABLE TBCliente ADD DataNascimento DATETIME;
ALTER TABLE TBCliente ALTER COLUMN DataNascimento DATETIME NOT NULL;


ALTER TABLE TBCliente ADD CodigoCLI INT IDENTITY(1,1) PRIMARY KEY;


INSERT INTO TBCliente(NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento)
VALUES('Bill Gates', 'Rua da Feia, 12', '2222-3333', 'bill@hotmail.com', '28/10/1955'),
	  ('Benjamin Franklin', 'Rua Só Nós Dois, 314', '2222-3334', 'benjamin@hotmail.com', '17/01/1906'),
	  ('John Lennon', 'Rua Deus-te-aguarde, 123', '2222-3335', 'john@hotmail.com', '09/10/1940'),
	  ('Thomas Edison', 'Largo da Boa Morte, 32', '2222-3336', 'thomas@hotmail.com', '11/02/1847'),
	  ('Steve Jobs', 'Rua Capitão da Meia Noite, 55', '2222-3337', 'steve@hotmail.com', '24/02/1955');


--Exercicio 1
SELECT CodigoCLI, NomeCLI, GETDATE() AS [Data Atual]
FROM TBCliente;

--Exercicio 2
SELECT NomeCLI, (GETDATE()+30) AS [Data Atual]
FROM TBCliente
WHERE CodigoCLI = 4;

--Exercicio 3
SELECT * FROM TBcliente
WHERE CodigoCLI>1 AND DataNascimento BETWEEN '19000101' AND '19850101';

--Exercicio 4
SELECT * FROM TBcliente 
WHERE NomeCLI LIKE 'B%';


/*INSERT INTO TBcliente(NomeCLI,EnderecoCLI,TelefoneCLI,EmailCLI,DataNascimento)
VALUES ('Marcelo Silva', 'Rua da Feia, 22', '2222-3333', 'marcelosil@hotmail.com', '20001028 00:00:00 AM');
	   ('Marcela Teixeira', 'Rua Só, 14', '2222-4334', 'marcelatei@hotmail.com', '19990117 00:00:00 AM');*/


--Exercicio 1
SELECT * FROM TBcliente 
WHERE Nomecli LIKE 'Marcel[ao]%';

--Exercicio 2
SELECT TOP 2 * FROM TBcliente;


UPDATE TBcliente SET Enderecocli = 'Rua do Paraiso, 69', Telefonecli = '4444-3333' WHERE CodigoCLI=1;


ALTER TABLE TBcliente ADD Cep VARCHAR(10);


--Exercicio 1
SELECT CodigoCLI, Nomecli, Enderecocli, Telefonecli, Emailcli, DataNascimento, ISNULL(Cep,'Sem CEP') AS CEP FROM TBcliente;


UPDATE TBcliente SET Cep = '99909-303' where Codigocli=1;


DELETE TBcliente WHERE Codigocli=7;


/*INSERT INTO TBcliente(NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento) 
VALUES ('Joselito Manga', 'Rua das Minas, 33', '9191-3343', 'manga@etec.com', '19900422 00:00:00 AM');*/


TRUNCATE TABLE TBCliente;


SELECT * FROM TBCliente;


/*Tabela Temporaria
CREATE TABLE #TBCliente(
CodigoCLI INT IDENTITY(1,1) PRIMARY KEY,
NomeCLI VARCHAR(100) NULL,
EnderecoCLI VARCHAR(100) NULL,
TelefoneCLI VARCHAR(25) NULL,
EmailCLI VARCHAR(100) NULL,
DataNascimentoCLI DATETIME NOT NULL);

--Exemplo de como passar os dados da TABELA FISICA para a TABELA TEMPORARIA
SELECT * INTO #TBCliente FROM TBCliente;*/


SELECT * FROM INFORMATION_SCHEMA.TABLES;--Para mostrar as tabelas do sistema


CREATE TABLE TBProdutos(
CodPROD INT IDENTITY(1, 1) PRIMARY KEY,
DescPROD VARCHAR(150),
ValorPROD NUMERIC(18, 2),
Ativo BIT DEFAULT(1));


CREATE TABLE TBVendas(
NotaFiscal INT IDENTITY(1, 1) PRIMARY KEY,
CodigoCLI INT REFERENCES TBCliente(CodigoCLI),
CodigoPROD INT REFERENCES TBProdutos(CodPROD),
DataVenda DATETIME DEFAULT GETDATE(),
Quantidade INT,
ValorTotal NUMERIC(18, 2));


SELECT * FROM TBCliente;
SELECT * FROM TBProdutos;
SELECT * FROM TBVendas;


-- ALTER TABLE TBVendas ADD CONSTRAINT fkprodutos
-- FOREIGN KEY (CodPROD) REFERENCES TBProdutos(CodPROD);


INSERT INTO TBProdutos(DescPROD, ValorPROD)
VALUES('Ciencia da Computação', 24000),
	  ('Engenharia Mecatronica', 25000),
	  ('Engenharia da Computação', 25000),
	  ('Engenharia de Software', 24000),
	  ('Sistemas da Informação', 25000),
	  ('Tecnologia da Informação', 23000),
	  ('Fisica Computacional', 23500),
	  ('Engenharia de Sistemas', 23000),
	  ('Segurança da Informação', 22000),
	  ('Processamento de Dados', 21000);


INSERT INTO TBVendas(CodigoCLI, CodigoPROD, DataVenda, Quantidade, ValorTotal)
VALUES(6, 2, '20140101', 1, 25000),
	  (2, 6, '20140101', 1, 23000),
	  (6, 1, '20140101', 1, 24000),
	  (4, 4, '20140101', 2, 24000),
	  (4, 3, '20140601', 1, 25000),
	  (3, 7, '20140601', 2, 23500),
	  (2, 5, '20140601', 1, 25000),
	  (3, 10, '20140601', 2, 21000),
	  (2, 2, '20140601', 1, 25000),
	  (4, 5, '20140601', 1, 25000),
	  (2, 7, '20140601', 1, 23500),
	  (3, 4, '20140601', 2, 24000),
	  (4, 7, '20140601', 1, 23500);


/*INSERT INTO TBCliente(NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento)
VALUES('Gaygel', 'Rua 17, 69', '6969-2424', 'batidao@proibidao.com', '20170228');*/

/*
DELETE TBCliente WHERE CodigoCLI = 6;


TRUNCATE TABLE TBCliente;


ALTER TABLE TBVendas DROP CONSTRAINT FK__TBVendas__Codigo__15502E78;


ALTER TABLE TBVendas ADD CONSTRAINT FKTBVendas FOREIGN KEY (CodigoCLI) REFERENCES TBCliente(CodigoCLI);


SP_HELP TBVendas;
*/

INSERT INTO TBCliente(NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento)
VALUES ('Alvaro Alberto', 'Rua da Feia, 32', '2244-3333', 'alvaro@hotmail.com', '19050101'),
	   ('Candido Lima da Silva Dias', 'Rua Só Nós Dois, 334', '4222-3334', 'candido@hotmail.com', '19050101'),
	   ('Cesar lattes', 'Rua Deus-Te-Guarde, 523', '2552-3335', 'lattes@hotmail.com', '19050101'),
	   ('Simão Mathias', 'Largo da Boa Morte, 432', '3322-3336', 'simao@hotmail.com', '19050101'),
	   ('Ricardo Ferrira', 'Rua Capitão da Meia-Noite, 335', '3322-3337', 'ferreira@hotmail.com', '19050101');


SELECT * FROM TBCliente;
SELECT * FROM TBProdutos;
SELECT * FROM TBVendas;


SELECT *, (ValorTotal * Quantidade) AS [Total da Nota]
FROM TBVendas;


SP_RENAME 'TBVendas.ValorTotal', 'Valor';


SELECT NomeCLI, DataVenda
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI);


SELECT NomeCLI, DataVenda
FROM TBCliente LEFT JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI);


SELECT DescPROD, DataVenda
FROM TBVendas RIGHT JOIN TBProdutos ON(TBVendas.CodigoPROD = TBProdutos.CodPROD);


SELECT CodPROD, DescPROD,
CASE
	WHEN ValorPROD BETWEEN 20000 AND 22000 THEN 'Nivel 1'
	WHEN ValorPROD BETWEEN 22001 AND 24000 THEN 'Nivel 2'
	WHEN ValorPROD BETWEEN 24001 AND 25000 THEN 'Nivel 3'
ELSE
	'Não Classificado'
END AS [Tipo Produto]
FROM TBProdutos;


SELECT CodigoCLI
FROM TBVendas
GROUP BY CodigoCLI;


SELECT NomeCLI, DataVenda, COUNT(TBCliente.CodigoCLI) AS [Total de Notas]
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI)
GROUP BY NomeCLI, DataVenda;


SELECT NomeCLI, DataVenda, SUM(ValorTotal) AS [Total de Notas]
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI)
GROUP BY NomeCLI, DataVenda;


SELECT NomeCLI, DescPROD, ValorTotal AS [Total da Nota], ValorPROD AS [Valor do Produto], (ValorTotal - ValorPROD) AS [Desconto]
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI) INNER JOIN TBProdutos ON(TBVendas.CodigoPROD = TBProdutos.CodPROD)
ORDER BY NomeCLI;


SELECT NomeCLI, DataVenda, SUM(Quantidade) AS [Quantidade], SUM(ValorTotal * Quantidade) AS [Valor de Notas]
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI)
GROUP BY NomeCLI, DataVenda;


SELECT NomeCLI, DataVenda, SUM(Quantidade) AS [Quantidade], SUM(ValorTotal * Quantidade) AS [Valor de Notas], CAST(AVG(ValorTotal * Quantidade) AS DECIMAL(18, 2)) AS [Média das Notas]
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI)
GROUP BY NomeCLI, DataVenda;


SELECT NomeCLI, DataVenda, SUM(Quantidade) AS [Quantidade], SUM(ValorTotal * Quantidade) AS [Valor de Notas], CAST(AVG(ValorTotal * Quantidade) AS DECIMAL(18, 2)) AS [Média das Notas]
FROM TBCliente INNER JOIN TBVendas ON(TBCliente.CodigoCLI = TBVendas.CodigoCLI)
GROUP BY NomeCLI, DataVenda
HAVING AVG(ValorTotal * Quantidade) > 30000;


/*
CREATE VIEW VWClienteContato AS
SELECT NomeCLI, TelefoneCLI, EmailCLI
FROM TBCliente;


SELECT * FROM VWClienteContato;
*/



CREATE TABLE TBProdutoHistorico(
CodPROD INT,
DescPROD VARCHAR(150),
ValorPROD NUMERIC(18, 2),
Ativo BIT DEFAULT(1),
DataAlteracao DATETIME DEFAULT GETDATE(),
TipoAlteracao VARCHAR(100));


CREATE TRIGGER UpdateProdutos ON TBProdutos
FOR UPDATE AS
BEGIN
	SET NOCOUNT ON
	INSERT TBProdutoHistorico (CodPROD, DescPROD, ValorPROD, Ativo, DataAlteracao, TipoAlteracao)
	SELECT CodPROD, DescPROD, ValorPROD, Ativo, GETDATE(), 'UPDATE OLD'
	FROM deleted

	INSERT TBProdutoHistorico (CodPROD, DescPROD, ValorPROD, Ativo, DataAlteracao, TipoAlteracao)
	SELECT CodPROD, DescPROD, ValorPROD, Ativo, GETDATE(), 'UPDATE NEW'
	FROM inserted
END;


UPDATE TBProdutos SET DescPROD = 'Bacharel em Ciência da Computação' WHERE CodPROD = 1;


SELECT * FROM TBProdutoHistorico;
SELECT * FROM TBProdutos;


CREATE TABLE TBHistoricoCliente(
NomeCLI VARCHAR(100),
EnderecoCLI VARCHAR(100),
TelefoneCLI VARCHAR(25),
EmailCLI VARCHAR(100),
DataNascimento DATETIME,
CodigoCli INT,
Cep VARCHAR(10),
DataAlteracao DATETIME DEFAULT GETDATE(),
TipoAlteracao VARCHAR(100));


CREATE TRIGGER UpdateClientes ON TBcliente
FOR UPDATE AS
BEGIN
	SET NOCOUNT ON/*para nao devolver mensagens*/

	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, DataAlteracao, TipoAlteracao)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, GETDATE(), 'UPDATE OLD' 
	FROM deleted

	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, DataAlteracao, TipoAlteracao)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, GETDATE(), 'UPDATE NEW' 
	FROM inserted
END;

CREATE TRIGGER DeleteCliente ON TBCliente
FOR DELETE AS
BEGIN
	SET NOCOUNT ON
	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, DataAlteracao, TipoAlteracao)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, GETDATE(), 'DELETED'
	FROM deleted
END;

CREATE TRIGGER InsertCliente ON TBCliente
FOR INSERT AS
BEGIN
	SET NOCOUNT ON
	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, DataAlteracao, TipoAlteracao)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, GETDATE(), 'INSERTED'
	FROM inserted
END;


SELECT * FROM TBCliente;


DELETE FROM TBCliente WHERE CodigoCLI = 2;
DELETE FROM TBCliente WHERE CodigoCLI = 10;


INSERT INTO TBCliente(NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, Cep)
VALUES('Sapo Boi', 'Rua Boa Ruim, 33', '8888-9898', 'boe@etec.com', '20000221', '98234-999');


UPDATE TBCliente SET EmailCLI = 'simao@etec.com' WHERE CodigoCLI = 9;


SELECT * FROM TBCliente;
SELECT * FROM TBHistoricoCliente;


DECLARE @DATAINI DATETIME, 
		@DATAFIM DATETIME
SELECT @DATAINI = '20140101', 
	   @DATAFIM = '20140331'
SELECT CodigoCLI, CodigoPROD, DataVenda, Quantidade, ValorTotal
FROM TBVendas
WHERE DataVenda BETWEEN @DATAINI AND @DATAFIM;


DECLARE @SQL VARCHAR(100)
SELECT @SQL = 'SELECT * FROM TBProdutos'
EXEC(@SQL)


DECLARE @SQL VARCHAR(1000),
		@WHERE VARCHAR(500),
		@DATAINI VARCHAR(10),
		@DATAFIM VARCHAR(10),
		@PRODUTO VARCHAR(100)
SELECT @WHERE = '',
	   @PRODUTO = ''
SELECT @DATAINI = '20140101',
	   @DATAFIM = '20140331',
	   @PRODUTO = 'Engenharia Mecatronica'
SET @SQL = 'SELECT * FROM TBVendas V '+'JOIN TBProdutos P ON (V.CodigoPROD = P.CodPROD)'
IF (@DATAINI IS NOT NULL AND @DATAFIM IS NOT NULL)
	SET @WHERE = 'WHERE V.DataVenda BETWEEN'''+@DATAINI+'''AND'''+@DATAFIM+''''
IF LEN(@WHERE) > 0
	SET @PRODUTO = 'AND P.DescPROD LIKE'''+@PRODUTO+'%'''
ELSE
	SET @PRODUTO = 'WHERE P.DescPROD LIKE'''+@PRODUTO+'%'''
	SET @SQL = @SQL + @WHERE + @PRODUTO
EXEC(@SQL)


CREATE PROC SP_PRODUTOS_CAROS
AS
SELECT * FROM TBProdutos
WHERE ValorPROD > 24000;

EXEC SP_PRODUTOS_CAROS;


-- Declaração de Variavel
DECLARE @DESCRICAO VARCHAR(150)
-- declaração do Cursor
DECLARE db_cursor CURSOR FOR
	SELECT DescPROD
	FROM TBProdutos
	ORDER BY DescPROD
	-- Abrindo o Cursor
	OPEN db_cursor
		-- Posicionando o Ponteiro na Proxima Posição (neste caso a primeira)
		FETCH NEXT FROM db_cursor
		INTO @DESCRICAO
		-- Declaração do WHILE. @@FETCH_STATUS retorna o resultado do comando 
		WHILE @@FETCH_STATUS = 0
			BEGIN
			PRINT 'Produto ' + @DESCRICAO
			-- Psionando o Ponteiro na Proxima Posição
			FETCH NEXT FROM db_cursor
			INTO @DESCRICAO
			END
	-- Fechando o Cursor
	CLOSE db_cursor
-- Deslocando a Memória
DEALLOCATE db_cursor


CREATE PROC SP_ATUALIZA_PRODUTOS
@VALOR NUMERIC(18, 2) AS
BEGIN
	DECLARE @Codigo INT, @Descricao VARCHAR(150), @ValorVenda NUMERIC(18, 2), @Ativo BIT
	CREATE TABLE #ProdutosAtualizados(
	Codigo INT,
	Old NUMERIC(18, 2))
	DECLARE db_cursor CURSOR FOR
	SELECT CodPROD, DescPROD, ValorPROD, Ativo FROM TBProdutos ORDER BY DescPROD
	OPEN db_cursor
		FETCH NEXT FROM db_cursor
		INTO @Codigo, @Descricao, @ValorVenda, @Ativo
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(@Ativo = 1)
			BEGIN
				IF(@ValorVenda < @VALOR)
				BEGIN
					INSERT INTO #ProdutosAtualizados VALUES(@Codigo, @ValorVenda)
					UPDATE TBProdutos SET ValorPROD = ValorPROD * 1.1 WHERE CodPROD = @Codigo
				END
			END
			FETCH NEXT FROM db_cursor
			INTO @Codigo, @Descricao, @ValorVenda, @Ativo
		END
	CLOSE db_cursor
DEALLOCATE db_cursor
SELECT DescPROD, ValorPROD AS[Valor Atualizado], Old AS[Valor Antigo] FROM TBProdutos JOIN #ProdutosAtualizados ON(TBProdutos.CodPROD = #ProdutosAtualizados.Codigo)
DROP TABLE #ProdutosAtualizados
END

EXEC SP_ATUALIZA_PRODUTOS 24000;

SP_HELPTEXT 'SP_ATUALIZA_PRODUTOS';


DROP TRIGGER UpdateClientes;
DROP TRIGGER DeleteCliente;
DROP TRIGGER InsertCliente;


ALTER TABLE TBHistoricoCliente ADD Usuario VARCHAR(100) DEFAULT SUSER_NAME();


CREATE TRIGGER TR_Update_Clientes ON TBcliente
FOR UPDATE AS
BEGIN
	SET NOCOUNT ON/*para nao devolver mensagens*/

	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, DataAlteracao, TipoAlteracao, Usuario)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, GETDATE(), 'UPDATE OLD', SUSER_NAME()
	FROM deleted

	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, DataAlteracao, TipoAlteracao, Usuario)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, CodigoCli, Cep, DataNascimento, GETDATE(), 'UPDATE NEW', SUSER_NAME()
	FROM inserted
END;

CREATE TRIGGER TR_Delete_Cliente ON TBCliente
FOR DELETE AS
BEGIN
	SET NOCOUNT ON
	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, DataAlteracao, TipoAlteracao, Usuario)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, GETDATE(), 'DELETED', SUSER_NAME()
	FROM deleted
END;

CREATE TRIGGER TR_Insert_Cliente ON TBCliente
FOR INSERT AS
BEGIN
	SET NOCOUNT ON
	INSERT TBHistoricoCliente (NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, DataAlteracao, TipoAlteracao, Usuario)
	SELECT NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, CodigoCli, Cep, GETDATE(), 'INSERTED', SUSER_NAME()
	FROM inserted
END;


DELETE TBCliente WHERE CodigoCLI = 9;
DELETE TBCliente WHERE CodigoCLI = 8;


INSERT INTO TBCliente(NomeCLI, EnderecoCLI, TelefoneCLI, EmailCLI, DataNascimento, Cep)
VALUES('Bode Velho', 'Rua Ali, 33', '8888-9898', 'bode@etec.com', '20000121', '98234-999');


UPDATE TBCliente SET EmailCLI = 'sapo@etec.com' WHERE CodigoCLI = 11;


SELECT * FROM TBHistoricoCliente;


SELECT * FROM sys.objects WHERE TYPE = 'U'

IF NOT EXISTS (SELECT * FROM sys.objects WHERE TYPE = 'U' AND name = 'TBCliente')
	BEGIN
		CREATE TABLE TBCliente(NomeCli VARCHAR(100),
							   EnderecoCli VARCHAR(100),
							   TelefoneCli VARCHAR(100),
							   EmailCli VARCHAR(100))
	END;


SELECT * FROM sys.objects WHERE TYPE = 'U' AND create_date > GETDATE() - 10;


SELECT CodigoCli, NomeCLI FROM TBCliente;

CREATE INDEX IXNomeCliente ON dbo.TBCliente (NomeCli)
INCLUDE (CodigoCli);

--Backup n°1
BACKUP DATABASE BDProjetoTSQL
TO DISK = 'E:\BD\SQL Server\Backup\BDProjetoTSQL.BAK';

USE master;
DROP DATABASE BDProjetoTSQL;

RESTORE DATABASE [BDProjetoTSQL]
FROM DISK = 'E:\BD\SQL Server\Backup\BDProjetoTSQL.BAK'
WITH REPLACE;

USE BDProjetoTSQL;


SELECT * FROM TBCliente;


--Backup n°2
BACKUP DATABASE BDProjetoTSQL
TO DISK = 'E:\BD\SQL Server\Backup\BDProjetoTSQL1.BAK';

USE master;
DROP DATABASE BDProjetoTSQL;

RESTORE DATABASE [BDProjetoTSQL1]
FROM DISK = 'E:\BD\SQL Server\Backup\BDProjetoTSQL1.BAK'
WITH REPLACE;

USE BDProjetoTSQL;


SELECT * FROM TBCliente;
