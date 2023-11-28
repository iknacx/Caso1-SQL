SELECT
  A.rut_agente,
  COUNT(P.num_poliza) AS total_polizas
FROM
  Agente A
LEFT JOIN
  Poliza P ON A.codigo_especial = P.codigo_especial
GROUP BY
  A.rut_agente;
