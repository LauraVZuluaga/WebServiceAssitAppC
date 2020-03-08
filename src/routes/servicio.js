const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database.js');

/*http://localhost:3000/ devuelve un arreglo de JSON con cada uno de los servicios
agendados
*/
router.get('/', (req, res) =>{
    //Consulta a la DB
    mysqlConnection.query('SELECT * FROM servicio', (err, rows, fields) => {
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    });
});

/*http://localhost:3000/servicio/idServicio retorna un JSON con la información disponible para ese servicio
 Ejemplo --> http://localhost:3000/servicio/14 
*/
router.get('/servicio/:idServicio', (req, res) => {
    //recibe el parametro
   const {idServicio} = req.params;
   console.log(idServicio);
   //mysqlConnection.query('SELECT * FROM servicio WHERE idServicio = ?', [idServicio], 
   //mysqlConnection.query('SELECT nombre, cedula_Enfermero FROM enfermero e INNER JOIN servicio s ON e.cedula = s.cedula_Enfermero', [cedula_Enfermero],
   mysqlConnection.query('SELECT e.nombre, e.apellido, e.cedula, s.idServicio, s.tipoServicio, s.cedula_Paciente,s.duracion, s.estado, s.fecha, s.hora FROM enfermero e INNER JOIN servicio s ON e.cedula = s.cedula_Enfermero AND s.idServicio = ?',[idServicio],

   (err, rows, fields) => {
       if(!err){
           //coloco 0 para que sea unicamente el retorno de un objeto y no un arreglo
           res.json(rows[0]);
       }else{
           console.log(err);
           
       }
   });
});

/* http://localhost:3000/paciente/cedula_Paciente retorna un JSON con la información disponible 
de los servicios que tiene agendados un paciente
Ejemplo --> http://localhost:3000/paciente/105387643
*/
router.get('/paciente/:cedula_Paciente', (req, res) => {
    //recibe el parametro
   const {cedula_Paciente} = req.params;
   console.log(cedula_Paciente);
   mysqlConnection.query('SELECT * FROM servicio WHERE cedula_Paciente = ? AND estado = "Pendiente"', [cedula_Paciente], 
   (err, rows, fields) => {
       if(!err){
           //coloco 0 para que sea unicamente el retorno de un objeto y no un arreglo
           res.json(rows);
       }else{
           console.log(err);
       }
   });
});

/* http://localhost:3000/enfermero/cedula_Enfermero retorna un JSON con la información disponible 
de los servicios que tiene agendados un paciente
Ejemplo --> http://localhost:3000/enfermero/105387643
*/
router.get('/enfermero/:cedula_Enfermero', (req, res) => {
    //recibe el parametro
   const {cedula_Enfermero} = req.params;
   console.log(cedula_Enfermero);
   mysqlConnection.query('SELECT * FROM servicio WHERE cedula_Enfermero = ?', [cedula_Enfermero],  
   (err, rows, fields) => {
       if(!err){
           //coloco 0 para que sea unicamente el retorno de un objeto y no un arreglo
           res.json(rows[0]);
       }else{
           console.log(err);
       }
   });
});

router.get('/listaEnfermeros', (req, res) => {
   mysqlConnection.query('SELECT cedula, nombre, apellido FROM enfermero', 
   (err, rows, fields) => {
       if(!err){
           res.json(rows);
       }else{
           console.log(err);
       }
   });
});

/* http://localhost:3000/consultarD/enfermero/fecha retorna un JSON con los horarios que disponibles 
de un enfermero dada una fecha
Ejemplo --> http://localhost:3000/consultarD/105387643/'2019-04-15'
*/


router.get('/consultarD/:enfermero/:fecha', (req, res) => {
    //recibe el parametro
    
   const {enfermero, fecha} = req.params;
   const query = `
        SELECT disponibilidad1(${enfermero}, ${fecha});`;
   console.log(enfermero);
   console.log(fecha);
   mysqlConnection.query(query, 
    (err, rows, fields) => {
        if(!err){
            res.json(rows[0]);
            //res.status(200).json(query.rows);
            //res.json({Status: 'Disponibilidad obtenida'});
        }else{
            console.log(err);
        }
    });
});


/*Para realizar la inserción de datos necesario un JSON con la estructura como sigue
{
    "idServicio": 1,
    "tipoServicio": "Caminar",
    "duracion": 3,
    "cedula_Enfermero": "105768909",
    "cedula_Paciente": "1053866373",
    "fecha": "2019-04-15",
    "hora": "08:00:00",
    "estado": "Cancelado"
}
*/
router.post('/', (req, res) => {
    const {idServicio, tipoServicio, duracion, 
    cedula_Enfermero, cedula_Paciente, fecha, hora,
    estado} = req.body ;
    const query = `
        CALL servicioAgregarOEditar2(?, ?, ?, ?, ?, ?, ?, ?);
    `;
    mysqlConnection.query(query, [idServicio, tipoServicio, duracion, 
        cedula_Enfermero, cedula_Paciente, fecha, hora, 
        estado], (err, rows, fields) => {
            if(!err){
                res.json({Status: 'Servicio agregado'});
            }else{
                console.log(err);
            }
        });
})

module.exports = router;