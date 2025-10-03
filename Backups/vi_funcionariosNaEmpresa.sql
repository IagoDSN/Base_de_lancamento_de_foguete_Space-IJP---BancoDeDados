/* CREATE VIEW vi_funcionariosNaEmpresa */
SELECT codFuncionario, nomeFuncionario, cpf, nomeCargo,
  CASE
    WHEN 1 THEN 'Ativo'
    when 0 then 'Demitido'
    ELSE 'Desconhecido'
  END AS situacao, email, telefone
FROM funcionario, cargo
ORDER BY nomeFuncionario;

