CREATE SCHEMA data2;

USE data2;


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

INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,fotoPerfil,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Joaquin", "Kusinsky", "jkusinsky@udesa.edu.ar", "Joaco123" ,"joaquito", "2005-02-19", 46582630, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHlgNK_92iWZOJKVdWe2CGQIA_Gv50ukAtA&s", DEFAULT, DEFAULT, DEFAULT);
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,fotoPerfil,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Milena", "Sorin", "msorin@udesa.edu.ar", "Milenita" ,"milenita", "2003-03-19", 43454544, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwzw_Ti47ovNmMbRwz3HaY7hDhHFeAmER6kw&s", DEFAULT, DEFAULT, DEFAULT);
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,fotoPerfil,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Mia", "Hanono", "mhanono@udesa.edu.ar", "Mimita" ,"mimita", "2003-02-19", 43242434, "https://images.pagina12.com.ar/styles/focal_content_1200x1050/public/2023-02/698649-whatsapp-20image-202023-02-17-20at-2018-26-25.jpeg?h=34bbd072&itok=lcNOmQJi", DEFAULT, DEFAULT, DEFAULT);
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,fotoPerfil,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Brian", "Gomez", "bgomez@udesa.edu.ar", "Brian" ,"brian", "2001-02-19", 44566442, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlg77gitMGTe_IbRYeF_Zxdf5_9AnCQQT0_g&s", DEFAULT, DEFAULT, DEFAULT);
INSERT INTO usuarios (id,nombre,apellido,mail,usuario,contrasenia,fechaNacimiento,numeroDocumento,fotoPerfil,createdAt,updatedAt,deletedAt)
VALUES      (DEFAULT, "Luis", "Navas", "lnavas@udesa.edu.ar", "Luis" ,"luis", "2001-02-19", 34545449, "https://media.ambito.com/p/b5055ea329f4ba55ec597ba7d48274a4/adjuntos/239/imagenes/041/575/0041575847/cuti-romero-seleccionjpg.jpg", DEFAULT, DEFAULT, DEFAULT);

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
    (DEFAULT,1, 'auto1.png', 'Toyota Corolla 2010 Blue', 'Toyota Corolla modelo 2010, color azul.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,2, 'auto2.png', 'Ford Focus 2015 Red', 'Ford Focus modelo 2015, color rojo.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,3, 'auto3.png', 'Honda Civic 2018 Black', 'Honda Civic modelo 2018, color negro.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,4, 'auto4.png', 'Chevrolet Camaro 2017 Yellow', 'Chevrolet Camaro modelo 2017, color amarillo.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,5, 'auto5.jpeg', 'BMW 3 Series 2016 Silver', 'BMW 3 Series modelo 2016, color plateado.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,1, 'auto6.jpeg', 'Mercedes-Benz CLS 2019 Gray', 'Mercedes-Benz CLS modelo 2019, color gris.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,2, 'auto7.jpeg', 'Audi A4 2014 White', 'Audi A4 modelo 2014, color blanco.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,3, 'auto8.jpeg', 'Volkswagen Jetta 2013 Black', 'Volkswagen Jetta modelo 2013, color negro.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,4, 'auto9.jpeg', 'Subaru Outback 2011 Green', 'Subaru Outback modelo 2011, color verde.',DEFAULT,DEFAULT,DEFAULT),
    (DEFAULT,5, 'auto10.jpeg', 'Mazda CX-5 2017 Blue', 'Mazda CX-5 modelo 2017, color azul.',DEFAULT,DEFAULT,DEFAULT);





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
    (DEFAULT, 1,1, '¡Excelente auto!', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 1,2, 'Me encanta este producto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 1,3, 'Buena elección.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 1,4, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 1,5, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 2,1, '¡Excelente auto!', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 2,2, 'Me encanta este producto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 2,3, 'Buena elección.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 2,4, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 2,5, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 3,1, '¡Excelente auto!', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 3,2, 'Me encanta este producto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 3,3, 'Buena elección.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 3,4, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 3,5, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 4,1, '¡Excelente auto!', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 4,2, 'Me encanta este producto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 4,3, 'Buena elección.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 4,4, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 4,5, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 5,1, '¡Excelente auto!', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 5,2, 'Me encanta este producto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 5,3, 'Buena elección.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 5,4, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 5,5, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 1,1, '¡Excelente auto!', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 2,2, 'Me encanta este producto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 3,3, 'Buena elección.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 4,4, 'El mejor modelo que he visto.', DEFAULT, DEFAULT, NULL),
    (DEFAULT, 5,5, 'Muy buen producto, lo recomiendo.', DEFAULT, DEFAULT, NULL);