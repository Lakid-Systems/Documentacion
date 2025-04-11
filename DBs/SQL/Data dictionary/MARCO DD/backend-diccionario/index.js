// index.js
const express = require('express');
const cors = require('cors');
const diccionarioRoutes = require('./routes/diccionario');

const app = express();
const PORT = 3001;

app.use(cors());
app.use(express.json());

app.use('/api', diccionarioRoutes);

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
