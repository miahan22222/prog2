const datos = require('../db/datos')

const indexController = {
    vistaDeindex: function (req, res) {
        return res.render("index", { productos: datos.productos, usuario: datos.usuario })
    },

    vistaDeSearch: function (req, res) {
        return res.render("search-results", { productos: datos.productos, usuario: datos.usuario })
    },

}

module.exports = indexController;