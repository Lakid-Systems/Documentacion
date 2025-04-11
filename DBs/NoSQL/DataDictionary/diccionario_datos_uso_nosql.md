
# 📚 Diccionario de Datos - Colección `uso`

Este documento describe la estructura y características de los documentos almacenados en la colección `uso`, que registra el uso de espacios físicos en un hospital.

---

## 🗂 Descripción General

- **Nombre de la colección:** `uso`
- **Propósito:** Registrar la utilización de espacios físicos indicando nombre del espacio, área, estado y fecha de uso.
- **Estructura del documento:** JSON

---

## 🧾 Estructura del Documento

| Nombre del campo   | Tipo de dato MongoDB | Obligatorio | Descripción                                                                 | Formato / Restricciones                  | Ejemplo                                  |
|--------------------|----------------------|-------------|------------------------------------------------------------------------------|------------------------------------------|------------------------------------------|
| `espacio_nombre`   | `String`             | Sí          | Nombre específico del espacio que está siendo utilizado.                     | Texto plano. Longitud recomendada: 3-50 caracteres. | `"Quirófanos"`                         |
| `area_espacio`     | `String`             | Sí          | Área o departamento al que pertenece el espacio.                             | Texto plano. Coincide con áreas registradas.         | `"Pediatría"`                          |
| `estado`           | `String`             | Sí          | Estado actual del espacio en el momento del registro.                        | Valores válidos sugeridos: `"En uso"`, `"Disponible"`, `"En mantenimiento"` | `"En uso"`                             |
| `fecha_uso`        | `Date` (recomendado)<br>`String` (opcional) | Sí | Fecha y hora exacta en que se registra el uso del espacio.                  | Formato ISO 8601 si es cadena: `"YYYY-MM-DDTHH:MM:SSZ"`<br>Recomendado como tipo `Date`. | `"2020-10-10T00:00:00Z"`              |

---

## ✅ Ejemplo de Documento JSON

```json
{
  "espacio_nombre": "Quirófanos",
  "area_espacio": "Pediatría",
  "estado": "En uso",
  "fecha_uso": "2020-10-10T00:00:00Z"
}
```

O bien usando el tipo de dato `Date` de MongoDB:

```json
{
  "espacio_nombre": "Quirófanos",
  "area_espacio": "Pediatría",
  "estado": "En uso",
  "fecha_uso": ISODate("2020-10-10T00:00:00Z")
}
```

---

## 🛠 Recomendaciones Técnicas

- **Indexación sugerida:**  
  Se recomienda crear índices en los campos `espacio_nombre`, `area_espacio`, y `fecha_uso` para optimizar consultas de uso por espacio, área y rango de fechas.
  
- **Validación de campos:**  
  Puedes usar validaciones en MongoDB (schema validation) o a nivel de aplicación para asegurar formatos y tipos.
