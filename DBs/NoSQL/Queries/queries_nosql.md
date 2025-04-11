# 📦 Consultas a Base de Datos NoSQL (MongoDB)

Este módulo proporciona una serie de funciones para realizar consultas sobre el modelo `Espacio` utilizando Mongoose en una base de datos MongoDB.



## 🔧 Funciones Disponibles

### ✅ `getAll()`

Obtiene todos los documentos del modelo `Espacio`.

```js
const espacios = await espacioDAO.getAll();
```

**Retorna:**  
Un arreglo de todos los espacios almacenados en la base de datos.

---

### 🔍 `getOne(identifierEspacio)`

Busca un espacio en la base de datos que coincida con el identificador proporcionado.

```js
const espacio = await espacioDAO.getOne("espacio123");
```

**Parámetros:**
- `identifierEspacio` *(string)*: Identificador único del espacio.

**Retorna:**  
Un objeto `Espacio` si se encuentra, o `null` si no existe.

---

### ➕ `insertEspacio(espacio)`

Inserta un nuevo documento `Espacio` en la base de datos.

```js
const success = await espacioDAO.insertEspacio({ identifier: "nuevo", nombre: "Sala 101" });
```

**Parámetros:**
- `espacio` *(object)*: Objeto con los datos del nuevo espacio.

**Retorna:**  
`true` si se guarda correctamente, `false` si ocurre un error.

---

### ✏️ `updateEspacio(identifierEspacio, espacio)`

Actualiza un espacio existente identificado por su `identifier`.

```js
const actualizado = await espacioDAO.updateEspacio("espacio123", { nombre: "Nueva Sala" });
```

**Parámetros:**
- `identifierEspacio` *(string)*: Identificador del espacio a actualizar.
- `espacio` *(object)*: Nuevos datos para actualizar.

**Retorna:**  
`true` si se actualizó correctamente, `false` si no se encontró el documento.

---

### ❌ `deleteEspacio(identifierEspacio)`

Elimina un espacio identificado por su `identifier`.

```js
const eliminado = await espacioDAO.deleteEspacio("espacio123");
```

**Parámetros:**
- `identifierEspacio` *(string)*: Identificador del espacio a eliminar.

**Retorna:**  
`true` si se eliminó correctamente, `false` si no se encontró el documento.

---

### 💣 `deleteAll()`

Elimina **todos** los documentos `Espacio` de la base de datos.

```js
const mensaje = await espacioDAO.deleteAll();
```

**Retorna:**  
Una cadena de texto confirmando la eliminación de todos los espacios.

---

## 🧱 Modelo de Ejemplo (`Espacio`)

```js
{
  identifier: String,
  nombre: String,
  ubicacion: String,
  capacidad: Number,

}
```

---

## 🛠️ Requisitos

- Node.js
- MongoDB
- Mongoose
