const express = require('express');
const mysql = require('mysql2');
require('dotenv').config()

const db = mysql.createPool({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_ROOT,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
});

const router = express.Router();

router.showGenerationById = function (req, res) {
    const {generation_id} = req.params;
    db.query('SELECT modelos.nombreModelo, generaciones.* FROM generaciones INNER JOIN modelos ON generaciones.modelo_id = modelos.id WHERE generaciones.id = ?', [generation_id], (err, results) => {
      if (err) throw err;
      res.render('GenerationTemplate', { 
        title: 'generation',
        generation: results[0]
      });
    });
}

router.showGenerationData = function (req, res) {
  const { generation_id } = req.params;
  db.query('SELECT * FROM generaciones WHERE id = ?', [generation_id], (err, results) =>{
    if(err) throw err;
    res.json(results[0])
  });
}

router.showAllMotorizations = function(req, res) {
  const { generation_id } = req.params;
  db.query('SELECT motorizaciones.periodoUso, motores.codigoMotor, motores.combustible FROM motorizaciones INNER JOIN motores ON motorizaciones.codigomotor_id = motores.id WHERE motorizaciones.generacion_id = ?', [generation_id], (err, results) => {
    if (err) throw err;
    res.json(results);
  });
}

module.exports = router;