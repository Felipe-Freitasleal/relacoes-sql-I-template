-- Active: 1674045226318@@127.0.0.1@3306


-- Práticas
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL 
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, password)
VALUES 
('u0001', 'João Pedrinho', 'jp@email.com','jp123'),
('u0002', 'Igor', 'igor@email', 'igor123');

SELECT * FROM users;

INSERT INTO phones (id, phone_number, user_id)
VALUES
('p0001', '5571123456789', 'u0001'),
('p0002', '5521098765432', 'u0001'),
('p0003', '5531194820385', 'u0002'),
('p0004', '5571111111234', 'u0001');

SELECT * FROM phones;

INSERT INTO phones (id, phone_number, user_id)
VALUES
('p0006', '5571143456408', 'u0002');

DELETE FROM phones
WHERE id = "p0006";

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

INSERT INTO licenses (id, register_number, category)
VALUES ("l0001", "0001", "AB"),
("l0002", "0002", "A");

SELECT * FROM licenses;

CREATE TABLE drives (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    lincese_key TEXT UNIQUE NOT NULL,
    FOREIGN KEY (lincese_key) REFERENCES licenses(id)
);

INSERT INTO drives (id, name, email, password, lincese_key)
VALUES ("d0001", "José", "jose@email.com", "12345", "l0001"),
("d0002", "Amanda","amanda@email.com", "54321", "l0002");

SELECT * FROM licenses
INNER JOIN drives
ON drives.lincese_key = licenses.id;

CREATE TABLE contrato_exclusivo (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    type TEXT NOT NULL
);

INSERT INTO contrato_exclusivo (id, type)
VALUES ("ce0001", "CLT"),
("ce0002", "PJ");

DROP TABLE contrato_exclusivo;

SELECT * FROM contrato_exclusivo;

CREATE TABLE contratado (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    contrato_key TEXT UNIQUE NOT NULL,
    FOREIGN KEY (contrato_key) REFERENCES contrato_exclusivo(id)
);

INSERT INTO contratado (id, name, contrato_key)
VALUES ("c0001", "Adolfo", "ce0001"),
("c0002", "JOsefa", "ce0002");

SELECT * FROM contrato_exclusivo
INNER JOIN contratado
ON contratado.contrato_key = contrato_exclusivo.id;