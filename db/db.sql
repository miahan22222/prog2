CREATE SCHEMA data;

USE data;


CREATE TABLE usuarios (
/* 	nombreColumna 		tipoDato 		Restricciones */
    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre 				VARCHAR(250) 	NOT NULL,
    apellido 			VARCHAR(250) 	NOT NULL,
    mail 				VARCHAR(250) 	NOT NULL,
    usuario 			VARCHAR(250) 	NOT NULL,
    contrasenia 		VARCHAR(250) 	NOT NULL,
    fechaNacimiento 	DATE 			NOT NULL,
    numeroDocumento 	INT 			NOT NULL,
    fotoPerfil 			VARCHAR(250) 	NOT NULL,
    createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deletedAt 			TIMESTAMP 		NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE productos(
	id					INT 		UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idUsuario			INT			UNSIGNED,
    imagenProducto 		VARCHAR(250)	NOT NULL,
    nombreProducto 		VARCHAR(250)	NOT NULL,
    descripcionProducto	VARCHAR(250)	NOT NULL,
	createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deletedAt 			TIMESTAMP 		NULL ON UPDATE CURRENT_TIMESTAMP,
    	
	
	FOREIGN KEY 		(idUsuario)	REFERENCES usuarios(id)

);

CREATE TABLE comentarios(
	id 					INT 		UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idUsuario			INT 		UNSIGNED,		
    idProducto			INT 		UNSIGNED,
    textoComentario 	VARCHAR(1000)	NOT NULL,
	createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deletedAt 			TIMESTAMP 		NULL ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY 		(idUsuario)	REFERENCES usuarios(id),
    FOREIGN KEY			(idProducto)REFERENCES productos(id)
);