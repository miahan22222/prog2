const products= require("../db/datos")
const productsControlller= {
    VistaDeProducto: function(req,res){
        return res.render("product", {productos: datos.productos, usuario : datos.usuario} )
    }

}

module.exports= productsControlller;