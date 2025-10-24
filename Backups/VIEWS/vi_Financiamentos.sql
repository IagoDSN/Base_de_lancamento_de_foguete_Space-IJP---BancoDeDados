/* CREATE VIEW vi_Financiamentos AS*/
SELECT
  f.codFinanciamento,
  f.patrocinador,
  f.valor,
  m.nomeMissao,
  m.dataInicio,
  m.dataFim,
  m.status AS statusMissao,
  GROUP_CONCAT(DISTINCT fo.nomeFoguete SEPARATOR ', ') AS FoguetesEnvolvidos
FROM financiamento f
LEFT JOIN missoes m
  ON m.codMissao = f.Missoes_codMissao
LEFT JOIN lancamentos l
  ON l.Missoes_codMissao = m.codMissao
LEFT JOIN foguete fo
  ON fo.codFoguete = l.Foguete_codFoguete
GROUP BY
  f.codFinanciamento,
  f.patrocinador,
  f.valor,
  m.nomeMissao,
  m.dataInicio,
  m.dataFim,
  m.status;
