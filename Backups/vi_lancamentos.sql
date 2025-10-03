/* CREATE VIEW vi_lancamento AS */
SELECT l.codLancamentos, b.codbaseLancamento, l.dataLancamento, l.resultado, paisbase,
    f.nomeFoguete,
    m.nomeMissao
FROM Lancamentos l
INNER JOIN Foguete f 
    ON l.Foguete_codFoguete = f.codFoguete
INNER JOIN Missoes m 
    ON l.Missoes_codMissao = m.codMissao
INNER JOIN baselancamento b
