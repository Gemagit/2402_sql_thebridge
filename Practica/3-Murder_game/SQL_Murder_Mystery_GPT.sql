/* PARTE 1 - BUSCAR AL ASESINO */
-- Se buscan en función de la fecha todas las escenas del crimen que fueron 'murders'
SELECT *
FROM crime_scene_report
WHERE date = 20180115 AND city = 'SQL City' AND type = 'murder';

-- Se buscan las dos direcciones de la descripción del testigo
SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave';

-- Se descarta la segunda dirección y nos quedamos el nombre del que viviía en la última casa de la primera dirección
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr' and name = 'Morty Schapiro'
ORDER BY 4 desc

-- Se busca el testimonio del testigo (Morty Schapiro) en 'interviews'
SELECT *
FROM interview WHERE person_id = 14887

-- Se busca los usuarios cuyo número de miembro empieza con la información del testigo
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%'

-- Se busca en el registro las matrículas que contengan (H42W)
SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%'

-- Se juntan los id de miembro que empiezan con (48Z...) de gimnasio con membresía 'gold' con las matrículas que contienen (...H42W...)
SELECT *
FROM get_fit_now_member
INNER JOIN person ON person.id = get_fit_now_member.person_id
INNER JOIN drivers_license ON person.license_id = drivers_license.id
WHERE 
	get_fit_now_member.id LIKE '48Z%' AND get_fit_now_member.membership_status = 'gold' and drivers_license.plate_number LIKE '%H42W%'

/* SE ENCUENTRA AL SOSPECHOSO */
-- Se buscan registros de Jeremy Bowers para ver su testimonio y vemos que confiesa el crimen y apunta a otra persona
SELECT *
from interview where person_id = 67318


/* PARTE 2 - BUSCAR AL PEZ GORDO */
-- Se busca a una mujer con las características que menciona el asesino en su declaración
SELECt *
FROM drivers_license
inner join person ON drivers_license.id = person.license_id
INNER JOIN facebook_event_checkin ON person.id = facebook_event_checkin.person_id
WHERE car_make = 'Tesla' and car_model = 'Model S' AND hair_color = 'red' and gender = 'female' AND event_name = 'SQL Symphony Concert'