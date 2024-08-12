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

router.showModel = function (req, res) {
    const { id } = req.params;
    db.query('SELECT modelos.nombreModelo, modelos.intro, modelos.historia, modelos.legado, generaciones.id, generaciones.rutaPortada, generaciones.nombreGeneracion, generaciones.periodo FROM modelos INNER JOIN generaciones ON modelos.id = generaciones.modelo_id WHERE modelos.id = ?', [id], (err, results) => {
      if (err) throw err;
      res.render('ModelTemplate', {
        title: 'modelo',
        modelo: results
      });
    })
}

router.showModelData = function (req, res) {
    const { generation_id } = req.params;
    db.query('SELECT generaciones.longitudChasis, generaciones.peso, generaciones.transmision FROM generaciones INNER JOIN modelos ON modelos.id = generaciones.modelo_id WHERE modelos.id = ?', [generation_id], (err, results) =>{
      if(err) throw err;
      res.json(results[0])
    });
}

router.showModelMonoGen = function (req, res) {
    const {id} = req.params;
    db.query('SELECT modelos.*, generaciones.id as g_id, generaciones.longitudChasis, generaciones.peso, generaciones.transmision, generaciones.video, generaciones.rutaSlides FROM modelos INNER JOIN generaciones ON modelos.id = generaciones.modelo_id WHERE modelos.id = ?', [id], (err, results) => {
      if (err) throw err;
      res.render('ModelMonoGenTemplate', {
        title: 'modelo',
        modelo: results
      });
    })
}

module.exports = router;