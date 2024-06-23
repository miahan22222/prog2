const express = require('express');
const router = express.Router();
const productsController = require('../controllers/productsController');
const { body } = require('express-validator');

let validationsAdd =[
    body('Imagen')
     .notEmpty().withMessage('Debes ingresar una imagen del producto').bail(),
    body('Nombre')
     .notEmpty().withMessage('Debes ingresar el nombre del producto ').bail(),
    body('Descripcion')
     .notEmpty().withMessage('Debes ingresar la descripcion del producto ').bail()
    
    ]


router.get("/", productsController.vistaDeProducto)
router.post("/Add", validationsAdd, productsController.storeProduct)
router.get("/Add", productsController.vistaAdd)

module.exports = router;