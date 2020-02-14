
//Inicialización del servicio
const mysql = require('mysql');

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

module.exports = mysqlConnection;