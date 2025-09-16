DROP PROCEDURE IF EXISTS `proc_AlteraBaseLancamento`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraBaseLancamento`(
	IN `vnomeBase` VARCHAR(150),
	IN `vcodBase` INT,
	IN `vpaisBase` CHAR(150),
	IN `vprecoConstrucao` DECIMAL(12,2)
)
BEGIN
	SELECT COUNT(*) INTO @existe FROM baselancamento WHERE codbaselancamento = vcodBase;

	if (@existe)
		then UPDATE baselancamento SET nomebase = vnomeBase, paisbase = vpaisBase, precoConstrucao = vprecoConstrucao 
		WHERE codbaseLancamento = vcodBase;
		ELSE SELECT "Base não encontrada" AS ERRO;
	END if;
	
	SELECT * FROM baselancamento;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraCarga
DROP PROCEDURE IF EXISTS `proc_AlteraCarga`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraCarga`(
	IN `vcodCarga` INT,
	IN `vtipo` VARCHAR(150),
	IN `vpeso` DECIMAL(5,1),
	IN `vdescricao` VARCHAR(150),
	IN `vfoguete_codFoguete` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM carga WHERE codcarga = vcodCarga;

	if (@existe)
		then UPDATE carga SET tipo = vtipo, peso = vpeso, descricao = vdescricao, Foguete_codFoguete = vfoguete_codFoguete
		WHERE codcarga = vcodCarga;
		ELSE SELECT "Carga não encontrada" AS ERRO;
	END if;
	
	SELECT * FROM carga;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraCargo
DROP PROCEDURE IF EXISTS `proc_AlteraCargo`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraCargo`(
	IN `vcodCargo` INT,
	IN `vnomeCargo` VARCHAR(150),
	IN `vsalarioInicial` VARCHAR(150)
)
BEGIN
SELECT COUNT(*) INTO @existe FROM cargo WHERE codcargo = vcodCargo;

	if (@existe)
		then UPDATE cargo SET nomeCargo = vnomeCargo, salarioInicial = vsalarioInicial 
		WHERE codcargo = vcodCargo;
		ELSE SELECT "Cargo não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM cargo;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraDestino
DROP PROCEDURE IF EXISTS `proc_AlteraDestino`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraDestino`(
	IN `vnomeLocal` VARCHAR(150),
	IN `vdistancia` FLOAT,
	IN `vpressao` DECIMAL(7,2),
	IN `vaceleracaoGravidade` DECIMAL(7,3),
	IN `vcodDestino` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM destino WHERE codDestino = vcodDestino;

	if (@existe)
		then UPDATE destino SET nomeLocal = vnomeLocal, distancia = vdistancia, pressao = vpressao,
		aceleracaoGravidade = vaceleracaoGravidade
		WHERE codDestino = vcodDestino;
		ELSE SELECT "Destino não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM destino;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraFinanciamento
DROP PROCEDURE IF EXISTS `proc_AlteraFinanciamento`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraFinanciamento`(
	IN `vcodFinanciamento` INT,
	IN `vpatrocinador` VARCHAR(100),
	IN `vvalor` DECIMAL(10,2),
	IN `vMissoes_codMissao` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM financiamento WHERE codFinanciamento = vcodFinanciamento;

	if (@existe)
		then UPDATE financiamento SET patrocinador = vpatrocinador, valor = vvalor, Missoes_codMissao = vMissoes_codMissao
		WHERE codFinanciamento = vcodFinanciamento;
		ELSE SELECT "Financiamento não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM Financiamento;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraFoguete
DROP PROCEDURE IF EXISTS `proc_AlteraFoguete`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraFoguete`(
	IN `vcodFoguete` INT,
	IN `vnomeFoguete` VARCHAR(150),
	IN `vmaximoCombustivel` FLOAT,
	IN `vvelocidade` DECIMAL(10,2),
	IN `vstatus` TINYINT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM Foguete WHERE codFoguete = vcodFoguete;

	if (@existe)
		then UPDATE Foguete SET nomeFoguete = vnomeFoguete, maximoCombustivel = vmaximoCombustivel,
		velocidade = vvelocidade, status = vstatus
		WHERE codFoguete = vcodFoguete;
		ELSE SELECT "Foguete não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM Foguete;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraFuncionario
DROP PROCEDURE IF EXISTS `proc_AlteraFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraFuncionario`(
	IN `vcodFuncionario` INT,
	IN `vnomeFuncionario` VARCHAR(150),
	IN `vcpf` VARCHAR(150),
	IN `vsalarioAtual` DECIMAL(8,2),
	IN `vtelefone` VARCHAR(150),
	IN `vdataNascimento` DATE,
	IN `vcargo_codcargo` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM Funcionario WHERE codFuncionario = vcodFuncionario;

	if (@existe)
		then UPDATE Funcionario SET nomeFuncionario = vnomeFuncionario, cpf = vcpf, salarioAtual = vsalarioAtual,
		telefone = vtelefone, dataNascimento = vdataNascimento, cargo_codcargo = vcargo_codcargo
		WHERE codFuncionario = vcodFuncionario;
		ELSE SELECT "Funcionario não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM Funcionario;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraLancamentos
DROP PROCEDURE IF EXISTS `proc_AlteraLancamentos`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraLancamentos`(
	IN `vcodLancamentos` INT,
	IN `vresultado` VARCHAR(150),
	IN `vFoguete_codFoguete` INT,
	IN `vMissoes_codMissao` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM Lancamentos WHERE codLancamentos = vcodLancamentos;

	if (@existe)
		then UPDATE Lancamentos SET dataLancamento = vdataLancamento, resultado = vresultado,
		Foguete_codFoguete = vFoguete_codFoguete, Missoes_codMissao = vMissoes_codMissao
		WHERE codLancamentos = vcodLancamentos;
		ELSE SELECT "Funcionario não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM Lancamentos;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_AlteraMissoes
DROP PROCEDURE IF EXISTS `proc_AlteraMissoes`;
DELIMITER //
CREATE PROCEDURE `proc_AlteraMissoes`(
	IN `vnomeMissao` VARCHAR(100),
	IN `vobjetivoMissao` MEDIUMTEXT,
	IN `vdataInicio` DATE,
	IN `vdataFim` DATE,
	IN `vstatus` VARCHAR(50),
	IN `vDestino_codMissao` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM missoes WHERE codsensores = vcodsensores;

	if (@existe)
		then UPDATE missoes SET nomeMissao = vnomeMissao, objetivoMissao = vobjetivoMissao,
		dataInicio = vdataInicio, dataFim = vdataFim, status = vstatus, Destino_codMissao = vDestino_codMissao 
		WHERE codsensores = vcodsensores;
		ELSE SELECT "Missão não encontrada" AS ERRO;
	END if;
	
	SELECT * FROM missoes;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_Alterasensores
DROP PROCEDURE IF EXISTS `proc_Alterasensores`;
DELIMITER //
CREATE PROCEDURE `proc_Alterasensores`(
	IN `vtipo` VARCHAR(50),
	IN `vunidade` VARCHAR(20),
	IN `vposition` VARCHAR(50),
	IN `vcodsensores` INT
)
BEGIN
SELECT COUNT(*) INTO @existe FROM sensores WHERE codsensores = vcodsensores;

	if (@existe)
		then UPDATE sensores SET tipo = vtipo, unidade = vunidade, position = vposition,
		Foguete_codFoguete = Foguete_codFoguete
		WHERE codsensores = vcodsensores;
		ELSE SELECT "sensor não encontrado" AS ERRO;
	END if;
	
	SELECT * FROM sensores;	
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InserebaseLancamento
DROP PROCEDURE IF EXISTS `proc_InserebaseLancamento`;
DELIMITER //
CREATE PROCEDURE `proc_InserebaseLancamento`(
	IN `vnomebase` VARCHAR(150),
	IN `vpaisbase` VARCHAR(150),
	IN `vprecoConstrucao` DECIMAL(12,2)
)
BEGIN
INSERT INTO baselancamento(nomebase, paisbase, precoConstrucao)
	VALUES(vnomebase, vpaisbase, vprecoConstrucao);
	SELECT * FROM baselancamento;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereCarga
DROP PROCEDURE IF EXISTS `proc_InsereCarga`;
DELIMITER //
CREATE PROCEDURE `proc_InsereCarga`(
	IN `vtipo` VARCHAR(150),
	IN `vpeso` DECIMAL(5,1),
	IN `vdescricao` VARCHAR(150),
	IN `vfoguete_codFoguete` INT
)
BEGIN
INSERT INTO carga(tipo, peso, descricao, foguete_codFoguete)
	VALUES(vtipo, vpeso, vdescricao, vfoguete_codFoguete);
	SELECT * FROM carga;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereCargo
DROP PROCEDURE IF EXISTS `proc_InsereCargo`;
DELIMITER //
CREATE PROCEDURE `proc_InsereCargo`(
	IN `vnomeCargo` VARCHAR(150),
	IN `vsalarioInicial` VARCHAR(150)
)
BEGIN
INSERT INTO cargo(nomeCargo, salarioInicial)
	VALUES(vnomeCargo, vsalarioInicial);
	SELECT * FROM cargo;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereDestino
DROP PROCEDURE IF EXISTS `proc_InsereDestino`;
DELIMITER //
CREATE PROCEDURE `proc_InsereDestino`(
	IN `vnomeLocal` VARCHAR(150),
	IN `vdistancia` FLOAT,
	IN `vpressao` DECIMAL(7,2),
	IN `vaceleracaoGravidade` DECIMAL(7,3),
	IN `vtipo` VARCHAR(150)
)
BEGIN
INSERT INTO Destino(nomeLocal, distancia, pressao, aceleracaoGravidade, tipo)
	VALUES(vnomeLocal, vdistancia, vpressao, vaceleracaoGravidade, vtipo);
	SELECT * FROM Destino;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereFinaciamento
DROP PROCEDURE IF EXISTS `proc_InsereFinaciamento`;
DELIMITER //
CREATE PROCEDURE `proc_InsereFinaciamento`(
	IN `vpatrocinador` VARCHAR(100),
	IN `vvalor` DECIMAL(10,2),
	IN `vMissoes_codMissao` INT
)
BEGIN
INSERT INTO Financiamento(patrocinador, valor, Missoes_codMissao)
	VALUES(vpatrocinador, vvalor, vMissoes_codMissao);
	SELECT * FROM Financiamento;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereFoguete
DROP PROCEDURE IF EXISTS `proc_InsereFoguete`;
DELIMITER //
CREATE PROCEDURE `proc_InsereFoguete`(
	IN `vnomeFoguete` VARCHAR(150),
	IN `vmaximoCombustivel` FLOAT,
	IN `vvelocidade` INT,
	IN `vstatus` TINYINT
)
BEGIN
INSERT INTO Foguete(nomeFoguete, maximoCombustivel, velocidade, status)
	VALUES(vnomeFoguete, vmaximoCombustivel, vvelocidade, vstatus);
	SELECT * FROM Foguete;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereFuncionario
DROP PROCEDURE IF EXISTS `proc_InsereFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_InsereFuncionario`(
	IN `vnomeFuncionario` VARCHAR(150),
	IN `vcpf` VARCHAR(150),
	IN `vsalarioAtual` DECIMAL(8,2),
	IN `vtelefone` VARCHAR(150),
	IN `vdataNascimento` DATE,
	IN `vcargo_codcargo` INT
)
BEGIN
INSERT INTO Funcionario(nomeFuncionario, cpf, salarioAtual, telefone, dataNascimento, cargo_codcargo)
	VALUES(vnomeFuncionario, vcpf, vsalarioAtual, vtelefone, vdataNascimento, vcargo_codcargo);
	SELECT * FROM Funcionario;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereLancamentos
DROP PROCEDURE IF EXISTS `proc_InsereLancamentos`;
DELIMITER //
CREATE PROCEDURE `proc_InsereLancamentos`(
	IN `vdataLancamento` DATE,
	IN `vresultado` VARCHAR(50),
	IN `vFoguete_codFoguete` INT,
	IN `vMissoes_codMissao` INT
)
BEGIN
INSERT INTO Lancamentos(dataLancamento, resultado, Foguete_codFoguete, Missoes_codMissao)
	VALUES(vdataLancamento, vresultado, vFoguete_codFoguete, vMissoes_codMissao);
	SELECT * FROM Lancamentos;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_Inseremissoes
DROP PROCEDURE IF EXISTS `proc_Inseremissoes`;
DELIMITER //
CREATE PROCEDURE `proc_Inseremissoes`(
	IN `vnomeMissao` VARCHAR(150),
	IN `vobjetivoMissao` MEDIUMTEXT,
	IN `vDestino_codDestino` INT
)
BEGIN
INSERT INTO missoes(nomeMissao, objetivoMissao, Destino_codDestino)
	VALUES(vnomeMissao, vobjetivoMissao, vDestino_codDestino);
	SELECT * FROM missoes;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_Inseresensores
DROP PROCEDURE IF EXISTS `proc_Inseresensores`;
DELIMITER //
CREATE PROCEDURE `proc_Inseresensores`(
	IN `vtipo` VARCHAR(50),
	IN `vunidade` VARCHAR(20),
	IN `vposicao` VARCHAR(50),
	IN `vFoguete_codFoguete` INT
)
BEGIN
INSERT INTO sensores(tipo, unidade, posicao, Foguete_codFoguete)
	VALUES(vtipo, vunidade, vposicao, vFoguete_codFoguete);
	SELECT * FROM sensores;
END//
DELIMITER ;

-- Copiando estrutura para tabela space_ijp.sensores
DROP TABLE IF EXISTS `sensores`;
CREATE TABLE IF NOT EXISTS `sensores` (
  `codSensores` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `position` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Foguete_codFoguete` int(11) NOT NULL,
  PRIMARY KEY (`codSensores`,`Foguete_codFoguete`),
  KEY `fk_Sensores_Foguete1_idx` (`Foguete_codFoguete`),
  CONSTRAINT `fk_Sensores_Foguete1` FOREIGN KEY (`Foguete_codFoguete`) REFERENCES `foguete` (`codFoguete`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Copiando dados para a tabela space_ijp.sensores: ~1 rows (aproximadamente)
INSERT INTO `sensores` (`codSensores`, `tipo`, `unidade`, `position`, `Foguete_codFoguete`) VALUES
	(1, 'luminosidade', '2.0', 'lateral direita', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
