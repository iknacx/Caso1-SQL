SELECT
  NA.rut_no_autorizado,
  P.nombre,
  P.a_paterno,
  P.a_materno,
  V.num_chasis,
  V.patente
FROM
  No_autorizado NA
LEFT JOIN
  Persona P ON NA.rut_no_autorizado = P.rut_persona
LEFT JOIN
  Vehiculo V ON P.rut_persona = V.rut_persona;
