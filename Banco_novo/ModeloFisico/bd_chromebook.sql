

CREATE DATABASE bd_chromebook;

-- Estrutura para tabela aluno

CREATE TABLE aluno (
  id_aluno VARCHAR(30) NOT NULL AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  curso varchar(70) NOT NULL,
  periodo char(1) NOT NULL,
  turno varchar(10) NOT NULL,
  turma char(1) NOT NULL,
  matricula varchar(50) NOT NULL
);



-- Estrutura para tabela usuario

CREATE TABLE usuario (
  id_usuario VARCHAR(30) PRIMARY KEY AUTO_INCREMENT,
  matricula varchar(50) NOT NULL,
  nome varchar(50) NOT NULL,
  senha varchar(50) NOT NULL
);


-- Estrutura para tabela chromebook

CREATE TABLE chromebook (
  id_chromebook VARCHAR(30) PRIMARY KEY AUTO_INCREMENT,
  tombamento varchar(50) NOT NULL,
  situacao varchar(15) NOT NULL,
  descricao varchar(255) DEFAULT NULL
);


-- Estrutura para tabela coordenador

CREATE TABLE agendamento(
    id_agendamento VARCHAR(30) PRIMARY KEY AUTO_INCREMENT,
    matricula_aluno VARCHAR(30) NOT NULL,
    data_hora_inicio DATETIME NOT NULL,
    fk_aluno_id VARCHAR(30) NOT NULL REFERENCES aluno(id_aluno)
);


-- Estrutura da tabela checa

CREATE TABLE checa(
    id_checa VARCHAR(30) PRIMARY KEY AUTO_INCREMENT,
    fk_chromebook_id VARCHAR(30) REFERENCES chromebook(id_chromebook),
    matricula_aluno VARCHAR(30) REFERENCES usuario(id_usuario)
);


-- Estrutura da tabela aluguel

CREATE TABLE registro (
  id_registro VARCHAR(30) NOT NULL AUTO_INCREMENT,
  data_inicio date NOT NULL,
  hora_inicio time NOT NULL,
  fk_aluno_id VARCHAR(30) NOT NULL REFERENCES aluno(id_aluno),
  fk_chromebook_id VARCHAR(30) NOT NULL REFERENCES chromebook(id_chromebook),
  matricula_usuario VARCHAR(30) NOT NULL REFERENCES usuario(id_usuario)
);



CREATE TABLE verifica(
    id_verifica VARCHAR(30) NOT NULL AUTO_INCREMENT,
    fk_chromebook_id VARCHAR(30) REFERENCES chromebook(id_chromebook),
    matricula_aluno VARCHAR(30) REFERENCES usuario(id_usuario)
);

------------------------------ INSERT ----------------------------
