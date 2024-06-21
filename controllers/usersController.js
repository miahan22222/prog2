const db = require('../database/models');
const bcrypt = require("bcryptjs");
const {validationResult} = require('express-validator')

const usersController = {
    vistaDeRegister: function (req, res) {
        if (req.session.user != undefined){
            return res.redirect('/');
        }else {
        return res.render("register")}
    },
    storeRegister: function (req, res) {
        let errors = validationResult (req)
        //return res.send(errors)
        if (errors.isEmpty()) {
            let forms = req.body;
    
            let user = {
                nombre: forms.nombre,
                apellido: forms.apellido,
                usuario: forms.usuario,
                mail: forms.email,
                contrasenia: bcrypt.hashSync(forms.contra, 10),
                fechaNacimiento: forms.fecha,
                numeroDocumento: forms.dni,
                fotoPerfil: forms.fotoPerfil,
        
            }
            
            db.Usuario.create(user)
            .then((result) => {
                return res.redirect("/users/login");
            }).catch((err) => {
                return console.log(err);
            });
    
        }else{
            return res.render('register', {
                    errors: errors.mapped(),
                old: req.body
            })
        }
      
    
        },
    
vistaDeLogin: function (req, res) {
        return res.render("login")

   }, 
loginUser: (req, res)=> {
        let errors = validationResult (req)
        
        if (errors.isEmpty()) {
            let forms = req.body;
            db.Usuario.findOne({
                where: [{mail: forms.mail}]
            })
            .then((result) => {

                    req.session.user = result;
    
                    if (forms.recordarme != undefined) {
                        res.cookie("userId", result.id, {maxAge: 1000 * 60 * 15});                        
                    }
    
                    return res.redirect("/");
                } 
                
            ).catch((err) => {
                return console.log(err);
            });
            
        }else{
            return res.render('login', {
                    errors: errors.mapped(),
                old: req.body
            })
        }
    },

    vistadeProfile: function (req, res) {
        return res.render("profile", { productos: datos.productos, usuario: datos.usuario })

    },

    vistadeEditProfile: function (req, res) {
        return res.render("profile-edit", { productos: datos.productos, usuario: datos.usuario })

    },

}

module.exports = usersController;


