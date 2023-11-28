SELECT
  V.num_chasis,
  V.patente,
  V.descripcion AS vehiculo_descripcion,
  E.nombre AS extra_nombre
FROM
  Vehiculo V
LEFT JOIN
  Extras E ON V.num_chasis = E.num_chasis;
