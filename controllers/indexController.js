const db = require('../database/models')
const op = db.Sequelize.Op;

const indexController = {
    vistaDeindex: function (req, res) {
        return res.render("index", { productos: datos.productos, usuario: datos.usuario })
    },

    vistaDeSearch: function (req, res) {
        return res.render("search-results")
    },

    searchProduct: (req, res)=> {
        const searchTerm = req.query.search;

            let filtrado = {
                where: {
                    [op.or]: [
                      { nombreProducto: { [op.like]: `%${searchTerm}%` } },
                      { descripcionProducto: { [op.like]: `%${searchTerm}%` } }
                    ]
                  },
                order:  [['createdAt', 'DESC']]  ,
                include: [
                    {association: "usuario"}
                  ]
                }
                
        db.Producto.findAll(filtrado)
    
        .then(function (result) {
                
        if (result.length === 0 )
             return res.send("No hay resultados para su criterio de busqueda")

        else{
            
           res.render("search-results", {productos: result})
        }
            
        })
   
        .catch((err) => {
        return console.log(err);
    });

}

}

module.exports = indexController;