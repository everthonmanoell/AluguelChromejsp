-- Utiliza o banco de dados master
USE master;

-- Remove o banco de dados aluguelchromebook caso já exista
IF DB_ID('aluguelchromebook') > 0
   DROP DATABASE aluguelchromebook;

-- Cria o banco de dados aluguelchromebook
CREATE DATABASE aluguelchromebook;
GO

-- Utiliza o banco de dados aluguelchromebook
USE aluguelchromebook;

----------------------------------------------------------------------------------------------------------------
-- Tabela Aluno
CREATE TABLE Aluno (
    mat_aluno CHAR(9) PRIMARY KEY,
    turno CHAR(10),
    senha VARCHAR(50),
    periodo CHAR(1),
    turma VARCHAR(50),
    curso VARCHAR(50),
    nome_aluno VARCHAR(50)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Usuario
CREATE TABLE Usuario (
    mat_usuario CHAR(9) PRIMARY KEY,
    nome_usuario VARCHAR(50),
    senha VARCHAR(50)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Chromebook
CREATE TABLE Chromebook (
    tombamento CHAR(9) PRIMARY KEY,
    descricao VARCHAR(500),
    estado_chromebook VARCHAR(50),
    situacao_chromebook VARCHAR(20)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Check
CREATE TABLE Checa (
    id_check CHAR(9) PRIMARY KEY,
    fk_tombamento CHAR(9) NOT NULL,
    fk_mat_usuario CHAR(9) NOT NULL,
    descricao VARCHAR(500),
    situacao VARCHAR(50),
    FOREIGN KEY (fk_tombamento) REFERENCES Chromebook(tombamento),
    FOREIGN KEY (fk_mat_usuario) REFERENCES Usuario(mat_usuario)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Agendamento
CREATE TABLE Agendamento (
    id_agendamento CHAR(9) PRIMARY KEY,
    mat_aluno CHAR(9) NOT NULL,
    nome_aluno VARCHAR(50),
    data_hora_agendamento DATETIME,
    situacao_agendamento VARCHAR(20),
    FOREIGN KEY (mat_aluno) REFERENCES Aluno(mat_aluno)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Registro
CREATE TABLE Registro (
    id_registro CHAR(9) PRIMARY KEY,
    fk_tombamento CHAR(9) NOT NULL,
    fk_id_agendamento CHAR(9) NOT NULL,
    fk_mat_aluno CHAR(9) NOT NULL,
    fk_nome_aluno VARCHAR(50) NOT NULL,
    fk_mat_usuario CHAR(9) NOT NULL,
    data_hora_retirada DATETIME,
    data_hora_devolucao DATETIME,
    data_hora_agendamento DATETIME,
    FOREIGN KEY (fk_tombamento) REFERENCES Chromebook(tombamento),
    FOREIGN KEY (fk_id_agendamento) REFERENCES Agendamento(id_agendamento),
    FOREIGN KEY (fk_mat_aluno) REFERENCES Aluno(mat_aluno),
    FOREIGN KEY (fk_mat_usuario) REFERENCES Usuario(mat_usuario),
    FOREIGN KEY (fk_mat_aluno, fk_nome_aluno) REFERENCES Aluno(mat_aluno, nome_aluno)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Efetua
CREATE TABLE Efetua (
    mat_usuario CHAR(9),
    id_registro CHAR(9),
    mat_aluno CHAR(9),
    PRIMARY KEY(mat_usuario, id_registro, mat_aluno),
    FOREIGN KEY (mat_usuario) REFERENCES Usuario(mat_usuario),
    FOREIGN KEY (id_registro) REFERENCES Registro(id_registro),
    FOREIGN KEY (mat_aluno) REFERENCES Aluno(mat_aluno)
);

----------------------------------------------------------------------------------------------------------------
-- Tabela Verifica
CREATE TABLE Verifica (
    tombamento CHAR(9),
    id_registro CHAR(9),
    id_agendamento CHAR(9),
    PRIMARY KEY(tombamento, id_registro, id_agendamento),
    FOREIGN KEY (tombamento) REFERENCES Chromebook(tombamento),
    FOREIGN KEY (id_registro) REFERENCES Registro(id_registro),
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento)
);

----------------------------------------------------------------------------------------------------------------
-- Trigger para atualizar a situação do Chromebook quando um check é feito
CREATE TRIGGER trg_atualiza_situacao_chromebook
ON Checa
AFTER INSERT
AS
BEGIN
    UPDATE Chromebook
    SET situacao_chromebook = i.situacao
    FROM Chromebook c
    INNER JOIN inserted i ON c.tombamento = i.fk_tombamento;
END;

----------------------------------------------------------------------------------------------------------------
-- Procedure para inserir um novo aluno
CREATE PROCEDURE sp_inserir_aluno
    @mat_aluno CHAR(9),
    @turno CHAR(10),
    @senha VARCHAR(50),
    @periodo CHAR(1),
    @turma VARCHAR(50),
    @curso VARCHAR(50),
    @nome_aluno VARCHAR(50)
AS
BEGIN
    INSERT INTO Aluno (mat_aluno, turno, senha, periodo, turma, curso, nome_aluno)
    VALUES (@mat_aluno, @turno, @senha, @periodo, @turma, @curso, @nome_aluno);
END;

----------------------------------------------------------------------------------------------------------------
-- Procedure para inserir um novo registro de check
CREATE PROCEDURE sp_inserir_check
    @id_check CHAR(9),
    @fk_tombamento CHAR(9),
    @fk_mat_usuario CHAR(9),
    @descricao VARCHAR(500),
    @situacao VARCHAR(50)
AS
BEGIN
    INSERT INTO Checa (id_check, fk_tombamento, fk_mat_usuario, descricao, situacao)
    VALUES (@id_check, @fk_tombamento, @fk_mat_usuario, @descricao, @situacao);
END;

----------------------------------------------------------------------------------------------------------------
-- Procedure para inserir um novo registro de agendamento
CREATE PROCEDURE sp_inserir_agendamento
    @id_agendamento CHAR(9),
    @mat_aluno CHAR(9),
    @nome_aluno VARCHAR(50),
    @data_hora_agendamento DATETIME,
    @situacao_agendamento VARCHAR(20)
AS
BEGIN
    INSERT INTO Agendamento (id_agendamento, mat_aluno, nome_aluno, data_hora_agendamento, situacao_agendamento)
    VALUES (@id_agendamento, @mat_aluno, @nome_aluno, @data_hora_agendamento, @situacao_agendamento);
END;

----------------------------------------------------------------------------------------------------------------
-- Procedure para inserir um novo registro de retirada e devolução
CREATE PROCEDURE sp_inserir_registro
    @id_registro CHAR(9),
    @fk_tombamento CHAR(9),
    @fk_id_agendamento CHAR(9),
    @fk_mat_aluno CHAR(9),
    @fk_mat_usuario CHAR(9),
    @data_hora_retirada DATETIME,
    @data_hora_devolucao DATETIME,
    @data_hora_agendamento DATETIME
AS
BEGIN
    INSERT INTO Registro (id_registro, fk_tombamento, fk_id_agendamento, fk_mat_aluno, fk_mat_usuario, data_hora_retirada, data_hora_devolucao, data_hora_agendamento)
    VALUES (@id_registro, @fk_tombamento, @fk_id_agendamento, @fk_mat_aluno, @fk_mat_usuario, @data_hora_retirada, @data_hora_devolucao, @data_hora_agendamento);
END;

-- Inserir dados na tabela Aluno usando a procedure
EXEC sp_inserir_aluno '2021001', 'Manhã', 'senha123', '1', '1A', 'Engenharia', 'João Silva';
EXEC sp_inserir_aluno '2021002', 'Tarde', 'senha456', '2', '2B', 'Ciência da Computação', 'Maria Souza';

-- Inserir dados na tabela Usuario
INSERT INTO Usuario (mat_usuario, nome_usuario, senha)
VALUES
    ('U2021001', 'João Silva', 'senha123'),
    ('U2021002', 'Maria Souza', 'senha456');

-- Inserir dados na tabela Chromebook
INSERT INTO Chromebook (tombamento, descricao, estado_chromebook, situacao_chromebook)
VALUES
    ('CHROME001', 'Chromebook modelo X', 'Novo', 'Operante'),
    ('CHROME002', 'Chromebook modelo Y', 'Usado', 'Operante');

-- Inserir dados na tabela Checa usando a procedure
EXEC sp_inserir_check '1', 'CHROME001', 'U2021001', 'Check realizado', 'Operante';
EXEC sp_inserir_check '2', 'CHROME002', 'U2021002', 'Check realizado', 'Operante';

-- Inserir dados na tabela Agendamento usando a procedure
EXEC sp_inserir_agendamento 'AGEND001', '2021001', 'João Silva', '2024-06-08 09:00:00', 'Pendente';
EXEC sp_inserir_agendamento 'AGEND002', '2021002', 'Maria Souza', '2024-06-08 10:00:00', 'Pendente';

-- Inserir dados na tabela Registro usando a procedure
EXEC sp_inserir_registro 'REG001', 'CHROME001', 'AGEND001', '2021001', 'U2021001', '2024-06-08 09:00:00', NULL, '2024-06-08 09:00:00';
EXEC sp_inserir_registro 'REG002', 'CHROME002', 'AGEND002', '2021002', 'U2021002', '2024-06-08 10:00:00', NULL, '2024-06-08 10:00:00';


