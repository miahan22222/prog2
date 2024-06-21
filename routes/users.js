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


let validationsLogin =[
  body('mail')
  .notEmpty().withMessage('Debes ingresar un email').bail()
  .custom(function (value) {
    return db.Usuario.findOne({
      where: {mail: value},
    })
    .then(function (result) {
      if(!result){
       throw new Error ("El email ingresado no existe");
      }     
    })   
  }),

body('contrasenia')
.notEmpty().withMessage('Debes ingresar una contra').bail()
.custom(function (value, {req}) {
  return db.Usuario.findOne({
    where: {mail: req.body.mail},
  })
  .then(function (result) {
    if (result){
      let check  = bcrypt.compareSync(value, result.contrasenia);
      if(!check){
      throw new Error ("La contrasenia no es correcta");
    } 

    }
      })
  })
]

const usersController = require('../controllers/usersController');


router.get("/register", usersController.vistaDeRegister)
router.post('/register', validations, usersController.storeRegister);
router.get("/login", usersController.vistaDeLogin)
router.post("/login", validationsLogin, usersController.loginUser)
router.get("/profile", usersController.vistadeProfile);
router.get("/profile-edit", usersController.vistadeEditProfile);





module.exports = router; 