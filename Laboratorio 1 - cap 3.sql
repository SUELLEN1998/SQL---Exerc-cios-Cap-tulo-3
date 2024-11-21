-- **** Laboratório 1 **** 

--A – Inserindo registros / Utilizando o banco de dados SISTEMA_ACADEMICO faça os exercícios listados:

--1. Coloque em uso o banco de dados SISTEMA_ACADEMICO;
 USE SISTEMA_ACADEMICO
 
 --2. Utilizando Insert Declarativo, inserir na tabela TB_CARGO os registros:
 --SUPERVISORA COMERCIAL
 --QUALIDADE
 --DIRETOR
 --COMPRADOR(A)
 --VENDEDOR(A)
 --REPRESENTANTE DA DIREÇÃO
 --MOTORISTA
 --ENG MANUFATURA
 --COZINHEIRO
 --AUXILIAR LABORATORIO
 
 INSERT INTO TB_CARGO(COD_CARGO,CARGO)
 VALUES(1,'SUPERVISORA COMERCIAL')
     ,(2,'QUALIDADE')
     ,(3,'DIRETOR')
     ,(4,'COMPRADOR(A)')
     ,(5,'VENDEDOR(A)')
     ,(6,'REPRESENTANTE DA DIREÇÃO')
     ,(7,'MOTORISTA')
     ,(8,'ENG MANUFATURA')
     ,(9,'COZINHEIRO')
     ,(10,'AUXILIAR LABORATORIO')
	 
	 
--3. Utilizando Insert Posicional, inserir na tabela TB_CARGO os registros:
--GERENTE COMPRAS
--AUXILIAR DE MANUTENÇÃO
--GERENTE ADMINISTRATIVO
--TORNEIRO MECÂNICO
--SUPERVISOR
--GERENTE DE PRODUÇÃO
--QUÍMICO

 INSERT INTO TB_CARGO
 VALUES(11,'GERENTE COMPRAS')
  ,(12,'AUXILIAR DE MANUTENÇÃO')
  ,(13,'GERENTE ADMINISTRATIVO')
  ,(14,'TORNEIRO MECÂNICO')
  ,(15,'SUPERVISOR')
  ,(16,'GERENTE DE PRODUÇÃO')
  ,(17,'QUÍMICO')
  
  
  --4. Na tabela TB_DISCIPLINA inserir os registros:
  --MATEMÁTICA
  --HISTÓRIA
  --GEOGRAFIA
  --LINGUA PORTUGUESA
  --INGLÊS
  --CIÊNCIAS
  
 INSERT INTO TB_DISCIPLINA(COD_DISCIPLINA,NOME_DISCIPLINA)
 VALUES(1,'MATEMÁTICA')
     ,(2,'HISTÓRIA')
     ,(3,'GEOGRAFIA')
     ,(4,'LINGUA PORTUGUESA')
     ,(5,'INGLÊS')
     ,(6,'CIÊNCIAS')
	 
--5. Inserir na tabela TB_ALUNO o registro:
--NOME: MARINALVA DA SILVA
--CPF_ALUNO: 14534423423 
--COD_CARGO: 5
--COD_DISCIPLINA: 1
--END_ALUNO: R.COMENDADOR JOSE ZILLO,401
--BAIRRO_ALUNO: PQ. DOS OCACIS
--CIDADE_ALUNO: ASSIS
--ESTADO_ALUNO: SP
--CEP_ALUNO: 19800000
--FONE: 1124516577
--STATUS_ALUNO: A
--DATA_CAD_ALUNO: DATA_ATUAL

 INSERT INTO TB_ALUNO (NOME
   ,CPF_ALUNO
   ,COD_CARGO
   ,END_ALUNO
   ,BAIRRO_ALUNO
   ,CIDADE_ALUNO
   ,ESTADO_ALUNO
   ,CEP_ALUNO
   ,FONE
   ,STATUS_ALUNO
   ,DATA_CAD_ALUNO)
 VALUES('MARINALVA DA SILVA'
      ,14534423423
   ,5
   ,'R.COMENDADOR JOSE ZILLO,401'
   ,'PQ. DOS OCACIS'
   ,'ASSIS'
   ,'SP'
   ,'19800000'
   ,'1124516577'
   ,'A'
   ,GETDATE())
   
   
 --6. Inserir mais dois registros na tabela TB_ALUNO:
 --NOME: ALINE ALVES
 --CPF_ALUNO: 23434427422
 --COD_CARGO: 13
 --END_ALUNO: R.OLIVEIRA DE SÁ,47
 --BAIRRO_ALUNO: PQ. DAS OLIVEIRAS
 --CIDADE_ALUNO: SÃO PAULO
 --ESTADO_ALUNO: SP
 --CEP_ALUNO: 07865000
 --FONE: 1132753422
 --STATUS_ALUNO: A
 --DATA_CAD_ALUNO: DATA_ATUAL
 --NOME: ANTONIA GOMES
 --CPF_ALUNO: 17423354566 
 --COD_CARGO: 1
 --END_ALUNO: R. PADRE OLIVEIRA,322
 --BAIRRO_ALUNO: VILA MATILDE
 --CIDADE_ALUNO: SÃO PAULO
 --ESTADO_ALUNO: SP
 --CEP_ALUNO: 02532010
 --FONE: 1126745155
 --STATUS_ALUNO: A
 --DATA_CAD_ALUNO: DATA_ATUAL
 
 INSERT INTO TB_ALUNO
 VALUES('ALINE ALVES'
       ,23434427422
       ,13
       ,'R.OLIVEIRA DE SÁ,47'
       ,'PQ. DAS OLIVEIRAS'
       ,'SÃO PAULO'
       ,'SP'
       ,'07865000'
       ,'1132753422'
       ,'A'
       ,GETDATE())
     ,('ANTONIA GOMES'
     ,17423354566 
     ,1
     ,'R. PADRE OLIVEIRA,322'
     ,'VILA MATILDE'
     ,'SÃO PAULO'
     ,'SP'
     ,'02532010'
     ,'1126745155'
     ,'A'
     ,GETDATE())
	 
	 
--7. Na tabela TB_ALUNO_DISCIPLINA inserir os registros:--A aluna Aline Alves cursa as disciplinas:História/Lingua s
--A aluna Antonia Gomes cursa as disciplinas:História/ Geografia/Ciências

 INSERT INTO TB_ALUNO_DISCIPLINA
 VALUES(1,2,2)
     ,(2,2,4)
     ,(3,2,5)

	 INSERT INTO TB_ALUNO_DISCIPLINA
 VALUES(4,3,2)
     ,(5,3,3)
     ,(6,3,6)
	 
	
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
	 
-- **** Laboratório 2 **** 


--A - Atualizando registros
--1. Coloque em uso o banco de dados PEDIDOS;

 USE PEDIDOS
 
 --2. Altere a tabela TB_CARGO, mudando o salário inicial do cargo QUÍMICO para 2500,00;
 UPDATE TB_CARGO 
SET SALARIO_INIC = 2500
 WHERE CARGO='QUíMICO'
 
 --3. Altere a tabela de cargos, estipulando 10% de aumento para o campo SALARIO_INIC de todos os cargos;
 BEGIN TRAN
 UPDATE TB_CARGO
 SET SALARIO_INIC *=1.1
 ROLLBACK
 
 --4. Transfira para o campo SALARIO da tabela TB_EMPREGADO o salário inicial cadastrado no cargo correspondente da TB_ CARGO;
 
 -- Solução 1
 BEGIN TRAN
 -- Solução 1
 UPDATE TB_EMPREGADO 
SET SALARIO = (SELECT SALARIO_INIC 
               FROM TB_CARGO
               WHERE COD_CARGO = TB_EMPREGADO.COD_CARGO)    
ROLLBACK

-- Solução 2
 BEGIN TRAN
 UPDATE TB_EMPREGADO
 SET SALARIO = CARGO.SALARIO_INIC
 FROM TB_EMPREGADO EMP 
INNER JOIN TB_CARGO CARGO
 ON EMP.COD_CARGO = CARGO.COD_CARGO
 ROLLBACK
 
 
--5. Reajuste os preços de venda de todos os produtos de modo que fiquem 30% acima do preço de custo (PRECO_VENDA = PRECO_ CUSTO * 1.3);

 BEGIN TRAN
 UPDATE TB_PRODUTO 
SET PRECO_VENDA = PRECO_CUSTO * 1.3;

-- Testando
 SELECT ID_PRODUTO
     , PRECO_CUSTO
     , PRECO_VENDA
     , 100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO
 FROM TB_PRODUTO
 WHERE PRECO_CUSTO > 0
 COMMIT

 

--6. Reajuste os preços de venda dos produtos com descrição do tipo igual à REGUA, de modo que fiquem 40% acima do preço de custo. Para isso, considere as seguintes informações:

--l PRECO_VENDA = PRECO_CUSTO * 1.4;
--l Para produtos com TB_TIPOPRODUTO.TIPO = 'REGUA';
--l É necessário fazer um JOIN de TB_PRODUTO com TB_TIPOPRODUTO.

 BEGIN TRAN
 UPDATE TB_PRODUTO 
SET PRECO_VENDA = PROD.PRECO_CUSTO * 1.4
 FROM TB_PRODUTO PROD 
INNER JOIN TB_TIPOPRODUTO TIPO
 ON PROD.COD_TIPO = TIPO.COD_TIPO
 WHERE TIPO.TIPO = 'REGUA'
 COMMIT
 
 --7. Altere a tabela TB_ITENSPEDIDO de modo que todos os itens com produto indicado como VERMELHO passem a ser LARANJA. 
--Considere somente os pedidos com data de entrega em outubro de 2017;

 BEGIN TRAN
 UPDATE TB_ITENSPEDIDO 
SET CODCOR = (SELECT CODCOR 
              FROM TB_COR 
              WHERE COR = 'LARANJA')
 WHERE CODCOR = (SELECT CODCOR 
                FROM TB_COR 
                WHERE COR = 'VERMELHO') 
  AND DATA_ENTREGA BETWEEN '2006.01.01' AND '2006.01.31'     
ROLLBACK

-- SOLUÇÃO 2
 BEGIN TRAN
 UPDATE TB_ITENSPEDIDO 
SET CODCOR = CORL.CODCOR
 FROM TB_ITENSPEDIDO ITEM 
JOIN TB_COR CORV 
ON ITEM.CODCOR = CORV.CODCOR
 INNER JOIN TB_COR CORL 
ON CORL.COR = 'LARANJA'
 WHERE CORV.COR = 'VERMELHO' 
  AND ITEM.DATA_ENTREGA BETWEEN '2006.01.01' AND '2006.01.31'       
ROLLBACK


--8. Altere o campo ICMS da tabela TB_CLIENTE para 12. Considere apenas clientes dos estados: RJ, RO, AC, RR, MG, PR, SC, RS, MS e MT;

 BEGIN TRAN
 UPDATE TB_CLIENTE 
SET ICMS = 12
 OUTPUT inserted.CODCLI
      ,deleted.ICMS AS ICMS_ANTERIOR
      ,inserted.ICMS AS ICMS_ATUAL
 FROM TB_CLIENTE AS CLI
 WHERE CLI.ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 
'RS', 'MS', 'MT')
 ROLLBACK
 	
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
	 
-- **** Laboratório 3 **** 
 
 --A – Excluindo registros
 --1. Criar uma cópia da tabela TB_EMPREGADO com o nome TBEMP_TEMP
 
 SELECT *
 INTO TBEMP_TEMP
 FROM TB_EMPREGADO
 
 --Usar a tabela TBEMP_TEMP para realizar os exercícios abaixo:
 --2. Apagar os registros do departamento 2
 BEGIN TRAN
 DELETE
 FROM TBEMP_TEMP
 WHERE COD_DEPTO=2
 ROLLBACK
 
 --3. Apagar os registros que possuem a coluna SALARIO NULL
 BEGIN TRAN

 DELETE
 FROM TBEMP_TEMP
 WHERE SALARIO IS NULL
 ROLLBACK
 
 --4. Apagar os registros do cargo 3,5,8.
 BEGIN TRAN
 DELETE 
FROM TBEMP_TEMP
 WHERE COD_CARGO IN (3,5,8)
 ROLLBACK
 
 --5. Criar uma cópia da tabela TB_CLIENTE com o nome TBEMP_CLI
 SELECT *
 INTO TBEMP_CLI
 FROM TB_CLIENTE
 
 --Usar a tabela TBEMP_CLI para realizar os exercícios abaixo:
 --6. Apagar os registros que estão com Estado NULL
 BEGIN TRAN
 DELETE
 FROM TBEMP_CLI
 WHERE ESTADO IS NULL
 ROLLBACK
 
 --7. Apagar os registros da coluna ESTADO igual a BA,ES,MG,SC,SP
 BEGIN TRAN
 DELETE
 FROM TBEMP_CLI
 OUTPUT deleted.*
 WHERE ESTADO IN ('BA','ES','MG','SC','SP')
 ROLLBACK



































