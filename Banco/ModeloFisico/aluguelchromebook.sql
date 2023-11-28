-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/11/2023 às 12:54
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aluguelchromebook`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula_aluno` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `periodo` int(11) NOT NULL,
  `turno` varchar(255) NOT NULL,
  `turma` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `checa`
--

CREATE TABLE `checa` (
  `id` int(255) NOT NULL,
  `data_hora` datetime NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `situacao` varchar(255) NOT NULL,
  `fk_chromebook_tombamento` int(11) NOT NULL,
  `fk_id_coordenador` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chromebook`
--

CREATE TABLE `chromebook` (
  `tombamento` int(11) NOT NULL,
  `situacao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenador`
--

CREATE TABLE `coordenador` (
  `matricula_coordenador` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `registro`
--

CREATE TABLE `registro` (
  `id_registro` int(11) NOT NULL,
  `multa` double NOT NULL,
  `data_hora` datetime NOT NULL,
  `fk_aluno_matricula` varchar(255) NOT NULL,
  `fk_chromebook_tombamento` int(11) NOT NULL,
  `fk_id_coordenador` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula_aluno`);

--
-- Índices de tabela `checa`
--
ALTER TABLE `checa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_coordenador` (`fk_id_coordenador`),
  ADD KEY `fk_chromebook_tombamento` (`fk_chromebook_tombamento`);

--
-- Índices de tabela `chromebook`
--
ALTER TABLE `chromebook`
  ADD PRIMARY KEY (`tombamento`);

--
-- Índices de tabela `coordenador`
--
ALTER TABLE `coordenador`
  ADD PRIMARY KEY (`matricula_coordenador`);

--
-- Índices de tabela `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `fk_matricula_aluno` (`fk_aluno_matricula`),
  ADD KEY `fk_id_coordenador_fk` (`fk_id_coordenador`),
  ADD KEY `fk_chromebook_tombamento_fk` (`fk_chromebook_tombamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `checa`
--
ALTER TABLE `checa`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `registro`
--
ALTER TABLE `registro`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `checa`
--
ALTER TABLE `checa`
  ADD CONSTRAINT `fk_chromebook_tombamento` FOREIGN KEY (`fk_chromebook_tombamento`) REFERENCES `chromebook` (`tombamento`),
  ADD CONSTRAINT `fk_id_coordenador` FOREIGN KEY (`fk_id_coordenador`) REFERENCES `coordenador` (`matricula_coordenador`);

--
-- Restrições para tabelas `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_chromebook_tombamento_fk` FOREIGN KEY (`fk_chromebook_tombamento`) REFERENCES `chromebook` (`tombamento`),
  ADD CONSTRAINT `fk_id_coordenador_fk` FOREIGN KEY (`fk_id_coordenador`) REFERENCES `coordenador` (`matricula_coordenador`),
  ADD CONSTRAINT `fk_matricula_aluno` FOREIGN KEY (`fk_aluno_matricula`) REFERENCES `aluno` (`matricula_aluno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
