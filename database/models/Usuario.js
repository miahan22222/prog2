module.exports = function(sequelize, dataTypes) {
    let alias = "Usuario";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre :{
            type: dataTypes.STRING
        },
        apellido: {
            type: dataTypes.STRING
        },
        mail: {
            type: dataTypes.STRING
        },
        usuario: {
            type: dataTypes.STRING
        },
        contrasenia:{
            type: dataTypes.STRING
        },
        fechaNacimiento:{
            type: dataTypes.STRING

        },
        numeroDocumento:{
            type: dataTypes.INTEGER
        },
        fotoPerfil:{
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
        tableName: "usuarios",
        timestamps: false,
        underscored: false,
    };

    /* definir un modelo */
    let Usuario = sequelize.define( alias, cols, config);

    Usuario.associate = function(models){//chequear todo
        Usuario.hasMany(models.Producto,{
            as: "productos", //chequear
            foreignKey: "idUsuario"
        });

        Usuario.hasMany(models.Comentario,{
            as: "comentario", //chequear
            foreignKey: "idUsuario",
        })
        
    }

    return Usuario;
}