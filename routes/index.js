var express = require('express');
var router = express.Router();


const indexController = require("../controllers/indexController")
router.get('/', indexController.vistaDeindex)
router.get('/search', indexController.searchProduct)

module.exports = router;
