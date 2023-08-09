SELECT * FROM contacto
SELECT * FROM usuario

SELECT 
    CONCAT(c.nombre, ' ', c.apellidos) AS Contacto,
    CONCAT(u.nombre, ' ', u.apellidos) AS Usuario
FROM 
    pertenece p
INNER JOIN 
    contacto c ON p.id_contacto = c.id
INNER JOIN 
    usuario u ON p.id_usuario = u.id;
