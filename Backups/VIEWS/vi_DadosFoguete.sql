CREATE VIEW vi_DadosFoguete As
SELECT f.nomeFoguete, f.`status`,
  CASE f.`status`
    WHEN 0 THEN 'Não pronto'
    WHEN 1 THEN 'Pronto para lançamento'
    WHEN 2 THEN 'Já lançado'
    WHEN 3 THEN 'Retornando para base'
    ELSE 'Desconhecido'
  END AS status_descricao,
  GROUP_CONCAT(DISTINCT CONCAT(c.tipo, ' (', c.peso * c.quant, ' Kg)') 
               SEPARATOR ', ') AS CargasComPeso,
  GROUP_CONCAT(DISTINCT s.tipo SEPARATOR ', ') AS Sensores
FROM foguete AS f
INNER JOIN carga AS c
  ON c.Foguete_codFoguete = f.codFoguete
INNER JOIN sensores AS s
  ON s.Foguete_codFoguete = f.codFoguete
GROUP BY f.codFoguete, f.nomeFoguete, f.`status`;
