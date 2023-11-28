SELECT
  A.rut_autorizado,
  SUM(S.monto_reparacion) AS total_gastos
FROM
  Autorizado A
INNER JOIN
  Siniestro S ON A.rut_autorizado = S.rut_autorizado
GROUP BY
  A.rut_autorizado;
