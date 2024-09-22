INSERT INTO paciente (nome_completo, CPF, Data_de_nascimento, Genero, Endereco, Cobertura_do_plano) VALUES
('João Silva', 12345678901, '1980-05-12', 'Masculino', 'Rua A, 123', 'Plano A'),
('Maria Souza', 23456789012, '1992-11-22', 'Feminino', 'Rua B, 456', 'Plano B'),
('Carlos Pereira', 34567890123, '1985-02-15', 'Masculino', 'Rua C, 789', 'Plano C'),
('Ana Martins', 45678901234, '1978-07-30', 'Feminino', 'Rua D, 101', 'Plano D'),
('Pedro Rocha', 56789012345, '1990-10-05', 'Masculino', 'Rua E, 102', 'Plano E'),
('Julia Santos', 67890123456, '1988-04-18', 'Feminino', 'Rua F, 103', 'Plano F'),
('Roberto Lima', 78901234567, '1975-03-09', 'Masculino', 'Rua G, 104', 'Plano G'),
('Carla Melo', 89012345678, '1995-06-20', 'Feminino', 'Rua H, 105', 'Plano H'),
('Fernando Costa', 90123456789, '1982-12-13', 'Masculino', 'Rua I, 106', 'Plano I'),
('Lúcia Gonçalves', 12309876543, '1998-09-25', 'Feminino', 'Rua J, 107', 'Plano J');

INSERT INTO Paciente_Ambulatorial (ID_do_paciente) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO Funcionario (Nome_completo, CPF) VALUES
('Dr. Ricardo Costa', '12345678900'),
('Dra. Vanessa Lopes', '98765432100'),
('Enf. Paulo Oliveira', '11122233344'),
('Enf. Clara Souza', '22233344455'),
('Atendente Lucas Martins', '33344455566'),
('Atendente Carla Silva', '44455566677'),
('Enf. Fernanda Almeida', '55566677788'),
('Atendente Ana Paula', '66677788899'),
('Dr. Tiago Moreira', '77788899900'),
('Enf. Marcos Santos', '88899900011');

INSERT INTO Medico (Tipo_de_Medico, Numero_de_medicos_disponiveis, ID_de_funcionario) VALUES
('Cardiologista', 3, 1), ('Neurologista', 2, 2), ('Pediatra', 2, 9);

INSERT INTO Enfermeira (Especializacao, Responsavel, ID_de_funcionario) VALUES
('UTI', 'Dra. Vanessa Lopes', 3), ('Pediatria', 'Dr. Tiago Moreira', 4),
('Emergência', 'Dr. Ricardo Costa', 7), ('Clínica Geral', 'Dra. Clara Souza', 10);

INSERT INTO Hospedado (data_de_Saida, Data_de_Entrada, ID_de_funcionario) VALUES
('2024-01-20', '2024-01-10', 3), ('2024-02-12', '2024-02-02', 4),
('2024-03-15', '2024-03-05', 7), ('2024-04-20', '2024-04-10', 10);

INSERT INTO Leito (Disponibilidade, Quarto_Leito, ID_de_hospedagem) VALUES
('Ocupado', 101, 1), ('Livre', 102, 2), ('Ocupado', 103, 3), ('Livre', 104, 4);

INSERT INTO Recursos_P_Leitos (Nome, Tipo) VALUES
('Oxigênio', 'Equipamento'), ('Monitor Cardíaco', 'Equipamento'),
('Bomba de Infusão', 'Equipamento'), ('Ventilador Mecânico', 'Equipamento');
INSERT INTO Alocacao_recursos_leitos (Quantidade, Data_alocacao, ID_de_Recursos_P_Leitos, ID_de_leito, ID_de_funcionario) VALUES
(2, '2024-01-10', 1, 1, 3), (1, '2024-02-02', 2, 2, 4), (1, '2024-03-05', 3, 3, 7), (3, '2024-04-10', 4, 4, 10);

INSERT INTO Telefone (telefone, tipo, ID_do_paciente) VALUES
('111111111', 'Celular', 1), ('222222222', 'Celular', 2), ('333333333', 'Residencial', 3),
('444444444', 'Celular', 4), ('555555555', 'Residencial', 5), ('666666666', 'Celular', 6),
('777777777', 'Residencial', 7), ('888888888', 'Celular', 8), ('999999999', 'Residencial', 9), ('000000000', 'Celular', 10);

INSERT INTO Consulta (data_consulta, ID_do_paciente, ID_de_funcionario) VALUES
('2024-01-15', 1, 1), ('2024-01-16', 2, 2), ('2024-01-17', 3, 9), 
('2024-01-18', 4, 1), ('2024-01-19', 5, 2), ('2024-01-20', 6, 9),
('2024-01-21', 7, 1), ('2024-01-22', 8, 2), ('2024-01-23', 9, 9), ('2024-01-24', 10, 1);


INSERT INTO Servico_Medico (Nome_do_medico_responsavel, Procedimento, Data, Tipo, ID_de_funcionario) VALUES
('Dr. Ricardo Costa', 'Cirurgia', '2024-01-10', 'Emergência', 1), 
('Dra. Vanessa Lopes', 'Consulta', '2024-01-15', 'Ambulatorial', 2),
('Dr. Tiago Moreira', 'Exame', '2024-01-20', 'Diagnóstico', 9);

INSERT INTO Privado (Custo, ID_do_servico_Medico) VALUES
(500, 1), (700, 2), (300, 3);

INSERT INTO Publico (Cartao_do_SUS, ID_do_servico_Medico) VALUES
(123456789, 1), (987654321, 2), (555666777, 3);

INSERT INTO Particular (TipoDePagamento, ID_do_servico_Medico) VALUES
('Cartão', 1), ('Dinheiro', 2), ('Boleto', 3);

INSERT INTO Plano (Servicos_cobertos, Cobertura_do_plano, ID_do_servico_Medico) VALUES
('Consultas, Exames', 'Plano A', 1), ('Cirurgia, Internação', 'Plano B', 2), ('Exames', 'Plano C', 3);

INSERT INTO Paciente_Internado (Condicao, ID_do_paciente, ID_de_hospedagem) VALUES
('Estável', 1, 1), ('Crítico', 2, 2), ('Recuperação', 3, 3);

INSERT INTO Atendente (Competencias, ID_de_funcionario) VALUES
('Atendimento ao paciente', 5), ('Agendamento', 6), ('Triagem', 8);

INSERT INTO Laudo (Informacoes, ID_do_paciente, nome_do_medico, ID_de_leito) VALUES
('Paciente em recuperação.', 1, 'Dr. Ricardo Costa', 1), 
('Paciente estável.', 2, 'Dra. Vanessa Lopes', 2),
('Paciente com melhora significativa.', 3, 'Dr. Tiago Moreira', 3);

INSERT INTO Medico_ServicoMedico (ID_do_servico_Medico, ID_de_funcionario) VALUES
(1, 1), (2, 2), (3, 9);

INSERT INTO Agendamento (Data, Hora, Status, ID_de_funcionario, ID_do_paciente) VALUES
('2024-01-10', 10, 'Agendado', 5, 1), ('2024-01-11', 11, 'Agendado', 6, 2),
('2024-01-12', 12, 'Cancelado', 8, 3);

INSERT INTO Agendamento_Servico_Medico (ID_de_agendamento, ID_do_servico_Medico) VALUES
(1, 1), (2, 2), (3, 3);













