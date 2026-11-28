-- Aportes-link a las carpetas de materia de la biblioteca Chedul en Drive.
--   Un aporte por materia (mismo titulo que el de Farizano), con la descripcion
--   "Biblioteca Chedul" y el link a su carpeta. Los carga el usuario "chedul".
--   Es idempotente: se puede correr dos veces sin duplicar aportes.
-- +goose Up
-- +goose StatementBegin
insert into aporte (materia_id, alumno_id, titulo, descripcion, tag_id, link)
select m.id, a.id, v.materia, 'Biblioteca Chedul', t.id, v.link
from (values
    ('Álgebra y Geometría Analítica',                      'https://drive.google.com/drive/folders/1H81yQ1DfuHlo0bfBtD7QAxQ4Ox8IXnHz'),
    ('Algoritmos y Estructura de Datos',                   'https://drive.google.com/drive/folders/1v59iS2SpDDeEzyM5xHpZzrVBQ2F0wrvI'),
    ('Análisis Matemático I',                              'https://drive.google.com/drive/folders/10OI6kpyRxJ7YwrnKU5r_jL23GOi4pYOW'),
    ('Fisica',                                             'https://drive.google.com/drive/folders/1BlLw2gUuTx7HmrX38Z8vTDjAzOrdRjs8'),
    ('Lógica y Estructuras Discretas',                     'https://drive.google.com/drive/folders/11L_J_hR_HuYfJZq9l-XIgoxCRnZTfJKZ'),
    ('Sistemas y Procesos de Negocio',                     'https://drive.google.com/drive/folders/1ePQ_L6bfjAeg_tb0DWR6YdQepngiiB72'),
    ('Análisis de Sistemas de Información',                'https://drive.google.com/drive/folders/1CBOw3GSUzg-OtAwBcii4NUGr8-zbByFo'),
    ('Análisis Matemático II',                             'https://drive.google.com/drive/folders/1h15AoJLkEpDGvsSDfMJ0W3RJWtd2MTmE'),
    ('Arquitectura de Computadoras',                       'https://drive.google.com/drive/folders/1uZJ-v2H70VUvrW9oe1SHjl0pxjkDrdr0'),
    ('Fisica II',                                          'https://drive.google.com/drive/folders/1G1lPbzzsgz5VbVGIdfG6WiZN4pkOiZLq'),
    ('Inglés I',                                           'https://drive.google.com/drive/folders/13bsMLCdZaD3CqnhznS38HDJ-LE4_aV2-'),
    ('Paradigmas de Programación',                         'https://drive.google.com/drive/folders/1GCll5NxQERxuVc_X8_AUj1Co9Ux5CPWO'),
    ('Química para Ingeniería en Sistemas de Información', 'https://drive.google.com/drive/folders/1A8uGl992tbAW3cPH3lAoYOSajbbpfiog'),
    ('Sintaxis y Semántica de los Lenguajes',              'https://drive.google.com/drive/folders/1iaUHORxlJG4idwFxuU3lxwM9Qg3i3qW4'),
    ('Sist. Rep. para Ingeniería en Sistemas de Información', 'https://drive.google.com/drive/folders/1_sohm0nrA_DMXgIRZ7X9vlTCH99iuWrH'),
    ('Sistemas de Gestión de Base de Datos',               'https://drive.google.com/drive/folders/1t3lSeq5hzMKUPa92bqSp6Vtux3jdPtkn'),
    ('Complejidad y Técnicas de Diseño de Algoritmos',     'https://drive.google.com/drive/folders/1wl73NC7pHyzGoOcmnDeTG89Z8sxSuH6O'),
    ('Comunicación de Datos',                              'https://drive.google.com/drive/folders/1KHQ8WCQ6Qhh2oy0lCWXMLvOYZfRxj6Tt'),
    ('Diseño de Sistemas de Información',                  'https://drive.google.com/drive/folders/1Ev-0ezh5AcM2zjfwjB40MtuaNbWqF2qp'),
    ('Sistemas Operativos',                                'https://drive.google.com/drive/folders/1eennGuGLWYV3dvOzuTb5g4jtVjM2vrqo'),
    ('Economía',                                           'https://drive.google.com/drive/folders/10I5lJ5h9SnoTMPEZeun34UoujgyDnX1A'),
    ('Base de Datos',                                      'https://drive.google.com/drive/folders/1wjR3QtHjsambqGZj5fhU0uyCUm5XzvSj'),
    ('Ingeniería y Sociedad',                              'https://drive.google.com/drive/folders/1ppvTV0s8RhPnGaUdjDpptjcCLVJunyWe'),
    ('Inglés II',                                          'https://drive.google.com/drive/folders/1WUjubVkYRId_JsdYPd4oVIVJPHd5aWst'),
    ('Análisis Numérico',                                  'https://drive.google.com/drive/folders/1rHkZ3jBPdGEaBVivYjzqz29y-2xFpmFm'),
    ('Probabilidad y Estadística',                         'https://drive.google.com/drive/folders/1h1cl6RyjBp7FhVFl0goKTRj9RgRvQtuO'),
    ('Administración de Sistemas de Información',          'https://drive.google.com/drive/folders/1qHGN3WrmGF0iR8C9QfXfMrqFqtKtSmz4'),
    ('Agilidad Avanzada',                                  'https://drive.google.com/drive/folders/1LtOpEuDkfCHz_EJaal2wLzo940aR5Uok'),
    ('Aspectos Avanzados de Calidad de Software',          'https://drive.google.com/drive/folders/11tmCA2aHu0-5qlbcILAbi8bSdDtW0jqN'),
    ('Ingeniería y Calidad del Software',                  'https://drive.google.com/drive/folders/1edopnxBaiCm6uYZlZGUOkgwFObOIi5Xu'),
    ('Investigación Operativa',                            'https://drive.google.com/drive/folders/18EgbgvO2uGNCnq5cAhYI10y2uzffr5ej'),
    ('Legislación',                                        'https://drive.google.com/drive/folders/1TlsadHlFMIpmzabX1uCjhaV91wb_0Bcs'),
    ('Redes de Datos',                                     'https://drive.google.com/drive/folders/1r6Nlxv5vFNGErsfWCVaO9m8cymsdKWUl'),
    ('Simulación',                                         'https://drive.google.com/drive/folders/1PV8xRuG2KxIjlUSPKqKzwOa4sO0kQ22j'),
    ('Tecnologías para la Automatización',                 'https://drive.google.com/drive/folders/1CLxvJszVsu6FQGV69Gk4mdc4qSmxjtLW'),
    ('Gestión Gerencial',                                  'https://drive.google.com/drive/folders/19nLND6SrUzdIc551GUaM6OG3hv_HeAjv'),
    ('Análisis de Datos Empresariales',                    'https://drive.google.com/drive/folders/1KesChfQjq2kH3y04Nn8Jr6MKM266TWp6'),
    ('Seguridad en los Sistemas de Información',           'https://drive.google.com/drive/folders/15d8Q3SOX9fiu9FpukoUWBzlgtKqsYUFl'),
    ('Sistemas de Gestión',                                'https://drive.google.com/drive/folders/1B42RLaAwZwBj7mnqNV39BQz9irEG8olH'),
    ('Inteligencia Artificial',                            'https://drive.google.com/drive/folders/1_RosCnXOyUPFSx9WKEQOO3XCIA1ivE2q'),
    ('Práctica Supervisada',                               'https://drive.google.com/drive/folders/1BQOdDii72p4408jKEm104CM4VgtYkXcu')
) as v(materia, link)
join materia m on m.nombre = v.materia
cross join (select id from alumno where nombre = 'chedul' limit 1) a
cross join (select id from aporte_tag where nombre = 'Drive') t
where not exists (select 1 from aporte x where x.alumno_id = a.id and x.link = v.link);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
delete from aporte where descripcion = 'Biblioteca Chedul' and alumno_id in (select id from alumno where nombre = 'chedul');
-- +goose StatementEnd
