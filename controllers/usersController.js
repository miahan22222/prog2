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
        if (req.session.user == undefined) {
            return res.redirect("/users/login");
        }
    
        const criterio = {
            where: {id: req.params.idUsuario},
            include : [
            
                {association: "productos",
                 } ],
                
              
    
        }
      
        db.Usuario.findOne(criterio)
        .then(function(result) {
            //return res.send(result)
           
            return res.render("profile", {usuario:result})
            })
            .catch((err) => {
            return console.log(err);
            });

    },


    showFormUpdatePerfil: function (req, res) {
        //return res.send(req.session.user)
         if (req.session.user == undefined) {
             return res.redirect("/users/login");
         }
            
         let id = req.params.idUsuario;
  
         db.Usuario.findByPk(id)
         .then((result) => {
        // return res.send(result)
         if (req.session.user.id != result.id) {
             return res.send("No podes editar un perfil que no es tuyo");
         }
           return res.render("profile-edit", {usuario: result});
         }).catch((err) => {
             return console.log(err);
         });
         
       },
 
 
 updatePerfil: function(req, res) {
  let errors = validationResult (req)
 
 
 if (errors.isEmpty()) {
     let forms = req.body;

     let filtro;
   if (forms.contrasenia == ""){
        filtro = {
         id: forms.id,
         nombre: forms.nombre,
         apellido: forms.apellido,
         mail: forms.email,
         usuario: forms.usuario,
         contrasenia: req.session.user.contrasenia,
         fechaNacimiento: forms.fecha,
         numeroDocumento: forms.dni,
         fotoPerfil: forms.fotoPerfil,
     }
     }else {
         filtro = {
             id: forms.id,
             nombre: forms.nombre,
             apellido: forms.apellido,
             mail: forms.email,
             usuario: forms.usuario,
             contrasenia: bcrypt.hashSync(forms.contrasenia, 10),
             fechaNacimiento: forms.fecha,
             numeroDocumento: forms.dni,
             fotoPerfil: forms.fotoPerfil,
         }
     }
        
         db.Usuario.update(filtro, {where: [{id: forms.id}]} )
         .then((result) => {
           return res.redirect("/users/id/"+ forms.id);
         }).catch((err) => {
           return console.log(err);
         });
    
    }else{
 
         let id = req.session.user.id
     
  
         db.Usuario.findByPk(id)
         .then((result) => {
 
           return res.render("profile-edit",{
         errors: errors.mapped(),
           old: req.body,
           usuario: result});
         
         }).catch((err) => {
             return console.log(err);
         });
         
       
 
      
      
    }
     
   
       },
 
   
 

    logout: function(req, res) {
        req.session.destroy();
        res.clearCookie("userId")
        return res.redirect("/")
    },

}

module.exports = usersController;


