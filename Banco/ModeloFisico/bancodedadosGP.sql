USE master;
IF DB_ID('aluguelchromebook')>0
   DROP DATABASE aluguelchromebook
CREATE DATABASE aluguelchromebook;
GO
USE aluguelchromebook;
----------------------------------------------------------------------------------------------------------------
CREATE TABLE aluno (
	matricula       VARCHAR(30) PRIMARY KEY not null,
	nome            VARCHAR(50) NOT NULL,
	curso           VARCHAR(50) NOT NULL,
	periodo         VARCHAR(10) NOT NULL,
	turno           VARCHAR(10) NOT NULL,
);
----------------------------------------------------------------------------------------------------------------
CREATE TABLE chromebook (
	tombamento VARCHAR(50) PRIMARY KEY not null,
	situacao   VARCHAR(10) DEFAULT 'operante' CHECK (situacao IN  ('operante', 'inoperante', 'locado')) --DEFAULT
);
----------------------------------------------------------------------------------------------------------------
CREATE TABLE instituicao (
	cnpj      CHAR(14)    PRIMARY KEY NOT NULL,
	ra_social VARCHAR(50) NOT NULL
);
----------------------------------------------------------------------------------------------------------------
CREATE TABLE coordenador (
	id_coordenador      INT PRIMARY KEY IDENTITY(1000,10) NOT NULL,
    nome  VARCHAR(50)   NOT NULL,
    cargo VARCHAR(50)   NOT NULL,
    fk_instituicao_cnpj CHAR(14) NOT NULL,
    CONSTRAINT fk_instituicao_cnpj
        FOREIGN KEY (fk_instituicao_cnpj) REFERENCES instituicao(cnpj)
        ON DELETE CASCADE
);
----------------------------------------------------------------------------------------------------------------
CREATE TABLE checa (
	id        INT PRIMARY KEY NOT NULL IDENTITY,
	fk_chromebook_tombamento VARCHAR(50) NOT NULL,
	data_hora DATETIME     NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	situacao  VARCHAR(10)  NOT NULL,
	fk_id_coordenador INT  NOT NULL,
	CONSTRAINT fk_chromebook_tombamento FOREIGN KEY (fk_chromebook_tombamento) REFERENCES chromebook(tombamento),
	CONSTRAINT fk_id_coordenador FOREIGN KEY (fk_id_coordenador) REFERENCES coordenador(id_coordenador)
);
----------------------------------------------------------------------------------------------------------------
CREATE TABLE registro (
	id_registro int      PRIMARY KEY IDENTITY NOT NULL,
	multa       MONEY    DEFAULT 0,
	data_hora   DATETIME NOT NULL,
	fk_aluno_matricula VARCHAR(30) NOT NULL,
	fk_chromebook_tombamento VARCHAR(50) NOT NULL,
	fk_id_coordenador INT NOT NULL, 
	CONSTRAINT fk_aluno_matricula FOREIGN KEY (fk_aluno_matricula)
	REFERENCES aluno(matricula), 
	CONSTRAINT fk_chromebook_tombamento_reg FOREIGN KEY (fk_chromebook_tombamento)
	REFERENCES chromebook(tombamento) ON DELETE CASCADE, -- exclus�o em cascata (CASCADE)
	CONSTRAINT fk_id_coordenador_reg FOREIGN KEY (fk_id_coordenador) REFERENCES coordenador(id_coordenador)
);
----------------------------------------------------------------------------------------------------------------
-- USANDO O "UNIQUE"

-- Tabela aluno
ALTER TABLE aluno
ADD CONSTRAINT UC_aluno_matricula UNIQUE (matricula);
----------------------------------------------------------------------------------------------------------------
-- Tabela chromebook
ALTER TABLE chromebook
ADD CONSTRAINT UC_chromebook_tombamento UNIQUE (tombamento);
----------------------------------------------------------------------------------------------------------------
INSERT INTO aluno (matricula, nome, curso, periodo, turno)
VALUES 
    ('2021001', 'Jo�o da Silva', 'Engenharia Civil', '2022/01', 'Manh�'),
    ('2021002', 'Maria Souza', 'Ci�ncia da Computa��o', '2022/01', 'Tarde'),
    ('2021003', 'Pedro Almeida', 'Administra��o', '2022/02', 'Noite'),
    ('2021004', 'Ana Santos', 'Medicina', '2021/02', 'Manh�'),
    ('2021005', 'Lucas Oliveira', 'Direito', '2022/01', 'Tarde'),
    ('2021006', 'Laura Mendes', 'Psicologia', '2022/02', 'Noite'),
    ('2021007', 'Jo�o Silva', 'Engenharia Civil', '2021/01', 'Manh�'),
    ('2021008', 'Maria Souza', 'Administra��o', '2021/01', 'Tarde'),
    ('2021009', 'Pedro Almeida', 'Direito', '2021/01', 'Noite'),
    ('2021010', 'Ana Santos', 'Psicologia', '2021/01', 'Manh�'),
    ('2021011', 'Lucas Oliveira', 'Ci�ncias Cont�beis', '2021/01', 'Tarde'),
    ('2021012', 'Laura Mendes', 'Medicina', '2021/01', 'Noite'),
    ('2021013', 'Rafaela Costa', 'Engenharia de Computa��o', '2021/01', 'Manh�'),
    ('2021014', 'Marcos Santos', 'Administra��o', '2021/01', 'Tarde'),
    ('2021015', 'Fernanda Silva', 'Direito', '2021/01', 'Noite'),
    ('2021016', 'Paulo Almeida', 'Psicologia', '2021/01', 'Manh�'),
    ('2021017', 'Camila Souza', 'Ci�ncias Cont�beis', '2021/02', 'Tarde'),
    ('2021018', 'Marcelo Mendes', 'Medicina', '2021/02', 'Noite'),
    ('2021019', 'Isabela Costa', 'Engenharia de Computa��o', '2021/02', 'Manh�'),
    ('2021020', 'Gustavo Santos', 'Administra��o', '2021/02', 'Tarde'),
    ('2021021', 'Carolina Silva', 'Direito', '2021/02', 'Noite'),
    ('2021022', 'Thiago Almeida', 'Psicologia', '2021/02', 'Manh�'),
    ('2021023', 'Juliana Oliveira', 'Ci�ncias Cont�beis', '2021/02', 'Tarde'),
    ('2021024', 'Roberto Mendes', 'Medicina', '2021/02', 'Noite'),
    ('2021025', 'Larissa Costa', 'Engenharia de Computa��o', '2021/02', 'Manh�'),
    ('2021026', 'Vinicius Santos', 'Administra��o', '2021/02', 'Tarde');

INSERT INTO chromebook (tombamento, situacao)
VALUES
    ('CHROME001', 'operante'),
    ('CHROME002', 'operante'),
    ('CHROME003', 'operante'),
    ('CHROME004', 'operante'),
    ('CHROME005', 'operante'),
    ('CHROME006', 'operante'),
    ('CHROME007', 'operante'),
    ('CHROME008', 'operante'),
    ('CHROME009', 'operante'),
    ('CHROME010', 'operante'),
    ('CHROME011', 'operante'),
    ('CHROME012', 'operante'),
    ('CHROME013', 'operante'),
    ('CHROME014', 'operante'),
    ('CHROME015', 'operante'),
    ('CHROME016', 'operante'),
    ('CHROME017', 'operante'),
    ('CHROME018', 'operante'),
    ('CHROME019', 'operante'),
    ('CHROME020', 'operante'),
    ('CHROME021', 'operante'),
    ('CHROME022', 'operante'),
    ('CHROME023', 'operante'),
    ('CHROME024', 'operante'),
    ('CHROME025', 'operante'),
    ('CHROME026', 'operante'),
    ('CHROME027', 'operante'),
    ('CHROME028', 'operante'),
    ('CHROME029', 'operante'),
    ('CHROME030', 'operante'),
    ('CHROME031', 'operante'),
    ('CHROME032', 'operante'),
    ('CHROME033', 'operante'),
    ('CHROME034', 'operante'),
    ('CHROME035', 'operante'),
    ('CHROME036', 'operante'),
    ('CHROME037', 'operante'),
    ('CHROME038', 'operante'),
    ('CHROME039', 'operante'),
    ('CHROME040', 'operante'),
    ('CHROME041', 'operante'),
    ('CHROME042', 'operante'),
    ('CHROME043', 'operante'),
    ('CHROME044', 'operante'),
    ('CHROME045', 'operante'),
    ('CHROME046', 'operante'),
    ('CHROME047', 'operante'),
    ('CHROME048', 'operante'),
    ('CHROME049', 'operante'),
    ('CHROME050', 'operante');

INSERT INTO instituicao(cnpj, ra_social)
VALUES
		('17257227000110', 'Instituto de Ensino Superior');

INSERT INTO coordenador (nome, cargo, fk_instituicao_cnpj)
VALUES ('Jo�o Silva', 'Coordenador de TI', '17257227000110'),
		('Joaquim Andrade', 'Coordenador de TI', '17257227000110'),
		('Jos� Pereira', 'Coordenador de TI', '17257227000110');

INSERT INTO checa (fk_chromebook_tombamento, data_hora, descricao, situacao, fk_id_coordenador)
VALUES
    ('CHROME001', '16-01-2023 13:45:00', 'Problemas no touchpad identificados', 'Inoperante', 1000),
	('CHROME001', '17-01-2023 10:04:00', 'Problemas no touchpad resolvido', 'Onoperante', 1000),
	('CHROME002', '17-07-2023 11:30:00', 'Locado', 'Locado', 1010),
	('CHROME001', '18-07-2023 09:15:00', 'Retorno OK', 'Locado', 1000),
	('CHROME001', '20-07-2023 10:30:00', 'Retorno OK', 'Operante', 1000),
	('CHROME002', '21-07-2023 08:45:00', 'Retorno OK', 'Operante', 1020),
	('CHROME002', '22-07-2023 15:15:00', 'Problemas no �udio identificados', 'Inoperante', 1000),
	('CHROME008', '23-07-2023 12:30:00', 'Checagem OK', 'Operante', 1010),
	('CHROME001', '24-07-2023 10:45:00', 'Problemas de performance identificados', 'Inoperante', 1000),
	('CHROME002', '25-07-2023 09:00:00', 'Retorno OK', 'Operante', 1020),
	('CHROME010', '26-07-2023 15:30:00', 'Retorno OK', 'Operante', 1010),
	('CHROME020', '27-07-2023 12:45:00', 'Problemas de conectividade Wi-Fi identificados', 'Inoperante', 1020),
	('CHROME049', '28-07-2023 10:00:00', 'Retorno OK', 'Operante', 1020),
	('CHROME035', '29-07-2023 16:15:00', 'Problemas no leitor de cart�o identificados', 'Inoperante', 1000),
	('CHROME044', '30-07-2023 13:30:00', 'Atualiza��o de software realizada', 'Operante', 1020),
	('CHROME022', '31-07-2023 11:45:00', 'Problemas no bot�o de energia identificados', 'Inoperante', 1010),
	('CHROME012', '01-08-2023 09:00:00', 'Retorno OK', 'Operante', 1000),
	('CHROME008', '02-08-2023 15:15:00', 'Problemas no ventilador identificados', 'Inoperante', 1010),
	('CHROME006', '03-08-2023 12:30:00', 'Retorno OK', 'Operante', 1000),
	('CHROME007', '04-08-2023 10:45:00', 'Problemas de compatibilidade identificados', 'Inoperante', 1010),
	('CHROME032', '05-08-2023 09:00:00', 'Retorno OK', 'Operante', 1020),
	('CHROME021', '06-08-2023 15:30:00', 'Problemas na webcam identificados', 'Inoperante', 1020),
	('CHROME020', '07-08-2023 12:45:00', 'locado', 'Operante', 1000),
	('CHROME011', '08-08-2023 10:00:00', 'Problemas de inicializa��o identificados', 'Inoperante', 1010),
	('CHROME020', '09-08-2023 16:15:00', 'Retorno OK', 'Operante', 1000),
	('CHROME001', '10-08-2023 13:30:00', 'Problemas no leitor �ptico identificados', 'Inoperante', 1020),
	('CHROME050', '11-08-2023 11:45:00', 'Retorno OK', 'Operante', 1020),
	('CHROME033', '12-08-2023 09:00:00', 'Problemas na tela touch identificados', 'Inoperante', 1010),
	('CHROME044', '13-08-2023 15:15:00', 'Retorno OK', 'Operante', 1010);

INSERT INTO registro (multa, data_hora, fk_aluno_matricula, fk_chromebook_tombamento, fk_id_coordenador)
VALUES
    (NULL, '17-07-2023 11:30:00', '2021001', 'CHROME002', 1010),
    (NULL, '18-07-2023 09:15:00', '2021002', 'CHROME001', 1000),
    (NULL, '20-07-2023 10:30:00', '2021003', 'CHROME001', 1000),
    (NULL, '21-07-2023 08:45:00', '2021004', 'CHROME002', 1020),
    (10, '22-07-2023 15:15:00', '2021005', 'CHROME002', 1000),
    (NULL, '23-07-2023 12:30:00', '2021006', 'CHROME008', 1010),
    (NULL, '24-07-2023 10:45:00', '2021007', 'CHROME001', 1000),
    (NULL, '25-07-2023 09:00:00', '2021008', 'CHROME002', 1020),
    (NULL, '26-07-2023 15:30:00', '2021009', 'CHROME010', 1010),
    (20, '27-07-2023 12:45:00', '2021010', 'CHROME020', 1020),
    (NULL, '28-07-2023 10:00:00', '2021011', 'CHROME049', 1020),
    (NULL, '29-07-2023 16:15:00', '2021012', 'CHROME035', 1000),
    (NULL, '30-07-2023 13:30:00', '2021013', 'CHROME044', 1020),
    (NULL, '31-07-2023 11:45:00', '2021014', 'CHROME022', 1010),
    (NULL, '01-08-2023 09:00:00', '2021015', 'CHROME012', 1000),
    (NULL, '02-08-2023 15:15:00', '2021016', 'CHROME008', 1010),
    (20, '03-08-2023 12:30:00', '2021017', 'CHROME006', 1000),
    (NULL, '04-08-2023 10:45:00', '2021018', 'CHROME007', 1010),
    (NULL, '05-08-2023 09:00:00', '2021019', 'CHROME032', 1020),
    (NULL, '06-08-2023 15:30:00', '2021020', 'CHROME021', 1020),
    (NULL, '07-08-2023 12:45:00', '2021021', 'CHROME020', 1000),
    (NULL, '08-08-2023 10:00:00', '2021022', 'CHROME011', 1010),
    (10, '09-08-2023 16:15:00', '2021023', 'CHROME020', 1000),
    (NULL, '10-08-2023 13:30:00', '2021024', 'CHROME001', 1020),
    (NULL, '11-08-2023 11:45:00', '2021025', 'CHROME050', 1020),
    (NULL, '12-08-2023 09:00:00', '2021026', 'CHROME033', 1010);
----------------------------------------------------------------------------------------------------------------

--	-- CRIANDO UMA TRIGGER
CREATE TRIGGER atualiza_situacao
ON checa
FOR INSERT
AS
BEGIN
      UPDATE chromebook SET situacao = (SELECT situacao FROM INSERTED) WHERE tombamento = (SELECT fk_chromebook_tombamento FROM INSERTED);
END;

SELECT * FROM checa;

-- CRIANDO UMA FUN��O
CREATE FUNCTION contar_alunos_curso(@nome_curso VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @total_alunos INT;
    SET @total_alunos = (SELECT COUNT(*) FROM aluno WHERE curso = @nome_curso);
    RETURN @total_alunos;
END;

--CONSULTANDO UMA FUN��O (OBS CRIAR PARA DEPOIS CONSULTAR)
SELECT dbo.contar_alunos_curso('Engenharia Civil') AS total_engenharia;



-- CRIANDO PROCEDURE
CREATE PROCEDURE sp_total_alunos_curso
    @nome_curso VARCHAR(50),
    @total_alunos INT OUTPUT
AS
BEGIN
    SELECT @total_alunos = COUNT(*) FROM aluno WHERE curso = @nome_curso;
END;


--CONSULTANDO UMA PROCEDURE (OBS CRIAR PARA DEPOIS CONSULTAR)
DECLARE @total_alunos INT;
EXEC sp_total_alunos_curso 'Engenharia Civil', @total_alunos OUTPUT;
SELECT @total_alunos AS total_engenharia;

--CRIANDO INDICES:
-- Criar �ndice na tabela aluno
CREATE INDEX idx_aluno_curso ON aluno (curso);

-- Criar �ndice na tabela registro
CREATE INDEX idx_registro_matricula ON registro (fk_aluno_matricula);

-- DESSA FORMA FICA MAIS RAPIDO FAZER OS SELECT
SELECT *
FROM aluno
WHERE curso = 'Engenharia Civil';
--
SELECT *
FROM registro
WHERE fk_aluno_matricula = '2021001';

-- select para saber os possiveis cursos que exitem alunos matriculados usando o DISTICT n�o retorna os duplicados.
SELECT DISTINCT a.curso
FROM aluno AS a

-- USANDO O JOIN
SELECT a.nome, r.multa, r.fk_chromebook_tombamento, r.data_hora, r.id_registro
FROM aluno a
JOIN registro r ON a.matricula = r.fk_aluno_matricula
WHERE r.fk_chromebook_tombamento = 'CHROME001';

-- USANDO SUM
SELECT SUM(multa) AS total_multas
FROM registro;

-- USANDO SUM
SELECT COUNT(*) AS total_alunos
FROM aluno;

-- USANDO AVG
SELECT AVG(multa) AS media_multas
FROM registro;

-- USANDO MAX
SELECT MAX(multa) AS maior_multa
FROM registro;

-- USANDO MIN
SELECT MIN(multa) AS menor_multa
FROM registro;