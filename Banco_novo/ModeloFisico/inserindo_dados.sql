#---Inserindo registros na tabela aluno:

INSERT INTO aluno (nome, curso, periodo, turno, turma, matricula) 
VALUES 
('João Silva', 'Engenharia de Software', '5', 'Manhã', 'A', '20240001'),
('Maria Santos', 'Ciência da Computação', '3', 'Tarde', 'B', '20240002'),
('Pedro Oliveira', 'Administração', '7', 'Noite', 'C', '20240003'),
('Ana Costa', 'Arquitetura', '2', 'Manhã', 'D', '20240004'),
('Carlos Souza', 'Direito', '4', 'Tarde', 'E', '20240005');

#-------------------------------------------------------------------------------------------
#---Inserindo registros na tabela usuário:

INSERT INTO usuario (matricula, nome, senha) 
VALUES 
('20240001', 'joao.silva', 'senha123'),
('20240002', 'maria.santos', 'senha456'),
('20240003', 'pedro.oliveira', 'senha789'),
('20240004', 'ana.costa', 'senha101'),
('20240005', 'carlos.souza', 'senha202');

#-------------------------------------------------------------------------------------------
#---Inserindo registros na tabela chromebook:

INSERT INTO chromebook (tombamento, situacao, descricao) 
VALUES 
('CB20240001', 'Disponível', 'Chromebook em bom estado'),
('CB20240002', 'Em uso', 'Chromebook com teclado danificado'),
('CB20240003', 'Disponível', 'Chromebook com pouca bateria'),
('CB20240004', 'Em manutenção', 'Chromebook com tela quebrada'),
('CB20240005', 'Disponível', 'Chromebook com carregador defeituoso');

#-------------------------------------------------------------------------------------------
#---Inserindo registros na tabela agendamento (assumindo que as matrículas existem na tabela aluno):

INSERT INTO agendamento (matricula_aluno, data_hora_inicio, fk_aluno_id) 
VALUES 
('20240001', '2024-05-15 09:00:00', '1'),
('20240002', '2024-05-16 10:30:00', '2'),
('20240003', '2024-05-17 14:00:00', '3'),
('20240004', '2024-05-18 16:00:00', '4'),
('20240005', '2024-05-19 08:00:00', '5');

#-------------------------------------------------------------------------------------------
#---Inserindo registros na tabela checa:

INSERT INTO checa (fk_chromebook_id, matricula_aluno) 
VALUES 
('1', '20240001'),
('2', '20240002'),
('3', '20240003'),
('4', '20240004'),
('5', '20240005');

#-------------------------------------------------------------------------------------------
#---Inserindo registros na tabela registro (assumindo que as chaves estrangeiras existem nas tabelas aluno, chromebook e usuário):

INSERT INTO registro (data_inicio, hora_inicio, fk_aluno_id, fk_chromebook_id, matricula_usuario) 
VALUES 
('2024-05-15', '09:00:00', '1', '1', '1'),
('2024-05-16', '10:30:00', '2', '2', '2'),
('2024-05-17', '14:00:00', '3', '3', '3'),
('2024-05-18', '16:00:00', '4', '4', '4'),
('2024-05-19', '08:00:00', '5', '5', '5');

#-------------------------------------------------------------------------------------------
#---Inserindo registros na tabela verifica:


INSERT INTO verifica (fk_chromebook_id, matricula_aluno) 
VALUES 
('1', '20240001'),
('2', '20240002'),
('3', '20240003'),
('4', '20240004'),
('5', '20240005');