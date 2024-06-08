-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/06/2024 às 15:33
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
-- Estrutura para tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `id` int(11) NOT NULL,
  `matricula_aluno` varchar(50) NOT NULL,
  `dataAgendada` date NOT NULL,
  `horaAgendada` time NOT NULL,
  `fk_id_aluno` int(11) DEFAULT NULL,
  `fk_id_aluguel` int(11) DEFAULT NULL,
  `situacao_agendamento` varchar(30) NOT NULL,
  `dataParaOAluguel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamento`
--

INSERT INTO `agendamento` (`id`, `matricula_aluno`, `dataAgendada`, `horaAgendada`, `fk_id_aluno`, `fk_id_aluguel`, `situacao_agendamento`, `dataParaOAluguel`) VALUES
(1, '111', '2024-06-07', '23:34:32', NULL, NULL, 'agendado', '2024-06-09'),
(2, '222', '2024-06-08', '08:13:55', NULL, NULL, 'agendado', '2024-06-26'),
(3, '333', '2024-06-08', '10:03:10', NULL, NULL, 'concluido', '2024-06-18'),
(4, '333', '2024-06-08', '10:08:29', NULL, NULL, 'concluido', '2024-06-11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `id` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_chromebook` int(11) DEFAULT NULL,
  `id_coordenador` int(11) DEFAULT NULL,
  `nome_aluno` varchar(50) NOT NULL,
  `data_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_termino` time DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `matricula_usuario` varchar(30) NOT NULL,
  `matricula_aluno` varchar(30) NOT NULL,
  `tombamento` varchar(30) NOT NULL,
  `situacao_chromebook` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluguel`
--

INSERT INTO `aluguel` (`id`, `id_aluno`, `id_chromebook`, `id_coordenador`, `nome_aluno`, `data_inicio`, `hora_inicio`, `hora_termino`, `data_termino`, `matricula_usuario`, `matricula_aluno`, `tombamento`, `situacao_chromebook`) VALUES
(2, NULL, NULL, NULL, 'Manoel', '2023-12-29', '01:10:00', '11:11:00', '1111-11-11', '321', '333', '222', 'operante'),
(3, NULL, NULL, NULL, 'Wilson', '2023-12-15', '02:08:00', '08:24:50', '2023-12-05', '321', '0404', '222', 'operante'),
(4, NULL, NULL, NULL, 'Everthon', '2023-12-05', '08:18:48', '18:49:24', '2023-12-06', '321', '333', '222', 'inoperante'),
(5, NULL, NULL, NULL, 'Wilson', '2023-12-05', '08:29:08', '21:13:54', '2023-12-07', '321', '0404', '222', 'inoperante'),
(6, NULL, NULL, NULL, 'Everthon', '2023-12-06', '18:48:22', '10:03:28', '2024-06-08', '321', '333', '222', 'operante'),
(7, NULL, NULL, NULL, 'Everthon', '2024-06-08', '10:10:40', '10:11:38', '2024-06-08', '444', '333', '555', 'operante');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `id` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `curso` varchar(70) NOT NULL,
  `periodo` char(1) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `turma` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`id`, `matricula`, `nome`, `curso`, `periodo`, `turno`, `turma`) VALUES
(2, '333', 'Everthon', 'ADS', '3', 'noite', 'a'),
(3, '0404', 'Wilson', 'SI', '3', 'noite', 'a'),
(4, '001', 'Januario', 'direito', '2', 'tarde', 'a'),
(5, '009', 'Pipoca', 'analise e desenvolvimento de sistemas', '7', 'noite', 'b');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chromebook`
--

CREATE TABLE `chromebook` (
  `id` int(11) NOT NULL,
  `tombamento` varchar(50) NOT NULL,
  `situacao` varchar(15) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `estadoChromebook` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chromebook`
--

INSERT INTO `chromebook` (`id`, `tombamento`, `situacao`, `descricao`, `estadoChromebook`) VALUES
(2, '222', 'Operante', '123', ''),
(3, '555', 'Inoperante', 'Ã isso aÃ­', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenador`
--

CREATE TABLE `coordenador` (
  `id` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `coordenador`
--

INSERT INTO `coordenador` (`id`, `matricula`, `nome`, `senha`) VALUES
(1, '321', 'Everthon', '321'),
(4, '0101', 'Queijo', '123'),
(5, '24', 'Jonas', '123'),
(7, '444', 'Luiz', '444'),
(8, '456', 'Herinque Aguiar', '456');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aluno_id` (`fk_id_aluno`),
  ADD KEY `fk_aluguel_id` (`fk_id_aluguel`);

--
-- Índices de tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_aluno` (`id_aluno`),
  ADD KEY `fk_id_chromebook` (`id_chromebook`),
  ADD KEY `fk_id_coordenador` (`id_coordenador`);

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chromebook`
--
ALTER TABLE `chromebook`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `coordenador`
--
ALTER TABLE `coordenador`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `aluguel`
--
ALTER TABLE `aluguel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `chromebook`
--
ALTER TABLE `chromebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `coordenador`
--
ALTER TABLE `coordenador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `fk_aluguel_id` FOREIGN KEY (`fk_id_aluguel`) REFERENCES `aluguel` (`id`),
  ADD CONSTRAINT `fk_aluno_id` FOREIGN KEY (`fk_id_aluno`) REFERENCES `aluno` (`id`);

--
-- Restrições para tabelas `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `fk_id_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`),
  ADD CONSTRAINT `fk_id_chromebook` FOREIGN KEY (`id_chromebook`) REFERENCES `chromebook` (`id`),
  ADD CONSTRAINT `fk_id_coordenador` FOREIGN KEY (`id_coordenador`) REFERENCES `coordenador` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
