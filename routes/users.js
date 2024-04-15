const express = require('express');
const router = express.Router();

/* GET users listing. 
router.get('/users', function(req, res, next) {
  res.send('respond with a resource');
}); */
const usersController= require('../controllers/usersController');

router.get("/register", usersController.vistaDeRegister)
router.get("/register/verify", usersController.verificacionForm);
router.get("/login",usersController.vistaDeLogin)


module.exports = router; 