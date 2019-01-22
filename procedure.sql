create procedure spBoletimUrna
as
begin
	select count(vot.codigo_candidato) as votos, cand.nome_candidato as Candidato,
	cand.numeroeleitoral_candidato as [Número do Candidato], car.nome_cargo as Cargo
	from votos as vot
	inner join candidato as cand
	on vot.codigo_candidato = cand.codigo_candidato
	inner join cargo as car
	on cand.codigo_cargo = car.codigo_cargo
	group by vot.codigo_candidato, cand.nome_candidato, cand.numeroeleitoral_candidato, car.nome_cargo
	order by car.nome_cargo, votos desc;
end