--CONSULTAS

--Coches activos
--Nombre modelo, marca y grupo de coches, Fecha de compra, Matricula, Nombre del color del coche, Total kilómetros, Nombre aseguradora y Número de póliza

select m.nombremarca as Marca, mo.nombremodelo as modelo, ge.nombre as Grupo_Empresa, cf.dt_alta as Fecha_Alta, c.matricula as Matricula,  co.color_name as color, c.total_km as Km_Totales, a.name as Aseguradora, p.n_poliza as NªPoliza
from jgl_sql.modelo mo inner
join jgl_sql.marca m on mo.id_marca = m.id_marca
join jgl_sql.g_emp ge on m.id_g_emp = ge.id_g_emp
join jgl_sql.car c on c.id_modelo  = mo.id_modelo
join jgl_sql.coche_flota cf on c.id_car = cf.id_car
join jgl_sql.color co on c.color_name = co.color_name
join jgl_sql.poliza p on p.id_car = c.id_car
join jgl_sql.aseguradora a on p.id_aseguradora = a.id_aseguradora 
where cf.dt_end > '2023-01-30';