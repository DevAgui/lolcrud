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