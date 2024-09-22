	
CREATE TABLE paciente (
  nome_completo VARCHAR(100) NOT NULL,
  CPF BIGINT NOT NULL UNIQUE,
  ID_do_paciente SERIAL PRIMARY KEY,
  Data_de_nascimento DATE NOT NULL,
  Genero VARCHAR(50) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Cobertura_do_plano VARCHAR(100) NOT NULL
);

CREATE TABLE Paciente_Ambulatorial (
  Numero_de_chamada SERIAL UNIQUE,
  ID_do_paciente INT PRIMARY KEY,
  CONSTRAINT FK_id_do_paciente FOREIGN KEY (ID_do_paciente) REFERENCES paciente(ID_do_paciente)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Funcionario (
  ID_de_funcionario SERIAL PRIMARY KEY,
  Nome_completo VARCHAR(100) NOT NULL,
  CPF BIGINT NOT NULL UNIQUE
);

CREATE TABLE Medico (
  Tipo_de_Medico VARCHAR(100) NOT NULL,
  Numero_de_medicos_disponiveis INT NOT NULL,
  ID_de_funcionario INT PRIMARY KEY,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Funcionario(ID_de_funcionario)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Enfermeira (
  Especializacao VARCHAR(400) NOT NULL,
  Responsavel VARCHAR(200) NOT NULL,
  ID_de_funcionario INT PRIMARY KEY,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Funcionario(ID_de_funcionario)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Hospedado (
  data_de_Saida DATE NOT NULL,
  Data_de_Entrada DATE NOT NULL,
  ID_de_hospedagem SERIAL PRIMARY KEY,
  ID_de_funcionario INT NOT NULL,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Funcionario(ID_de_funcionario)
    ON UPDATE CASCADE
);

CREATE TABLE Leito (
  ID_de_leito SERIAL PRIMARY KEY,
  Disponibilidade VARCHAR(10) NOT NULL,
  Quarto_Leito INT NOT NULL,
  ID_de_hospedagem INT NOT NULL,
  FOREIGN KEY (ID_de_hospedagem) REFERENCES Hospedado(ID_de_hospedagem)
    ON UPDATE CASCADE
);

CREATE TABLE Recursos_P_Leitos (
  ID_de_Recursos_P_Leitos SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Tipo VARCHAR(100) NOT NULL
);

CREATE TABLE Alocacao_recursos_leitos (
  Quantidade INT NOT NULL,
  Data_alocacao DATE NOT NULL,
  ID_de_Recursos_P_Leitos INT NOT NULL,
  ID_de_leito INT NOT NULL,
  ID_de_funcionario INT NOT NULL,
  PRIMARY KEY (ID_de_Recursos_P_Leitos, ID_de_leito),
  FOREIGN KEY (ID_de_Recursos_P_Leitos) REFERENCES Recursos_P_Leitos(ID_de_Recursos_P_Leitos)
    ON UPDATE CASCADE,
  FOREIGN KEY (ID_de_leito) REFERENCES Leito(ID_de_leito)
    ON UPDATE CASCADE,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Enfermeira(ID_de_funcionario)
    ON UPDATE CASCADE 
);

CREATE TABLE Telefone (
  ID_telefone SERIAL PRIMARY KEY,
  telefone varchar(50) not null,
  tipo VARCHAR(50),
  ID_do_paciente INT NOT NULL,
  FOREIGN KEY (ID_do_paciente) REFERENCES paciente(ID_do_paciente)
    ON UPDATE CASCADE
);

CREATE TABLE Consulta (
  ID_consulta SERIAL PRIMARY KEY,
  data_consulta DATE NOT NULL,
  ID_do_paciente INT,
  ID_de_funcionario INT,
  FOREIGN KEY (ID_do_paciente) REFERENCES paciente(ID_do_paciente)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Medico(ID_de_funcionario)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Servico_Medico (
  Nome_do_medico_responsavel VARCHAR(100) NOT NULL,
  Procedimento VARCHAR(100) NOT NULL,
  Data DATE NOT NULL,
  ID_do_servico_Medico SERIAL PRIMARY KEY,
  Tipo VARCHAR(50) NOT NULL,
  ID_de_funcionario INT NOT NULL,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Medico(ID_de_funcionario)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);

CREATE TABLE Privado (
  Custo INT NOT NULL,
  ID_do_servico_Medico INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (ID_do_servico_Medico) REFERENCES Servico_Medico(ID_do_servico_Medico)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Publico (
  Cartao_do_SUS INT NOT NULL,
  ID_do_servico_Medico INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (ID_do_servico_Medico) REFERENCES Servico_Medico(ID_do_servico_Medico)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Particular (
  TipoDePagamento VARCHAR(100) NOT NULL,
  ID_do_servico_Medico INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (ID_do_servico_Medico) REFERENCES Privado(ID_do_servico_Medico)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Plano (
  Servicos_cobertos VARCHAR(500) NOT NULL,
  Cobertura_do_plano varchar(50) not null,
  ID_do_servico_Medico INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (ID_do_servico_Medico) REFERENCES Privado(ID_do_servico_Medico)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Paciente_Internado (
  Condicao VARCHAR(200) NOT NULL,
  ID_do_paciente INT NOT NULL,
  ID_de_hospedagem INT NOT NULL,
  PRIMARY KEY (ID_do_paciente),
  FOREIGN KEY (ID_do_paciente) REFERENCES paciente(ID_do_paciente),
  FOREIGN KEY (ID_de_hospedagem) REFERENCES Hospedado(ID_de_hospedagem)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Atendente (
  Competencias VARCHAR(200) NOT NULL,
  ID_de_funcionario INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Funcionario(ID_de_funcionario)
    ON UPDATE CASCADE
);

CREATE TABLE Laudo (
  ID_do_Laudo serial PRIMARY KEY,
  Informacoes VARCHAR(5000) NOT NULL,
  ID_do_paciente INT NOT NULL,
  nome_do_medico varchar(100) not null,
  ID_de_leito INT ,
  FOREIGN KEY (ID_do_paciente) REFERENCES paciente(ID_do_paciente)
    ON UPDATE CASCADE,
  FOREIGN KEY (ID_de_leito) REFERENCES Leito(ID_de_leito)
    ON UPDATE CASCADE
);

CREATE TABLE Medico_ServicoMedico (
  ID_do_servico_Medico INT NOT NULL,
  ID_de_funcionario INT NOT NULL,
  FOREIGN KEY (ID_do_servico_Medico) REFERENCES Servico_Medico(ID_do_servico_Medico)
    ON UPDATE CASCADE 
    ON DELETE CASCADE,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Medico(ID_de_funcionario)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Agendamento (
  ID_de_agendamento SERIAL PRIMARY KEY,
  Data DATE NOT NULL,
  Hora INT NOT NULL,
  Status VARCHAR(100),
  ID_de_funcionario INT NOT NULL,
  ID_do_paciente INT NOT NULL,
  FOREIGN KEY (ID_de_funcionario) REFERENCES Atendente(ID_de_funcionario),
  FOREIGN KEY (ID_do_paciente) REFERENCES paciente(ID_do_paciente)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

CREATE TABLE Agendamento_Servico_Medico (
  ID_de_agendamento INT NOT NULL,
  ID_do_servico_Medico INT NOT NULL,
  FOREIGN KEY (ID_de_agendamento) REFERENCES Agendamento(ID_de_agendamento)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);