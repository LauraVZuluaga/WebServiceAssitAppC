//inicializar servidor
//conectarnos 
const mysql = require('mysql');

//Dado que retorna un objeto entonces lo almacenamos en constante

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'assistsenior',
    multipleStatements: true
});

mysqlConnection.connect(function (err) {
    if(err){
        console.log(err);
        return;
    }
    else{
        console.log('BD is connected')
    }
});

//Exportar el modulo para utilizarlo en otras partes del proyecto
module.exports = mysqlConnection;