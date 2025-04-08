Diccionario de Datos - Carpeta docs
Este documento describe la estructura y propósito de la carpeta docs, que almacena toda la documentación técnica del sistema hospitalario (frontend, API y base de datos).

Descripción General
Nombre de la carpeta: docs

Propósito: Centralizar la documentación técnica del proyecto en formato organizado y accesible.

Estructura:

docs/
├── frontend/          # Documentación del frontend
├── api/               # Documentación de la API
├── database/          # Documentación de bases de datos
└── README.md          # Índice general
'
Estructura Detallada

1. Subcarpeta frontend
Archivo 	            Formato	    Descripción
estructura.md	    Markdown	Explica la arquitectura de carpetas y componentes.
tecnologias.md	   Markdown	Lista tecnologías usadas (Vue.js, Bootstrap) con versiones.
instalacion.md	    Markdown	Pasos para configurar el entorno de desarrollo.

## Tecnologías del Frontend
- **Vue.js 3**: Framework base.
- **Bootstrap 5**: Estilos y componentes UI.
- **Axios**: Llamadas HTTP a la API.

2. Subcarpeta api
Archivo	Formato	Descripción
endpoints.md	Markdown	Tabla con todos los endpoints (métodos, autenticación, ejemplos JSON).
autenticacion.md	Markdown	Flujo de JWT y roles.
postman/	JSON	Colección de Postman para pruebas.

Ejemplo de contenido (api/endpoints.md):

### GET /usuarios
- **Método:** GET
- **Autenticación:** JWT
- **Respuesta:**
  ```json
  [{ "id": "1", "nombre": "Juan Pérez" }]


---

### **3. Subcarpeta `database`**
| Archivo               | Formato  | Descripción                                                                 |
|-----------------------|----------|-----------------------------------------------------------------------------|
| `modelo_sql.md`       | Markdown | Diagrama ER y descripción de tablas (MySQL).                               |
| `modelo_mongodb.md`   | Markdown | Esquema de colecciones NoSQL (ej: `espacios`).                             |
| `queries_clave.sql`   | SQL      | Consultas frecuentes con explicaciones.                                    |

**Ejemplo de contenido (`database/modelo_mongodb.md`):**
```markdown
## Colección `espacios`
- **Propósito:** Registrar estado de quirófanos/salas.
- **Campos:**
  - `nombre_espacio` (String)
  - `estado` (String: "En uso", "Disponible")
4. Archivo README.md (Raíz de docs)
