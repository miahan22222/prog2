const express = require('express');
const router = express.Router();

const productsController = require('../controllers/productsController');
router.get("/", productsController.vistaDeProducto)
router.get("/Add", productsController.vistaAdd)
module.exports= router;