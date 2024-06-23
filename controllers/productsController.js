const db = require("../database/models")
const op = db.Sequelize.Op;
const {validationResult } = require('express-validator')

const productsController = {
    vistaDeProducto: function (req, res) {
        let idProducto = req.params.idProducto;
        let filtrado = {
            include: [
                { association: "usuario" },
                {
                    association: "comentario",
                    include: ["usuarios"],
                   
                }
            ],
           order: [[{ model: db.Comentario, as: 'comentario' }, 'createdAt', 'DESC']] 
        }
        db.Producto.findByPk(idProducto, filtrado)
            .then(function (result) {
                //return res.send(result)
                return res.render("product", { productos: result })
            })
            .catch((err) => {
                return console.log(err);
            });

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
    showFormUpdate: function (req, res) {
        if (req.session.user == undefined) {
            return res.redirect("/users/login");
        }
       
       
        let id = req.params.idProducto;
        db.Producto.findByPk(id)
        .then((result) => {
           //return res.send(result)
        if (req.session.user.id != result.idUsuario) {
            return res.send("No podes editar un producto que no es tuyo");
        }
          return res.render("updateProduct", {productos: result});
        }).catch((err) => {
            return console.log(err);
        });
        
      },


    update: function(req, res) {
        let errors = validationResult(req)
    if (errors.isEmpty()) {

    let forms = req.body;
    //return res.send(forms)
       let filtro = {
        nombreProducto: forms.nombre,
        imagenProducto: forms.imagen,
        descripcionProducto: forms.Descripcion,
        idUsuario: forms.idUsuario
    }
       
        db.Producto.update(filtro, {where: [{id: forms.id}]} )
        .then((result) => {
          return res.redirect("/product/id/"+ forms.id);
        }).catch((err) => {
          return console.log(err);
        });

    }
    else {
        let id = req.params.idProducto;
        db.Producto.findByPk(id)
        .then((result) => {
            
        return res.render('updateProduct', {
            errors: errors.mapped(),
        old: req.body,
        productos: result
    })
        }).catch((err) => {
            return console.log(err);
        });

      }
    },
    delete: function(req, res) {
        if (req.session.user == undefined) {
            return res.redirect("/users/login");
        }

       
       
        let idParaBorrar = req.body.id;
        let idUsuarioBorrar= req.body.idUsuario;
        if (req.session.user.id != idUsuarioBorrar) {
            return res.send("No podes eliminar un producto que no es tuyo");
        } else{
            let filtro = {
                where: [{id: idParaBorrar }]
                
              }
          
              db.Producto.destroy(filtro)
              .then((result) => {
                return res.redirect("/");
              }).catch((err) => {
                return console.log(err);
              });
        }
   
    
      }

}

module.exports = productsController;