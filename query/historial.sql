SELECT
  S.id_siniestro,
  S.tipo,
  S.info_accidente,
  S.fecha_reparacion,
  S.fecha_siniestro,
  S.monto_reparacion,
  A.rut_autorizado,
  T.id_taller,
  T.comuna AS taller_comuna,
  T.calle AS taller_calle,
  T.numero AS taller_numero,
  P.num_poliza
FROM
  Siniestro AS S
INNER JOIN
  Autorizado AS A ON S.rut_autorizado = A.rut_autorizado
INNER JOIN
  Taller AS T ON S.id_taller = T.id_taller
INNER JOIN
  Poliza AS P ON S.num_poliza = P.num_poliza
WHERE
  S.rut_autorizado = '...'; -- Aquí va el rut
