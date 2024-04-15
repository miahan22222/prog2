const register= require('../db/datos')

const usersController= {
    VistaDeRegister: function (req, res){
        return res.render("register")
    }, 
    VerificacionForm: function (req, res){
        return res.render("login")
        //no se que se tiene que ver una vez que el usuario manda el form
        //     VerificacionForm: function(req, res) {
        //console.log('Formulario recibido con los siguientes datos:',req.query)
        //return res.send("Formulario recibido correctamente. Datos: " + JSON.stringify(req.query));
    },
     VistaDeLogin: function (req,res) {
            return res.render("login")
            
        } 

}

module.exports = usersController;


