-- Usuarios con sus roles y datos personales
SELECT 
    u.ID AS id_usuario,
    CONCAT(p.Nombre, ' ', p.Primer_Apellido, ' ', IFNULL(p.Segundo_Apellido, '')) AS nombre_completo,
    r.Nombre AS rol,
    u.Nombre_Usuario,
    u.Correo_Electronico,
    u.Estatus
FROM 
    tbb_usuarios u
JOIN 
    tbb_personas p ON u.Persona_ID = p.ID
JOIN 
    tbd_usuarios_roles ur ON u.ID = ur.Usuario_ID
JOIN 
    tbc_roles r ON ur.Rol_ID = r.ID;




-- Departamentos y áreas médicas, incluyendo nombre del responsable
SELECT 
    d.id AS id_departamento,
    d.nombre AS nombre_departamento,
    a.Nombre AS nombre_area_medica,
    CONCAT(p.Nombre, ' ', p.Primer_Apellido, ' ', IFNULL(p.Segundo_Apellido, '')) AS responsable
FROM 
    tbc_departamentos d
LEFT JOIN 
    tbc_areas_medicas a ON d.area_medica_id = a.ID
LEFT JOIN 
    tbb_personas p ON d.responsable_id = p.ID;



-- Espacios, su tipo y a qué departamento pertenecen
SELECT 
    e.nombre AS nombre_espacio,
    e.tipo,
    d.nombre AS nombre_departamento,
    d.estatus
FROM 
    tbc_espacios e
LEFT JOIN 
    tbc_departamentos d ON e.departamento_id = d.id;

