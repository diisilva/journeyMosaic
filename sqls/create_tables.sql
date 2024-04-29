-- Criação da tabela Usuário
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    cpf_rg VARCHAR(20),
    -- Mais campos conforme necessário
);
-- Criação da tabela Viagem
CREATE TABLE Viagem (
    id_viagem SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    destino VARCHAR(255) NOT NULL,
    data_ida DATE NOT NULL,
    data_volta DATE NOT NULL,
    -- Mais campos conforme necessário
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);
-- Criação da tabela Hospedagem
CREATE TABLE Hospedagem (
    id_hospedagem SERIAL PRIMARY KEY,
    id_viagem INT NOT NULL,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    valor FLOAT,
    data_checkin DATE,
    data_checkout DATE,
    hora_checkin TIME,
    hora_checkout TIME,
    FOREIGN KEY (id_viagem) REFERENCES Viagem (id_viagem)
);
-- Criação da tabela Atividade
CREATE TABLE Atividade (
    id_atividade SERIAL PRIMARY KEY,
    id_viagem INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    local VARCHAR(255),
    hora TIME,
    data DATE,
    duracao INT,
    -- Mais campos conforme necessário
    FOREIGN KEY (id_viagem) REFERENCES Viagem (id_viagem)
);
-- Criação da tabela Transporte (super-tabela para Avião e Ônibus)
CREATE TABLE Transporte (
    id_transporte SERIAL PRIMARY KEY,
    tipo_transporte VARCHAR(50) NOT NULL,
    id_viagem INT NOT NULL,
    -- Mais campos conforme necessário
    FOREIGN KEY (id_viagem) REFERENCES Viagem (id_viagem)
);
-- Criação da tabela Avião, ajustando a chave primária para id_transporte
CREATE TABLE Aviao (
    id_transporte INT PRIMARY KEY,
    numero_voo VARCHAR(255),
    porta_embarque VARCHAR(255),
    bagagem VARCHAR(255),
    empresa VARCHAR(255),
    -- Mais campos conforme necessário
    FOREIGN KEY (id_transporte) REFERENCES Transporte (id_transporte)
);
-- Criação da tabela Ônibus, ajustando a chave primária para id_transporte
CREATE TABLE Onibus (
    id_transporte INT PRIMARY KEY,
    numerolinha VARCHAR(255),
    plataforma_embarque VARCHAR(255),
    restricoes TEXT,
    empresa VARCHAR(255),
    -- Mais campos conforme necessário
    FOREIGN KEY (id_transporte) REFERENCES Transporte (id_transporte)
);
CREATE TABLE Trem (
    id_transporte INT PRIMARY KEY,
    empresa VARCHAR(255),
    numero_trem VARCHAR(255),
    vagao VARCHAR(255),
    estacao_partida VARCHAR(255),
    numero_assento VARCHAR(255),
    -- Mais campos conforme necessário
    FOREIGN KEY (id_transporte) REFERENCES Transporte (id_transporte)
);
-- Nota: As notificações de calendário podem ser implementadas com triggers ou processos em background dependendo da infraestrutura.
-- Índices adicionais e ajustes de performance devem ser feitos conforme a necessidade.