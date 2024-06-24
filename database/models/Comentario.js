module.exports = function(sequelize, dataTypes) {
    let alias = "Comentario";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        idUsuario :{
            type: dataTypes.INTEGER
        },
        idProducto: {
            type: dataTypes.INTEGER
        },
        textoComentario: {
            type: dataTypes.STRING
        },
        createdAt:{
            type: dataTypes.DATE
        },
        updatedAt:{
            type: dataTypes.DATE
        },
        deletedAt: {
            type: dataTypes.DATE
        }
    };

    let config = {
        tableName: "comentarios",
        timestamps: true,
        underscored: false,
    };

    /* definir un modelo */
    let Comentario = sequelize.define( alias, cols, config);

    Comentario.associate = function(models){ 
        Comentario.belongsTo(models.Usuario,{
            as: "usuarios", 
            foreignKey: "idUsuario"
        });
        Comentario.belongsTo(models.Producto,{
            as: "producto", 
            foreignKey: "idProducto",
        })
    }

    return Comentario;
}