# Modelo de Datos: Espacios

Este proyecto utiliza **MongoDB** como base de datos NoSQL y **Mongoose** como ODM (Object Data Modeling) para manejar la estructura de los datos en una colección llamada `espacios`.

## Esquema del Modelo en Mongoose

El modelo define la estructura de los documentos almacenados en la colección `espacios`. Cada documento representa un espacio con ciertas características.

### Definición del esquema

```js
import { Schema, model } from "mongoose";

const productSchema = new Schema({
    espacio: String,
    area: String,
    estado: String,
}, {
    timestamps: true,
    versionKey: false
});

export default model('espacios', productSchema);
```

### Campos

| Campo     | Tipo   | Descripción                          |
|-----------|--------|--------------------------------------|
| espacio   | String | Nombre o identificador del espacio   |
| area      | String | Área a la que pertenece el espacio   |
| estado    | String | Estado actual del espacio (activo, inactivo, en uso, etc.) |

### Opciones del esquema

- `timestamps: true`: Agrega automáticamente los campos `createdAt` y `updatedAt` para hacer seguimiento de cuándo se crea y actualiza cada documento.
- `versionKey: false`: Elimina el campo `__v` que Mongoose agrega por defecto para el control de versiones.

## Esquema en formato JSON

Este esquema representa la estructura del modelo `espacios` en formato JSON Schema, útil para validaciones o documentación en herramientas como Swagger/OpenAPI.

```json
{
  "title": "Espacios",
  "type": "object",
  "properties": {
    "espacio": {
      "type": "string",
      "description": "Nombre o identificador del espacio"
    },
    "area": {
      "type": "string",
      "description": "Área a la que pertenece el espacio"
    },
    "estado": {
      "type": "string",
      "description": "Estado actual del espacio (activo, inactivo, en uso, etc.)"
    },
    "createdAt": {
      "type": "string",
      "format": "date-time",
      "description": "Fecha de creación del documento"
    },
    "updatedAt": {
      "type": "string",
      "format": "date-time",
      "description": "Fecha de la última actualización del documento"
    }
  },
  "required": ["espacio", "area", "estado"],
  "additionalProperties": false
}
```

## Uso

Para utilizar este modelo en una aplicación Node.js con Mongoose:

```js
import Espacio from './ruta/del/modelo';

// Crear un nuevo documento
const nuevoEspacio = new Espacio({
  espacio: "Aula 101",
  area: "Edificio A",
  estado: "Disponible"
});

await nuevoEspacio.save();
```

## Requisitos

- Node.js
- MongoDB
- Mongoose

Instalación de dependencias:

```bash
npm install mongoose
```

## Autor

Generado automáticamente para documentación detallada del modelo `espacios`.
