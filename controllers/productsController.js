const db = require("../database/models")
const op = db.Sequelize.Op;

const productsController = {
    vistaDeProducto: function (req, res) {
        return res.render("product", { productos: datos.productos, usuario: datos.usuario })
    },
    vistaAdd: function (req, res) {
        return res.render("product-add", { productos: datos.productos, usuario: datos.usuario })
    }


}

module.exports = productsController;