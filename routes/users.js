const express = require('express');
const router = express.Router();

/* GET users listing. 
router.get('/users', function(req, res, next) {
  res.send('respond with a resource');
}); */
const usersController = require('../controllers/usersController');

router.get("/register", usersController.vistaDeRegister)
router.get("/register/verify", usersController.verificacionForm);
router.get("/login", usersController.vistaDeLogin)
router.get("/login/verify", usersController.verificacionLogin);
router.get("/profile", usersController.vistadeProfile);
router.get("/profile-edit", usersController.vistadeEditProfile);



module.exports = router; 