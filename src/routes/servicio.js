const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database.js');

//obtener la información
//se crea la ruta (inicial)
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

router.get('/:idServicio', (req, res) => {
    //recibe el parametro
   const {idServicio} = req.params;
   console.log(idServicio);
   mysqlConnection.query('SELECT * FROM servicio WHERE idServicio = ?', [idServicio], 
   (err, rows, fields) => {
       if(!err){
           //coloco 0 para que sea unicamente el retorno de un objeto y no un arreglo
           res.json(rows[0]);
       }else{
           console.log(err);
       }
   });
});

//Insertar dato 

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

//Ruta no necesaria
/*

router.put('/:idServicio', (req, res) =>{
    const {tipoServicio, duracion} = req.body;
    const {idServicio} = req.params; 
})
*/

module.exports = router;