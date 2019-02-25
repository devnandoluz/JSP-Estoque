-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25-Fev-2019 às 16:56
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_over_system`
--
CREATE DATABASE IF NOT EXISTS `db_over_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_over_system`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(85) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `inscricao_estadual` varchar(13) NOT NULL,
  `servico_contratado` varchar(45) NOT NULL,
  `quantidade` varchar(20) NOT NULL,
  `valor_servico` decimal(9,2) NOT NULL,
  `data_adesao` date NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `idCLIENTE_UNIQUE` (`idcliente`),
  UNIQUE KEY `CNPJ_UNIQUE` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `idfuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `rg` varchar(9) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `sexo` varchar(12) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `usuario_idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfuncionario`),
  UNIQUE KEY `idCADSATRO DE FUNCIONARIO_UNIQUE` (`idfuncionario`),
  UNIQUE KEY `CPF_UNIQUE` (`cpf`),
  UNIQUE KEY `RG_UNIQUE` (`rg`),
  KEY `fk_FUNCIONARIO_USUARIO1_idx` (`usuario_idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instalacao`
--

CREATE TABLE IF NOT EXISTS `instalacao` (
  `idinstalacao` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(145) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idinstalacao`),
  KEY `fk_SERVICO_ CLIENTE1_idx` (`cliente_idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instalacao_funcionario`
--

CREATE TABLE IF NOT EXISTS `instalacao_funcionario` (
  `idinstalacao` int(11) NOT NULL,
  `idfuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idinstalacao`,`idfuncionario`),
  KEY `fk_INSTALACAO_has_FUNCIONARIO_FUNCIONARIO1_idx` (`idfuncionario`),
  KEY `fk_INSTALACAO_has_FUNCIONARIO_INSTALACAO1_idx` (`idinstalacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instalacao_produto`
--

CREATE TABLE IF NOT EXISTS `instalacao_produto` (
  `idinstalacao` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  PRIMARY KEY (`idinstalacao`,`idproduto`),
  KEY `fk_INSTALACAO_has_PRODUTO_PRODUTO1_idx` (`idproduto`),
  KEY `fk_INSTALACAO_has_PRODUTO_INSTALACAO1_idx` (`idinstalacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `idlog` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `funcionario_idfuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idlog`),
  KEY `fk_LOG_FUNCIONARIO1_idx` (`funcionario_idfuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(145) NOT NULL,
  `menu` varchar(45) NOT NULL,
  `status` int(1) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idmenu`, `link`, `menu`, `status`, `icone`) VALUES
(1, 'monitoramento.jsp', 'Monitoramento', 1, 'fa-bar-chart'),
(2, 'adicionar', 'Adicionar', 1, 'fa-plus'),
(3, 'gerar', 'Gerar', 1, 'fa-file'),
(4, 'estoque.jsp', 'Estoque', 1, 'fa-cart-plus'),
(5, 'cliente.jsp', 'Cliente', 1, 'fa-user'),
(6, 'funcionario.jsp', 'Funcionário ', 1, 'fa-id-card'),
(7, 'instalacao.jsp', 'Instalação', 1, 'fa-wrench');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE IF NOT EXISTS `menu_perfil` (
  `idmenu` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idmenu`,`idperfil`),
  KEY `fk_MENU_has_PERFIL_PERFIL1_idx` (`idperfil`),
  KEY `fk_MENU_has_PERFIL_MENU1_idx` (`idmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idmenu`, `idperfil`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(45) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idperfil`, `perfil`, `status`) VALUES
(1, 'Administrador', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unit` decimal(9,2) NOT NULL,
  `categoria` varchar(65) NOT NULL,
  PRIMARY KEY (`idproduto`),
  UNIQUE KEY `idPRODUTO_UNIQUE` (`idproduto`),
  UNIQUE KEY `NOME_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `perfil_idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idUSUARIO_UNIQUE` (`idusuario`),
  UNIQUE KEY `USERNAME_UNIQUE` (`username`),
  KEY `fk_USUARIO_PERFIL1_idx` (`perfil_idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `senha`, `perfil_idperfil`) VALUES
(1, 'admin', 'admin', 1);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_FUNCIONARIO_USUARIO1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `instalacao`
--
ALTER TABLE `instalacao`
  ADD CONSTRAINT `fk_SERVICO_ CLIENTE1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `instalacao_funcionario`
--
ALTER TABLE `instalacao_funcionario`
  ADD CONSTRAINT `fk_INSTALACAO_has_FUNCIONARIO_FUNCIONARIO1` FOREIGN KEY (`idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_INSTALACAO_has_FUNCIONARIO_INSTALACAO1` FOREIGN KEY (`idinstalacao`) REFERENCES `instalacao` (`idinstalacao`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `instalacao_produto`
--
ALTER TABLE `instalacao_produto`
  ADD CONSTRAINT `fk_INSTALACAO_has_PRODUTO_INSTALACAO1` FOREIGN KEY (`idinstalacao`) REFERENCES `instalacao` (`idinstalacao`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_INSTALACAO_has_PRODUTO_PRODUTO1` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_LOG_FUNCIONARIO1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_MENU_has_PERFIL_MENU1` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MENU_has_PERFIL_PERFIL1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_USUARIO_PERFIL1` FOREIGN KEY (`perfil_idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
