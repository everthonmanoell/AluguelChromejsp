CREATE DATABASE aluguelchromebook;
USE aluguelchromebook;

-- Tabelas --
CREATE TABLE aluno (
  id_aluno VARCHAR(30) PRIMARY KEY NOT NULL,
  nome VARCHAR(50) NOT NULL,
  curso VARCHAR(70) NOT NULL,
  periodo CHAR(1) NOT NULL,
  turno VARCHAR(10) NOT NULL,
  turma CHAR(1) NOT NULL,
  matricula VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
  id_usuario VARCHAR(30) PRIMARY KEY NOT NULL,
  matricula VARCHAR(50) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT NULL,
  FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);

CREATE TABLE chromebook (
  id_chromebook VARCHAR(30) PRIMARY KEY NOT NULL,
  tombo VARCHAR(50) NOT NULL,
  SituacaoParaEmprestimo VARCHAR(15) NOT NULL DEFAULT 'Disponível',
  estadoDoChromeobok VARCHAR(15) NOT NULL DEFAULT 'Operante',
  descricao VARCHAR(255) DEFAULT NULL,
  status_agendamento BOOLEAN DEFAULT FALSE
);

CREATE TABLE agendamento (
  id_agendamento VARCHAR(30) PRIMARY KEY NOT NULL,
  matricula_aluno VARCHAR(30) NOT NULL,
  data_hora_inicio DATETIME NOT NULL,
  fk_aluno_id VARCHAR(30) NOT NULL,
  FOREIGN KEY (matricula_aluno) REFERENCES usuario(matricula),
  FOREIGN KEY (fk_aluno_id) REFERENCES aluno(id_aluno)
);

CREATE TABLE registro (
  id_registro VARCHAR(30) PRIMARY KEY NOT NULL,
  data_inicio DATE NOT NULL,
  hora_inicio TIME NOT NULL,
  fk_aluno_id VARCHAR(30) NOT NULL,
  fk_chromebook_id VARCHAR(30) NOT NULL,
  matricula_usuario VARCHAR(30) NOT NULL,
  data_fim DATE DEFAULT NULL,
  FOREIGN KEY (fk_aluno_id) REFERENCES aluno(id_aluno),
  FOREIGN KEY (fk_chromebook_id) REFERENCES chromebook(id_chromebook),
  FOREIGN KEY (matricula_usuario) REFERENCES usuario(matricula)
);

-- TRIGGERS --

CREATE TRIGGER agendar_chromebook 
BEFORE INSERT ON agendamento
FOR EACH ROW
BEGIN
  UPDATE chromebook
  SET status_agendamento = TRUE
  WHERE id_chromebook = NEW.fk_chromebook_id;
END;

CREATE TRIGGER desagendar_chromebook 
AFTER DELETE ON agendamento
FOR EACH ROW
BEGIN
  UPDATE chromebook
  SET status_agendamento = FALSE
  WHERE id_chromebook = OLD.fk_chromebook_id;
END;

CREATE TRIGGER registrar_emprestimo 
BEFORE INSERT ON registro
FOR EACH ROW
BEGIN
  UPDATE chromebook
  SET SituacaoParaEmprestimo = 'Emprestado',
  WHERE id_chromebook = NEW.fk_chromebook_id;
END;

CREATE TRIGGER registrar_devolucao 
BEFORE UPDATE ON registro
FOR EACH ROW
BEGIN
  IF NEW.data_fim IS NOT NULL AND OLD.data_fim IS NULL THEN
    UPDATE chromebook
    SET SituacaoParaEmprestimo = 'Disponível'
    WHERE id_chromebook = NEW.fk_chromebook_id;
  END IF;
END;


