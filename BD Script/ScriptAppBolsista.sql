CREATE DATABASE desafio;
USE desafio;

CREATE TABLE bolsistas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255),
    data_nascimento DATE NOT NULL,
    curso VARCHAR(255) NOT NULL,
    comprovante VARCHAR(255) NULL
)
