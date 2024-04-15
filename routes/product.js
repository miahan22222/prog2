const express = require('express');
const router = express.Router();

const productsControlller = require('../controllers/productsController');
router.get("/product", productsControlller.VistaDeProducto)

module.exports= router;