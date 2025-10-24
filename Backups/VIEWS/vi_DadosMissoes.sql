CREATE VIEW vi_DadosMissoes As
SELECT m.codMissao, m.nomeMissao, d.nomeLocal,
    CASE
        WHEN d.distancia >= 1000000000 
            THEN CONCAT(FORMAT(d.distancia / 1000000000, 1), ' bilhões')
        WHEN d.distancia >= 1000000 
            THEN CONCAT(FORMAT(d.distancia / 1000000, 1), ' milhões')
        WHEN d.distancia >= 1000 
            THEN CONCAT(FORMAT(d.distancia / 1000, 1), ' mil')
        ELSE FORMAT(d.distancia, 0)
    END AS distancia_formatada,
    DATE_FORMAT(m.dataInicio, "%d/%m/%Y") AS dataInicio,
    DATE_FORMAT(m.dataFim, "%d/%m/%Y") AS dataFim,
    CASE 
        WHEN m.dataInicio IS NOT NULL AND m.dataFim IS NOT NULL
            THEN CONCAT(
                TIMESTAMPDIFF(YEAR, m.dataInicio, m.dataFim), ' anos, ',
                MOD(TIMESTAMPDIFF(MONTH, m.dataInicio, m.dataFim), 12), ' meses, ',
                MOD(TIMESTAMPDIFF(DAY, m.dataInicio, m.dataFim), 30), ' dias'
            )
        ELSE 'Em andamento'
    END AS duracao
FROM missoes AS m
INNER JOIN destino AS d 
    ON m.Destino_codDestino = d.codDestino;
