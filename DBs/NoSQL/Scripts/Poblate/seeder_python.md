
# 🚀 Generador de Datos de Espacios - API Hospitalaria

Este script en Python permite generar datos ficticios de uso de espacios dentro de una institución médica (como hospitales o clínicas) y los envía a una API remota para poblar una base de datos.

---


## 🧠 ¿Qué hace este script?

Este script:

1. Genera una cantidad configurable de registros aleatorios.
2. Cada registro contiene:
   - `espacio`: nombre de un espacio físico (ej. "Quirófano 1").
   - `area`: área funcional (ej. "Área quirúrgica").
   - `estado`: estado actual del espacio (ej. "En mantenimiento").
3. Envía cada registro como un JSON a la siguiente API:

```
********
```

---

## 📋 Campos generados

| Campo    | Tipo     | Descripción                                       |
|----------|----------|---------------------------------------------------|
| espacio  | `string` | Nombre del espacio físico                         |
| area     | `string` | Área o departamento al que pertenece el espacio   |
| estado   | `string` | Estado actual del espacio                         |

---

## ▶️ Cómo usar

Ejecuta el script en tu terminal o entorno de desarrollo:

```bash
python generar_datos.py
```

El script te pedirá que ingreses la cantidad de registros que deseas crear. Por ejemplo:

```
¿Cuántos registros deseas crear?: 5
```

Y verás mensajes como:

```
Datos enviados correctamente: {'espacio': 'Consultorio 2', 'area': 'Área de consulta externa', 'estado': 'Disponible'}
```

---

## ⚠️ Notas

- La API debe estar activa y accesible en el momento de la ejecución.
- Asegúrate de tener conexión a Internet.
- Si la API devuelve errores, se mostrarán en la consola.

---

## 🧑‍💻 Extra

Este script fue creado como herramienta para pruebas y generación de datos dummy para una API de monitoreo de espacios médicos.

---
