const users= require('../db/datos')

const usersController= {
    vistaDeRegister: function (req, res){
        return res.render("register")
    }, 
    verificacionForm: function (req, res){
        return res.render("login")
        //no se que se tiene que ver una vez que el usuario manda el form
        //     VerificacionForm: function(req, res) {
        //console.log('Formulario recibido con los siguientes datos:',req.query)
        //return res.send("Formulario recibido correctamente. Datos: " + JSON.stringify(req.query));
    },
     vistaDeLogin: function (req,res) {
            return res.render("login")
            
        } 

}

module.exports = usersController;


