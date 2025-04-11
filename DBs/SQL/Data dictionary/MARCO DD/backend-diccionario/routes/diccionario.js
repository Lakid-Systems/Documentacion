// routes/diccionario.js
const express = require('express');
const router = express.Router();
const db = require('../db');

// Obtener todas las tablas
router.get('/tablas', async (req, res) => {
  const [rows] = await db.query(`SHOW TABLES`);
  const tablas = rows.map(row => Object.values(row)[0]);
  res.json(tablas);
});

// Obtener estructura de una tabla
router.get('/tabla/:nombre', async (req, res) => {
  const { nombre } = req.params;
  const [columnas] = await db.query(`SHOW FULL COLUMNS FROM \`${nombre}\``);
  const [keys] = await db.query(`SHOW KEYS FROM \`${nombre}\``);

  const llaves = {};
  keys.forEach(k => {
    if (!llaves[k.Column_name]) llaves[k.Column_name] = {};
    if (k.Key_name === 'PRIMARY') llaves[k.Column_name].pk = true;
    if (k.Non_unique === 0 && k.Key_name !== 'PRIMARY') llaves[k.Column_name].uq = true;
  });

  const columnasDetalladas = columnas.map(col => ({
    nombre: col.Field,
    tipo: col.Type,
    nulo: col.Null === 'NO' ? false : true,
    pk: llaves[col.Field]?.pk || false,
    uq: llaves[col.Field]?.uq || false,
    binario: col.Collation === null ? true : false,
    unsigned: col.Type.includes('unsigned'),
    zerofill: col.Type.includes('zerofill'),
    autoincremento: col.Extra.includes('auto_increment'),
    valor_defecto: col.Default,
    comentario: col.Comment
  }));

  res.json(columnasDetalladas);
});

module.exports = router;
