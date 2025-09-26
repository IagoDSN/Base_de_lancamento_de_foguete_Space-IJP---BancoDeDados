CREATE VIEW vi_DadosFuncionario As
SELECT f.codFuncionario,
    DATE_FORMAT(f.dataNascimento, "%d/%m/%Y") AS dataNascimento,
    TIMESTAMPDIFF(YEAR, f.dataNascimento, CURDATE()) AS idade,
    f.nomeFuncionario, f.salarioAtual, c.nomeCargo,
    CASE f.status
        WHEN 1 THEN 'Ainda na empresa'
        WHEN 0 THEN 'Já demitido'
        ELSE 'Desconhecido'
    END AS statusFuncionario
FROM funcionario AS f INNER JOIN cargo AS c 
ON f.cargo_codcargo = c.codCargo;
