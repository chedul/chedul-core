-- Aportes-link a las carpetas de materia del Drive de Farizano.
--   Cada aporte apunta a la carpeta de una materia, con el titulo de la materia
--   y la descripcion "Drive de Farizano". Los carga un alumno sin acceso
--   (usuario "chedul"), asi que nadie puede iniciar sesion con el.
--   Es idempotente: se puede correr dos veces sin duplicar aportes.
-- +goose Up
-- +goose StatementBegin
insert into alumno (nombre, email, password, carrera_id)
select 'chedul', null, '!sin-acceso', c.id
from carrera c
where c.nombre = 'Ingeniería en Sistemas de Información'
  and not exists (select 1 from alumno where nombre = 'chedul');

insert into aporte (materia_id, alumno_id, titulo, descripcion, tag_id, link)
select m.id, a.id, v.materia, 'Drive de Farizano', t.id, v.link
from (values
    ('Álgebra y Geometría Analítica',                 'https://drive.google.com/drive/folders/1xvNbKt5iuTXUsxiPM9extA-xPlLP65Z9'),
    ('Algoritmos y Estructura de Datos',              'https://drive.google.com/drive/folders/1h-yQikmVpAP3bxRbIPikoEbZqYVPs9b1'),
    ('Análisis Matemático I',                         'https://drive.google.com/drive/folders/19H8XtKcCWaxSXgJ-ZuEAUkqm3Jbu4rA4'),
    ('Fisica',                                        'https://drive.google.com/drive/folders/1OB-109-zsnQhA32H67Wa5OUX71gFCFsS'),
    ('Lógica y Estructuras Discretas',                'https://drive.google.com/drive/folders/1CAl7fpv99vJXdlA4UgnfS4_9jRt-igkY'),
    ('Sistemas y Procesos de Negocio',                'https://drive.google.com/drive/folders/1KzSMZNofYGQiy1YsAooOXHw77cVsLH8m'),
    ('Análisis de Sistemas de Información',           'https://drive.google.com/drive/folders/1NKtOrBlWl8fVlCvgdMjegIfW9YDmcZsL'),
    ('Análisis Matemático II',                        'https://drive.google.com/drive/folders/1lhN1Ue-va-Wzy_1kNPxQw1aX0_t4DjkL'),
    ('Arquitectura de Computadoras',                  'https://drive.google.com/drive/folders/1xp3G_HqZ2QbH91cbhUXmwijRyq18XaHF'),
    ('Fisica II',                                     'https://drive.google.com/drive/folders/12zPAnaY4mR_PLIXATVNk6-qx1b3PF7du'),
    ('Inglés I',                                      'https://drive.google.com/drive/folders/1yrK1xcpq3uOt1cvpTwWlu1dWKYGnxKSQ'),
    ('Paradigmas de Programación',                    'https://drive.google.com/drive/folders/1Vf1pnhmg8IAMK8xEe4flh-yko-JbKlT7'),
    ('Química para Ingeniería en Sistemas de Información', 'https://drive.google.com/drive/folders/1SLNq4bWGzVPXQST2PEK0L5z555wn3kHd'),
    ('Sintaxis y Semántica de los Lenguajes',         'https://drive.google.com/drive/folders/15Rpa628_Pf3wHerl3n0FyH7hISZ2rxkt'),
    ('Sist. Rep. para Ingeniería en Sistemas de Información', 'https://drive.google.com/drive/folders/177XhH-EAUjyEzDqSlXfq_iwnDD3NJBWL'),
    ('Sistemas de Gestión de Base de Datos',          'https://drive.google.com/drive/folders/1aoCQBLnzT4PeSR2q3ta0-kvC8USrRAZr'),
    ('Complejidad y Técnicas de Diseño de Algoritmos', 'https://drive.google.com/drive/folders/1tyfVm4gNiDOa3UjgseJLkJkPODjzmkOc'),
    ('Comunicación de Datos',                         'https://drive.google.com/drive/folders/12ANVkDslVNw5JxbaXBOUZ_Cje5kW0f18'),
    ('Diseño de Sistemas de Información',             'https://drive.google.com/drive/folders/1L-Y7SSbNKt8ETsBCcePLVVnqE83bsuUs'),
    ('Sistemas Operativos',                           'https://drive.google.com/drive/folders/1_8Uk-M-yEDoEXuMOhzeWxsz2IEqCDnNT'),
    ('Economía',                                      'https://drive.google.com/drive/folders/1gbD6L6CgE3QfFi23EFg2BBkUUk-TTkyn'),
    ('Base de Datos',                                 'https://drive.google.com/drive/folders/1VVtmyPOBTqzGBnOlhnfOuoo-g365x9Og'),
    ('Ingeniería y Sociedad',                         'https://drive.google.com/drive/folders/1Hd09OJpveWzGHe1B9_VmShU2EyqbUQUD'),
    ('Inglés II',                                     'https://drive.google.com/drive/folders/1yFvAuCWCyLAmoMFAfyFnB7SHuxbGHTgp'),
    ('Análisis Numérico',                             'https://drive.google.com/drive/folders/1yp_NASVZ6ggAHw4cQOhKNAiuFp_RWKfp'),
    ('Probabilidad y Estadística',                    'https://drive.google.com/drive/folders/1QKKBpZLviEYrAr_ibzSmKL0-5jlHUfj9'),
    ('Administración de Sistemas de Información',     'https://drive.google.com/drive/folders/1DxkheSEt5bf1t1p5mMCrk97gdn0X9XQ4'),
    ('Agilidad Avanzada',                             'https://drive.google.com/drive/folders/1noW7rtq0mIWW0CW94R_ql2_ho1uCoCbW'),
    ('Aspectos Avanzados de Calidad de Software',     'https://drive.google.com/drive/folders/1K_Yvcnlt4g8r9v9hLsowMug22SKvDZy6'),
    ('Ingeniería y Calidad del Software',             'https://drive.google.com/drive/folders/1ZgFA057WWEKu_RhZ5jzIGSXVUYj4txGZ'),
    ('Investigación Operativa',                       'https://drive.google.com/drive/folders/1qEcrfNWNktzpOfRUmIqe7gTLVlaxDL9P'),
    ('Legislación',                                   'https://drive.google.com/drive/folders/1i3E-hD9Y-LD052DvzXHuXAb12yPYThD-'),
    ('Redes de Datos',                                'https://drive.google.com/drive/folders/1jhFXYkJY812jW-cU9rPsYiXOPueIns7x'),
    ('Simulación',                                    'https://drive.google.com/drive/folders/1m0P74e-dAHHhpYSDkpIS9ZG_LMBFf2ea'),
    ('Tecnologías para la Automatización',            'https://drive.google.com/drive/folders/1ghmv30rrJbXvFLy1HpN71re6iZ9o3D1u'),
    ('Gestión Gerencial',                             'https://drive.google.com/drive/folders/14BDyglPbRi82UvOnaTRfojhaW0sxF-tl'),
    ('Análisis de Datos Empresariales',               'https://drive.google.com/drive/folders/1EbO2rU8bx4H_D8I0eHkpJqawq1r38RoF'),
    ('Seguridad en los Sistemas de Información',      'https://drive.google.com/drive/folders/12wGgYE-gtjXSPpRn1at4vsjQdDSXjamb'),
    ('Sistemas de Gestión',                           'https://drive.google.com/drive/folders/1SMim11RL1uwbdUZTLLbi2Unq_dtIpHyh'),
    ('DevOps - Cultura, Herramientas y Procesos',     'https://drive.google.com/drive/folders/12elVJekdQLgpqXW8d3tzC2vTIRSt3z8t'),
    ('Inteligencia Artificial',                       'https://drive.google.com/drive/folders/1OwaNABEhlTAcgbYd7nqzZwtpdxwHfLE_'),
    ('Práctica Supervisada',                          'https://drive.google.com/drive/folders/1qha6fGpNWxpJjkgVo-5ddAjIiFo5Gumm')
) as v(materia, link)
join materia m on m.nombre = v.materia
cross join (select id from alumno where nombre = 'chedul' limit 1) a
cross join (select id from aporte_tag where nombre = 'Drive') t
where not exists (select 1 from aporte x where x.alumno_id = a.id and x.link = v.link);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
delete from aporte where alumno_id in (select id from alumno where nombre = 'chedul');
delete from alumno where nombre = 'chedul';
-- +goose StatementEnd
