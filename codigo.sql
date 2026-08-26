CREATE DATABASE PATIO_POLICIA;

USE PATIO_POLICIA;

CREATE TABLE PATIO (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR (255) NOT NULL,
    CAPACIDADE INT NOT NULL
);

CREATE TABLE POLICIAL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME_COMPLETO VARCHAR (255) NOT NULL,
    CPF CHAR(14) UNIQUE NOT NULL,
    DISTINTIVO BOOLEAN NOT NULL
);

CREATE TABLE VEICULO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    MARCA VARCHAR (255) NOT NULL,
    MODELO VARCHAR (255) NOT NULL,
    PLACA CHAR (7) NOT NULL UNIQUE
);

CREATE TABLE INFRACAO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR (255) NOT NULL,
    COD  VARCHAR (100) NOT NULL UNIQUE
);

CREATE TABLE APREENSAO(
    FK_VEICULO INT NOT NULL,
    FK_INFRACAO INT NOT NULL,
    FK_POLICIAL INT NOT NULL,
    FK_PATIO INT NOT NULL,
    FOREIGN KEY (FK_VEICULO) REFERENCES VEICULO (ID),
    FOREIGN KEY (FK_INFRACAO) REFERENCES INFRACAO (ID),
    FOREIGN KEY (FK_POLICIAL) REFERENCES POLICIAL (ID),
    FOREIGN KEY (FK_PATIO) REFERENCES PATIO (ID)
);

INSERT INTO PATIO VALUES 
(0, "RUA AGENTE 007", 20);

INSERT INTO POLICIAL VALUES 
(0, "James Bonde", "111-222-333.44", TRUE);

INSERT INTO VEICULO VALUES 
(0, "HONDA", "CB500", "ESV1A75");

INSERT INTO INFRACAO VALUES 
(0, "Dirigir sem CNH ou PPD", "ART162-I"),
(0, "Dirigir com CNH cassada ou suspensa", "ART162-II"),
(0, "Entregar veículo a pessoa não habilitada", "ART164"),
(0, "Dirigir sob influência de álcool", "ART165"),
(0, "Recusar-se ao teste de alcoolemia", "ART165-A"),
(0, "Excesso de velocidade até 20%", "ART218-I"),
(0, "Excesso de velocidade entre 20% e 50%", "ART218-II"),
(0, "Excesso de velocidade acima de 50%", "ART218-III"),
(0, "Avançar sinal vermelho ou parada obrigatória", "ART208"),
(0, "Dirigir usando celular", "ART252-V"),
(0, "Não usar cinto de segurança", "ART167"),
(0, "Transportar criança sem dispositivo de retenção", "ART168"),
(0, "Ultrapassar pela contramão em local proibido", "ART201"),
(0, "Estacionar em local proibido", "ART181-IV"),
(0, "Estacionar em vaga de deficiente/idoso sem credencial", "ART181-XVII"),
(0, "Fazer ou receber chamadas em motocicleta sem fone", "ART252-V-MOTO"),
(0, "Dirigir com CNH vencida há mais de 30 dias", "ART162-V"),
(0, "Deixar de manter distância de segurança", "ART192"),
(0, "Conduzir motocicleta sem capacete", "ART244-I"),
(0, "Transitar em local/horário não permitido pelo rodízio", "ART187-I"),
(0, "Dirigir veículo sem placas ou com placas ilegíveis", "ART230-V"),
(0, "Não dar preferência a pedestre na faixa", "ART214-I"),
(0, "Fazer ultrapassagem indevida em faixa contínua", "ART206-III"),
(0, "Retornar em local proibido", "ART206-II"),
(0, "Deixar de acionar farol baixo em rodovia durante o dia", "ART186-III"),
(0, "Trafegar com o veículo em mau estado de conservação", "ART230-V-COND"),
(0, "Conduzir veículo sem documento de porte obrigatório", "ART232"),
(0, "Fumar no interior do veículo com criança", "ART252-VII"),
(0, "Conduzir veículo com licenciamento (CRLV) vencido", "ART230-V-LIC");

INSERT INTO APREENSAO VALUES
(1, 1, 1, 1),
(1, 29, 1, 1);

SELECT * FROM PATIO;
SELECT * FROM POLICIAL;
SELECT * FROM VEICULO;
SELECT * FROM INFRACAO;
SELECT * FROM APREENSAO;

SELECT V.PLACA, V.MARCA, V.MODELO, I.COD AS COD_INFRACAO, P.NOME_COMPLETO AS POLICIAL, PT.RUA AS PATIO FROM APREENSAO AS A
JOIN VEICULO  AS V  ON A.FK_VEICULO  = V.ID
JOIN INFRACAO AS I  ON A.FK_INFRACAO = I.ID
JOIN POLICIAL AS P  ON A.FK_POLICIAL = P.ID
JOIN PATIO    AS PT ON A.FK_PATIO    = PT.ID
