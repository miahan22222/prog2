const login = require("../db/index")

const loginController={

    VistaDeLogin: function (req,res) {
        return res.render("login")
        
    }
}