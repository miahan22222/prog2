const db = require("../database/models")
const op = db.Sequelize.Op;
const {validationResult } = require('express-validator')

const productsController = {
    vistaDeProducto: function (req, res) {
        return res.render("product", { productos: datos.productos, usuario: datos.usuario })
    },

    vistaAdd: function (req, res) {
        if (req.session.user == undefined) {
            return res.redirect("/users/login");
        }
        return res.render("product-add")
    },

    storeProduct: function (req, res) {

        let errors = validationResult(req)
      
         if (errors.isEmpty()) {
        let forms = req.body;


        let product = {
            include: [
                { association: "usuario" }
            ],
            nombreProducto: forms.Nombre,
            imagenProducto: forms.Imagen,
            descripcionProducto: forms.Descripcion,
            idUsuario: req.session.user.id,

        }

        db.Producto.create(product)
            .then((result) => {
                //return res.send(result)
                return res.redirect("/");
            }).catch((err) => {
                return console.log(err);
            });

        }
        else {
            return res.render('product-add', {
                errors: errors.mapped(),
            old: req.body
        })
    }


    },


}

module.exports = productsController;