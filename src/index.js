const express = require('express');
const app = express();

//Settings 
//para el despliegue entonces se agrega process.env.PORT
//para que se defina allí, no es necesario especificar el puert
app.set('port', process.env.PORT || 3000);

//Middlewares
//si se recibe un json se puede acceder a la info
app.use(express.json());

//Routes
app.use(require('./routes/servicio'));

//Starting the server
app.listen(app.get('port'), () =>{
    console.log('Server on port', app.get('port'));
});
//Esto es una prueba 
