<<<<<<< HEAD
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

--
-- Banco de dados: `aluguelchromebook`
--

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
(3, NULL, NULL, NULL, 'Wilson', '2023-12-15', '02:08:00', NULL, NULL, '321', '0404', '222', 'operante');

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
(2, '333', 'Everthon', 'SI', '3', 'noite', 'a'),
(3, '0404', 'Wilson', 'SI', '3', 'noite', 'a');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chromebook`
--

CREATE TABLE `chromebook` (
  `id` int(11) NOT NULL,
  `tombamento` varchar(50) NOT NULL,
  `situacao` varchar(15) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chromebook`
--

INSERT INTO `chromebook` (`id`, `tombamento`, `situacao`, `descricao`) VALUES
(2, '222', 'Operante', '123');

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
(1, '321', 'Everthon', '321');

--
-- Índices para tabelas despejadas
--

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
-- AUTO_INCREMENT de tabela `aluguel`
--
ALTER TABLE `aluguel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `chromebook`
--
ALTER TABLE `chromebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `coordenador`
--
ALTER TABLE `coordenador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

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
=======
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

--
-- Banco de dados: `aluguelchromebook`
--

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
(3, NULL, NULL, NULL, 'Wilson', '2023-12-15', '02:08:00', NULL, NULL, '321', '0404', '222', 'operante');

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
(2, '333', 'Everthon', 'SI', '3', 'noite', 'a'),
(3, '0404', 'Wilson', 'SI', '3', 'noite', 'a');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chromebook`
--

CREATE TABLE `chromebook` (
  `id` int(11) NOT NULL,
  `tombamento` varchar(50) NOT NULL,
  `situacao` varchar(15) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chromebook`
--

INSERT INTO `chromebook` (`id`, `tombamento`, `situacao`, `descricao`) VALUES
(2, '222', 'Operante', '123');

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
(1, '321', 'Everthon', '321');

--
-- Índices para tabelas despejadas
--

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
-- AUTO_INCREMENT de tabela `aluguel`
--
ALTER TABLE `aluguel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `chromebook`
--
ALTER TABLE `chromebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `coordenador`
--
ALTER TABLE `coordenador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

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
>>>>>>> 0d9d6ee19248578d7b02ded9b8ed74e1a299f82b
