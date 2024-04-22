const datos = require("../db/datos")
const productsController = {
    vistaDeProducto: function (req, res) {
        return res.render("product", { productos: datos.productos, usuario: datos.usuario })
    },
    vistaAdd: function (req, res) {
        return res.render("product-add", { productos: datos.productos, usuario: datos.usuario })
    }


}

module.exports = productsController;