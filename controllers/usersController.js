const datos = require('../db/datos')

const usersController = {
    vistaDeRegister: function (req, res) {
        return res.render("register", { productos: datos.productos, usuario: datos.usuario })
    },
    verificacionForm: function (req, res) {
        return res.render("login", { productos: datos.productos, usuario: datos.usuario })
        //no se que se tiene que ver una vez que el usuario manda el form
        //     VerificacionForm: function(req, res) {
        //console.log('Formulario recibido con los siguientes datos:',req.query)
        //return res.send("Formulario recibido correctamente. Datos: " + JSON.stringify(req.query));
    },
    vistaDeLogin: function (req, res) {
        return res.render("login", { productos: datos.productos, usuario: datos.usuario })

    },

    verificacionLogin: function (req, res) {
        return res.render("profile", { productos: datos.productos, usuario: datos.usuario })
    },

    vistadeProfile: function (req, res) {
        return res.render("profile", { productos: datos.productos, usuario: datos.usuario })

    },

    vistadeEditProfile: function (req, res) {
        return res.render("profile-edit", { productos: datos.productos, usuario: datos.usuario })

    },

}

module.exports = usersController;


