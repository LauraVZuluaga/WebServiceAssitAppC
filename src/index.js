const express = require('express');
const app = express();


app.set('port', process.env.PORT || 3000);

//Middlewares
//Se espera que se reciba un JSON para acceder a la información
app.use(express.json());

//Routes
app.use(require('./routes/servicio'));

//Inicio del servidor con ip del PC, es necesario para alojar servicio
//en red temporal
app.listen(app.get('port'),'192.168.43.64', () =>{
    console.log('Server on port', app.get('port'));
});

