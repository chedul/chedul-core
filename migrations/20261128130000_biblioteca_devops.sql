-- Aporte-link a la carpeta de DevOps de la biblioteca Chedul en Drive.
--   Mismo formato que los de biblioteca_chedul: titulo = materia, descripcion
--   "Biblioteca Chedul". Es idempotente.
-- +goose Up
-- +goose StatementBegin
insert into aporte (materia_id, alumno_id, titulo, descripcion, tag_id, link)
select m.id, a.id, 'DevOps - Cultura, Herramientas y Procesos', 'Biblioteca Chedul', t.id,
       'https://drive.google.com/drive/folders/1hUmwY4yFC1o5mqV5fjzIRNIRRd_LZimH'
from materia m
cross join (select id from alumno where nombre = 'chedul' limit 1) a
cross join (select id from aporte_tag where nombre = 'Drive') t
where m.nombre = 'DevOps - Cultura, Herramientas y Procesos'
  and not exists (select 1 from aporte x where x.alumno_id = a.id and x.link = 'https://drive.google.com/drive/folders/1hUmwY4yFC1o5mqV5fjzIRNIRRd_LZimH');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
delete from aporte where link = 'https://drive.google.com/drive/folders/1hUmwY4yFC1o5mqV5fjzIRNIRRd_LZimH';
-- +goose StatementEnd
