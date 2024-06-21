const express = require('express');
const router = express.Router();
const db = require('../database/models');
const bcrypt = require("bcryptjs");

const { body } = require('express-validator');
let validations = [
  body('nombre')
  .notEmpty()
  .withMessage('Debes ingresar un nombre')
  .bail(),

  body('usuario')
  .notEmpty()
  .withMessage('Debes ingresar un nombre de usuario')
  .bail(),

  body('email')
  .notEmpty().withMessage('Debes ingresar un email').bail()
  //isEmail
  .custom(function (value) {
    return db.Usuario.findOne({
      where: {mail: value},
    })
    .then(function (result) {
      if(result){
       throw new Error ("El email ingresado ya existe");
      }     
    })   
    
  }),
  body('contra')
  .notEmpty().withMessage('Debes ingresar una contrasenia').bail()
  .isLength({min:4}).withMessage('Debes ingresar una contrasenia con minimo 4 caracteres').bail(),
]

const usersController = require('../controllers/usersController');


router.get("/register", usersController.vistaDeRegister)
router.post('/register', validations, usersController.storeRegister);
router.get("/login", usersController.vistaDeLogin)
router.get("/login/verify", usersController.verificacionLogin);
router.get("/profile", usersController.vistadeProfile);
router.get("/profile-edit", usersController.vistadeEditProfile);





module.exports = router; 