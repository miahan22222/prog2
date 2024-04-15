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

INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,foto,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Joaquin", "Kusinsky", "jkusinsky@udesa.edu.ar", "Joaco123" ,"*****", "2005-02-19", 46582630, "fotodeperfil", DEFAULT, DEFAULT, DEFAULT)
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,foto,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Milena", "Sorin", "msorin@udesa.edu.ar", "3ea123" ,"*****", "2003-03-19", 43454544, "fotodeperfil", DEFAULT, DEFAULT, DEFAULT)
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,foto,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Mia", "Hanono", "mhanono@udesa.edu.ar", "nfueua" ,"*****", "2003-02-19", 43242434, "fotodeperfil", DEFAULT, DEFAULT, DEFAULT)
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,foto,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Brian", "Gomez", "bgomez@udesa.edu.ar", "uenws" ,"*****", "2001-02-19", 44566442, "fotodeperfil", DEFAULT, DEFAULT, DEFAULT)
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,foto,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Luis", "Navas", "lnavas@udesa.edu.ar", "ejfjfn" ,"*****", "2001-02-19", 34545449, "fotodeperfil", DEFAULT, DEFAULT, DEFAULT)

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

INSERT INTO productos (id,idUsuario, imagenProducto, nombreProducto, descripcionProducto,createdAt,updatedAt,deletedAt)
VALUES 
    (DEFAULT,DEFAULT, 'toyota_corolla_2010_blue.jpg', 'Toyota Corolla 2010 Blue', 'Toyota Corolla modelo 2010, color azul.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'ford_focus_2015_red.jpg', 'Ford Focus 2015 Red', 'Ford Focus modelo 2015, color rojo.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'honda_civic_2018_black.jpg', 'Honda Civic 2018 Black', 'Honda Civic modelo 2018, color negro.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'chevrolet_camaro_2017_yellow.jpg', 'Chevrolet Camaro 2017 Yellow', 'Chevrolet Camaro modelo 2017, color amarillo.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'bmw_3_series_2016_silver.jpg', 'BMW 3 Series 2016 Silver', 'BMW 3 Series modelo 2016, color plateado.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'mercedes_benz_cls_2019_gray.jpg', 'Mercedes-Benz CLS 2019 Gray', 'Mercedes-Benz CLS modelo 2019, color gris.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'audi_a4_2014_white.jpg', 'Audi A4 2014 White', 'Audi A4 modelo 2014, color blanco.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'volkswagen_jetta_2013_black.jpg', 'Volkswagen Jetta 2013 Black', 'Volkswagen Jetta modelo 2013, color negro.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'subaru_outback_2011_green.jpg', 'Subaru Outback 2011 Green', 'Subaru Outback modelo 2011, color verde.'DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,DEFAULT, 'mazda_cx5_2017_blue.jpg', 'Mazda CX-5 2017 Blue', 'Mazda CX-5 modelo 2017, color azul.'DEFAULT,DEFAULT,DEFAULT);





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

INSERT INTO comentarios (id,idUsuario, idProducto, textoComentario, createdAt, updatedAt, deletedAt)
VALUES 
    (DEFAULT, 1,1, '¡Excelente auto!', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,1, 'Me encanta este producto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,1, 'Buena elección.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,2, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,2, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, DEFAULT);
    (DEFAULT,1,2, '¡Excelente auto!', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 2,3, 'Me encanta este producto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,DEFAULT, 'Buena elección.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT,1, DEFAULT, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT,1, DEFAULT, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, DEFAULT);
    (DEFAULT, 1,DEFAULT, '¡Excelente auto!', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,DEFAULT, 'Me encanta este producto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,DEFAULT, 'Buena elección.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,DEFAULT, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, 1,DEFAULT, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, DEFAULT);
    (DEFAULT, DEFAULT, '¡Excelente auto!', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Me encanta este producto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Buena elección.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, DEFAULT);
    (DEFAULT, DEFAULT, '¡Excelente auto!', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Me encanta este producto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Buena elección.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, DEFAULT);
    (DEFAULT, DEFAULT, '¡Excelente auto!', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Me encanta este producto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Buena elección.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, DEFAULT),
    (DEFAULT, DEFAULT, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, DEFAULT);
