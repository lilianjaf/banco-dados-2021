CREATE SCHEMA Biblioteca DEFAULT CHARACTER SET utf8;

USE Biblioteca;
CREATE TABLE Usuario
(CPF VARCHAR(11) PRIMARY KEY NOT NULL,
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(255) NOT NULL,
Telefone VARCHAR(14) NULL
);

USE Biblioteca;
CREATE TABLE Autor
(AutorID int PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
Data_nascimento DATE NOT NULL
);

USE Biblioteca;
CREATE TABLE Editora
(EditoraID int PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
Data_fundacao YEAR NOT NULL
);

USE Biblioteca;
CREATE TABLE Livro
(ISBN VARCHAR(10) PRIMARY KEY NOT NULL,
Titulo VARCHAR(100) NOT NULL,
Data_publicacao YEAR NOT NULL,
QTD_paginas int NOT NULL,
Idioma ENUM('PT-BR', 'EN', 'ES'),
EditoraID int NOT NULL,
FOREIGN KEY (EditoraID) REFERENCES Editora(EditoraID)
);

USE Biblioteca;
CREATE TABLE Livro_Autores
(Livro_AutoresID int PRIMARY KEY AUTO_INCREMENT,
ISBN VARCHAR(10) NOT NULL,
AutorID int NOT NULL,
FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
);

USE Biblioteca;
CREATE TABLE Emprestimo
(EmprestimoID int PRIMARY KEY AUTO_INCREMENT,
Data_retirada DATE NOT NULL,
QTD_dias_para_emprestimo int NOT NULL DEFAULT 20,
Devolvido bit NOT NULL DEFAULT 0,
ISBN VARCHAR(10) NOT NULL,
CPF VARCHAR(11) NOT NULL,
FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
FOREIGN KEY (CPF) REFERENCES Usuario(CPF)
);

