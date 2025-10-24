-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.42 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para space_ijp
DROP DATABASE IF EXISTS `space_ijp`;
CREATE DATABASE IF NOT EXISTS `space_ijp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `space_ijp`;

-- Copiando estrutura para tabela space_ijp.baselancamento
DROP TABLE IF EXISTS `baselancamento`;
CREATE TABLE IF NOT EXISTS `baselancamento` (
  `codbaseLancamento` int NOT NULL AUTO_INCREMENT,
  `nomebase` varchar(150) NOT NULL,
  `paisbase` varchar(150) NOT NULL,
  `precoConstrucao` decimal(12,2) NOT NULL,
  PRIMARY KEY (`codbaseLancamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.baselancamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.carga
DROP TABLE IF EXISTS `carga`;
CREATE TABLE IF NOT EXISTS `carga` (
  `codcarga` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(150) NOT NULL,
  `peso` decimal(5,1) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `Foguete_codFoguete` int NOT NULL,
  PRIMARY KEY (`codcarga`,`Foguete_codFoguete`),
  KEY `fk_carga_Foguete1_idx` (`Foguete_codFoguete`),
  CONSTRAINT `fk_carga_Foguete1` FOREIGN KEY (`Foguete_codFoguete`) REFERENCES `foguete` (`codFoguete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.carga: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.cargo
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `codcargo` int NOT NULL AUTO_INCREMENT,
  `nomeCargo` varchar(150) NOT NULL,
  `salarioInicial` varchar(150) NOT NULL,
  PRIMARY KEY (`codcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.cargo: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.destino
DROP TABLE IF EXISTS `destino`;
CREATE TABLE IF NOT EXISTS `destino` (
  `codDestino` int NOT NULL AUTO_INCREMENT,
  `nomeLocal` varchar(150) NOT NULL,
  `distancia` float NOT NULL,
  `pressao` decimal(7,2) NOT NULL,
  `aceleracaoGravidade` decimal(7,3) DEFAULT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.destino: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.financiamento
DROP TABLE IF EXISTS `financiamento`;
CREATE TABLE IF NOT EXISTS `financiamento` (
  `codFinanciamento` int NOT NULL AUTO_INCREMENT,
  `patrocinador` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `Missoes_codMissao` int NOT NULL,
  PRIMARY KEY (`codFinanciamento`,`Missoes_codMissao`),
  KEY `fk_Financiamento_Missoes1_idx` (`Missoes_codMissao`),
  CONSTRAINT `fk_Financiamento_Missoes1` FOREIGN KEY (`Missoes_codMissao`) REFERENCES `missoes` (`codMissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.financiamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.foguete
DROP TABLE IF EXISTS `foguete`;
CREATE TABLE IF NOT EXISTS `foguete` (
  `codFoguete` int NOT NULL AUTO_INCREMENT,
  `nomeFoguete` varchar(150) NOT NULL,
  `maximoCombustivel` float NOT NULL DEFAULT (0),
  `velocidade` varchar(150) NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`codFoguete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.foguete: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(150) NOT NULL,
  `cpf` varchar(150) NOT NULL,
  `salarioAtual` decimal(8,2) NOT NULL,
  `rg` varchar(150) DEFAULT NULL,
  `telefone` varchar(150) NOT NULL,
  `cep` varchar(150) DEFAULT NULL,
  `dataNascimento` varchar(150) NOT NULL,
  `status` tinyint DEFAULT NULL,
  `cargo_codcargo` int NOT NULL,
  PRIMARY KEY (`codFuncionario`,`cargo_codcargo`),
  KEY `fk_Funcionario_cargo_idx` (`cargo_codcargo`),
  CONSTRAINT `fk_Funcionario_cargo` FOREIGN KEY (`cargo_codcargo`) REFERENCES `cargo` (`codcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.funcionario: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.lancamentos
DROP TABLE IF EXISTS `lancamentos`;
CREATE TABLE IF NOT EXISTS `lancamentos` (
  `codLancamentos` int NOT NULL AUTO_INCREMENT,
  `dataLancamento` date NOT NULL,
  `resultado` varchar(50) NOT NULL,
  `Foguete_codFoguete` int NOT NULL,
  `Missoes_codMissao` int NOT NULL,
  PRIMARY KEY (`codLancamentos`,`Foguete_codFoguete`,`Missoes_codMissao`),
  KEY `fk_Lancamentos_Foguete1_idx` (`Foguete_codFoguete`),
  KEY `fk_Lancamentos_Missoes1_idx` (`Missoes_codMissao`),
  CONSTRAINT `fk_Lancamentos_Foguete1` FOREIGN KEY (`Foguete_codFoguete`) REFERENCES `foguete` (`codFoguete`),
  CONSTRAINT `fk_Lancamentos_Missoes1` FOREIGN KEY (`Missoes_codMissao`) REFERENCES `missoes` (`codMissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.lancamentos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela space_ijp.missoes
DROP TABLE IF EXISTS `missoes`;
CREATE TABLE IF NOT EXISTS `missoes` (
  `codMissao` int NOT NULL AUTO_INCREMENT,
  `nomeMissao` varchar(100) NOT NULL,
  `objetivoMissao` mediumtext NOT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `Destino_codDestino` int NOT NULL,
  PRIMARY KEY (`codMissao`,`Destino_codDestino`),
  KEY `fk_Missoes_Destino1_idx` (`Destino_codDestino`),
  CONSTRAINT `fk_Missoes_Destino1` FOREIGN KEY (`Destino_codDestino`) REFERENCES `destino` (`codDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.missoes: ~0 rows (aproximadamente)

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
INSERT INTO Destino(patrocinador, valor, Missoes_codMissao)
	VALUES(vpatrocinador, vvalor, vMissoes_codMissao);
	SELECT * FROM Destino;
END//
DELIMITER ;

-- Copiando estrutura para procedure space_ijp.proc_InsereFoguete
DROP PROCEDURE IF EXISTS `proc_InsereFoguete`;
DELIMITER //
CREATE PROCEDURE `proc_InsereFoguete`(
	IN `vnomeFoguete` VARCHAR(150),
	IN `vmaximoCombustivel` FLOAT
)
BEGIN
INSERT INTO Destino(nomeFoguete, maximoCombustivel, velocidade, status)
	VALUES(vnomeFoguete, vmaximoCombustivel, vvelocidade, vstatus);
	SELECT * FROM Destino;
END//
DELIMITER ;

-- Copiando estrutura para tabela space_ijp.sensores
DROP TABLE IF EXISTS `sensores`;
CREATE TABLE IF NOT EXISTS `sensores` (
  `codSensores` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `posicao` varchar(50) NOT NULL,
  `Foguete_codFoguete` int NOT NULL,
  PRIMARY KEY (`codSensores`,`posicao`,`Foguete_codFoguete`),
  KEY `fk_Sensores_Foguete1_idx` (`Foguete_codFoguete`),
  CONSTRAINT `fk_Sensores_Foguete1` FOREIGN KEY (`Foguete_codFoguete`) REFERENCES `foguete` (`codFoguete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela space_ijp.sensores: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
