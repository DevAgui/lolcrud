CREATE TABLE usuario
(
  CodUsu INT NOT NULL AUTO_INCREMENT,
  AliasUsu VARCHAR(50) NOT NULL,
  Contrasena VARCHAR(30) NOT NULL,
  Administrador CHAR(1) CHECK(Administrador ='s'),
  PRIMARY KEY (CodUsu)
);

CREATE TABLE listado_campeon
(
  CodCamp INT NOT NULL AUTO_INCREMENT,
  NomCamp VARCHAR(45) NOT NULL,
  LineaCamp VARCHAR(10) NOT NULL,
  RolHabCamp VARCHAR(15) NOT NULL,
  DescCamp VARCHAR(250) NOT NULL,
  CodUsu INT NOT NULL,
  PRIMARY KEY (CodCamp),
  FOREIGN KEY (CodUsu) REFERENCES usuario(CodUsu)
      ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO usuario (AliasUsu, Contrasena, Administrador)
VALUES ('folktergeist', '1234', NULL),
       ('alvaroski', '5678', NULL),
       ('alucio', 'alucio', NULL),
       ('admin', 'admin', 's');

INSERT INTO listado_campeon (NomCamp, LineaCamp, RolHabCamp, DescCamp, CodUsu)
VALUES ('Blitzcrank', 'Support', 'Tanque', 'Blitzcrank es un autómata enorme, casi indestructible, creado originalmente para el tratamiento de residuos tóxicos.', 1),
       ('Amumu', 'Jungla', 'Tanque', 'Cuenta la leyenda que Amumu es un alma solitaria y melancólica de la vieja Shurima que vaga por el mundo en busca de un amigo.', 1),
       ('Khazix', 'Jungla', 'Asesino', 'El Vacío crece y el Vacío se adapta; verdades que son más evidentes en KhaZix que en ningún otro de sus innumerables engendros.', 1),
       ('Nautilus', 'Support', 'Tanque', 'El gigante acorazado Nautilus, una leyenda solitaria tan antigua como los pecios de Aguas Estancadas, recorre las turbias aguas que rodean las costas de las Islas de la Llama Azul.', 1),
       ('Lux', 'Support', 'Mago', 'Luxanna Crownguard procede de Demacia, un reino insular en el que las habilidades mágicas se observan con temor y suspicacia.', 1),
       ('Blitzcrank', 'Support', 'Tanque', 'Blitzcrank es un autómata enorme, casi indestructible, creado originalmente para el tratamiento de residuos tóxicos.', 2),
       ('Amumu', 'Jungla', 'Tanque', 'Cuenta la leyenda que Amumu es un alma solitaria y melancólica de la vieja Shurima que vaga por el mundo en busca de un amigo.', 2),
       ('Khazix', 'Jungla', 'Asesino', 'El Vacío crece y el Vacío se adapta; verdades que son más evidentes en KhaZix que en ningún otro de sus innumerables engendros.', 2),
       ('Nautilus', 'Support', 'Tanque', 'El gigante acorazado Nautilus, una leyenda solitaria tan antigua como los pecios de Aguas Estancadas, recorre las turbias aguas que rodean las costas de las Islas de la Llama Azul.', 2),
       ('Lux', 'Support', 'Mago', 'Luxanna Crownguard procede de Demacia, un reino insular en el que las habilidades mágicas se observan con temor y suspicacia.', 2),
       ('Nami', 'Support', 'Mago', 'Nami, una joven y testaruda vastaya marina, fue la primera de la tribu marai en abandonar las olas', 3);
