-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2023 às 01:27
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Banco de dados: `aluguelchromebook`
-- --------------------------------------------------------

-- Estrutura para tabela `aluguel`
CREATE TABLE `aluguel` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` INT(11) DEFAULT NULL,
  `id_chromebook` INT(11) DEFAULT NULL,
  `id_coordenador` INT(11) DEFAULT NULL,
  `nome_aluno` VARCHAR(50) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_termino` TIME DEFAULT NULL,
  `data_termino` DATE DEFAULT NULL,
  `matricula_usuario` VARCHAR(30) NOT NULL,
  `matricula_aluno` VARCHAR(30) NOT NULL,
  `tombamento` VARCHAR(30) NOT NULL,
  `situacao_chromebook` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_aluno` (`id_aluno`),
  KEY `fk_id_chromebook` (`id_chromebook`),
  KEY `fk_id_coordenador` (`id_coordenador`),
  CONSTRAINT `fk_id_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`),
  CONSTRAINT `fk_id_chromebook` FOREIGN KEY (`id_chromebook`) REFERENCES `chromebook` (`id`),
  CONSTRAINT `fk_id_coordenador` FOREIGN KEY (`id_coordenador`) REFERENCES `coordenador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `aluguel`
INSERT INTO `aluguel` (`id`, `id_aluno`, `id_chromebook`, `id_coordenador`, `nome_aluno`, `data_inicio`, `hora_inicio`, `hora_termino`, `data_termino`, `matricula_usuario`, `matricula_aluno`, `tombamento`, `situacao_chromebook`) VALUES
(2, NULL, NULL, NULL, 'Manoel', '2023-12-29', '01:10:00', '11:11:00', '1111-11-11', '321', '333', '222', 'operante'),
(3, NULL, NULL, NULL, 'Wilson', '2023-12-15', '02:08:00', NULL, NULL, '321', '0404', '222', 'operante');

-- --------------------------------------------------------

-- Estrutura para tabela `aluno`
CREATE TABLE `aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(50) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `curso` VARCHAR(70) NOT NULL,
  `periodo` CHAR(1) NOT NULL,
  `turno` VARCHAR(10) NOT NULL,
  `turma` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `aluno`
INSERT INTO `aluno` (`id`, `matricula`, `nome`, `curso`, `periodo`, `turno`, `turma`) VALUES
(2, '333', 'Everthon', 'SI', '3', 'noite', 'a'),
(3, '0404', 'Wilson', 'SI', '3', 'noite', 'a');

-- --------------------------------------------------------

-- Estrutura para tabela `chromebook`
CREATE TABLE `chromebook` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tombamento` VARCHAR(50) NOT NULL,
  `situacao` VARCHAR(15) NOT NULL,
  `descricao` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `chromebook`
INSERT INTO `chromebook` (`id`, `tombamento`, `situacao`, `descricao`) VALUES
(2, '222', 'Operante', '123');

-- --------------------------------------------------------

-- Estrutura para tabela `coordenador`
CREATE TABLE `coordenador` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(50) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `coordenador`
INSERT INTO `coordenador` (`id`, `matricula`, `nome`, `senha`) VALUES
(1, '321', 'Everthon', '321');

-- AUTO_INCREMENT para tabelas despejadas
ALTER TABLE `aluguel`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `aluno`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `chromebook`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `coordenador`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
