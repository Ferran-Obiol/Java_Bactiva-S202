##########################################################
#Base de dades Tienda
/*1-Llista el nom de tots els productos que hi ha en la taula producto.*/
SELECT nombre from producto;
/*2-Llista els noms i els preus de tots els productos de la taula producto.*/
SELECT nombre, precio from producto;
/*3-Llista totes les columnes de la taula producto.*/
SELECT * from producto;
/*4-Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).*/
SELECT nombre, precio, truncate(precio * 1.20, 2) from producto;
/*5-Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.*/
SELECT nombre, precio as precio_on_eur, truncate(precio * 1.20, 2) as precio_on_usd from producto;
/*6-Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.*/
SELECT upper(nombre), precio from producto;
/*7-Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula*/
SELECT lower(nombre), precio from producto;
/*8-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
SELECT nombre, upper(substr(nombre,1,2)) FROM fabricante;
/*9-Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.*/
SELECT nombre, round(precio) FROM producto;
/*10-Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
SELECT nombre, truncate(precio,0) FROM producto;
/*11-Llista el codi dels fabricants que tenen productos en la taula producto.*/
SELECT f.codigo FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
/*12-Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.*/
SELECT DISTINCT(f.codigo) FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
/*13-Llista els noms dels fabricants ordenats de manera ascendent.*/
SELECT nombre FROM fabricante ORDER BY nombre ASC;
/*14-Llista els noms dels fabricants ordenats de manera desscendent.*/
SELECT nombre FROM fabricante ORDER BY nombre DESC;
/*15-Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.*/
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
/*16-Retorna una llista amb les 5 primeres files de la taula fabricante.*/
SELECT * FROM fabricante LIMIT 5;
/*17-Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
SELECT * FROM fabricante LIMIT 3, 2;
/*18-Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY*/
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
/*19-Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*20-Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.*/
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.codigo = 2;
/*21-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.*/
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*22-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.*/
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.codigo ASC;
/*23-Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.*/
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*24-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.*/
SELECT p.nombre, min(p.precio), f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*25-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.*/
SELECT p.nombre, max(p.precio), f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*26-Retorna una llista de tots els productes del fabricador Lenovo.*/
SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
/*27-Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.*/
SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
/*28-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.*/
SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
/*29-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.*/
SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
/*30-Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.*/
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e'; 
/*31-Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.*/
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%'; 
/*32-Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent) */
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC; 
/*33-Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.*/
SELECT DISTINCT(f.codigo), f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*34-Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.*/ 
SELECT DISTINCT(f.codigo), f.nombre FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*35-Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.*/
SELECT DISTINCT(f.codigo), f.nombre FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.nombre IS NULL ;
/*36-Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).*/
SELECT * FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
/*37-Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).*/
SELECT * FROM producto WHERE precio >= (SELECT max(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
/*38-Llista el nom del producte més car del fabricador Lenovo.*/
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio desc LIMIT 1;
/*39-Llista el nom del producte més barat del fabricant Hewlett-Packard.*/
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo where f.nombre = 'Hewlett-Packard' ORDER BY p.precio desc LIMIT 1;
/*40-Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.*/
SELECT p.* FROM producto p WHERE p.precio >= (SELECT max(precio) FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo where f.nombre = 'Lenovo');
/*41-Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.*/
SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= (SELECT avg(precio) FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo where f.nombre = 'Asus') AND f.nombre = 'Asus';
#################################################
# Base de dades Universidad
/*1-Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. 
El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/*2-Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono is NULL;
/*3-Retorna el llistat dels alumnes que van néixer en 1999.*/
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/*4-Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.*/
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono is NULL AND nif LIKE '%K';
/*5-Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
SELECT * FROM asignatura where cuatrimestre = 1 AND curso = 3 and id_grado=7;
/*6-Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
SELECT p.nombre, p.apellido1, p.apellido2, d.nombre from persona p INNER JOIN profesor pr on p.id=pr.id_profesor INNER JOIN departamento d on pr.id_profesor = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;  
/*7-Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.*/
SELECT a.nombre, cs.anyo_inicio, cs.anyo_fin from persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN asignatura a ON asma.id_asignatura = a.id INNER JOIN curso_escolar cs ON asma.id_alumno = cs.id;
/*8-Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
SELECT DISTINCT (d.nombre) FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento INNER JOIN asignatura a ON (a.id_profesor = p.id_profesor) INNER JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/*9-Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
SELECT DISTINCT(p.nombre) FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN curso_escolar cs ON asma.id_curso_escolar = cs.id WHERE cs.anyo_inicio = 2018 AND cs.anyo_fin = 2019;
####################################
#Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
/*1-Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER by d.nombre, p.apellido1, p.apellido2, p.nombre; 
/*2-Retorna un llistat amb els professors que no estan associats a un departament.*/
SELECT * FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;
/*3-Retorna un llistat amb els departaments que no tenen professors associats*/
SELECT d.* FROM profesor pr RIGHT JOIN departamento d  ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;
/*4-Retorna un llistat amb els professors que no imparteixen cap assignatura.*/
SELECT p.* FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;
/*5-Retorna un llistat amb les assignatures que no tenen un professor assignat.*/
SELECT a.* FROM profesor p RIGHT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE p.id_profesor IS NULL;
/*6-Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/
####################################################################
#Consultes resum
/*1-Retorna el nombre total d'alumnes que hi ha.*/
SELECT count(*) FROM persona p WHERE tipo = 'alumno'; 
/*2-Calcula quants alumnes van néixer en 1999.*/
SELECT count(*) FROM persona p WHERE tipo = 'alumno' AND year(p.fecha_nacimiento) = 1999; 
/*3-Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.*/
SELECT count(*) as num_prof, d.nombre FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id GROUP by d.nombre order by num_prof DESC;
/*4-Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat. */
SELECT d.*, count(p.id_profesor) as num_prof FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP by d.nombre;	 
/*5-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
SELECT g.nombre, count(a.nombre) as num_assig FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY num_assig DESC;
/*6-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.*/
SELECT g.nombre, count(a.nombre) as num_assig FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id HAVING num_assig > 40 ORDER BY num_assig DESC;
/*7-Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.*/
SELECT g.nombre, tipo, sum(creditos) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado  GROUP by a.tipo, a.id_grado; 
/*8-Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.*/
SELECT DISTINCT(c.anyo_inicio), count(*) FROM curso_escolar c LEFT JOIN alumno_se_matricula_asignatura asma ON asma.id_curso_escolar=c.id GROUP BY id_curso_escolar, id_alumno;
/*9-Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.*/
SELECT p.id, p.nombre, p.apellido1, p.apellido2, count(a.id_profesor) as num_assigs FROM persona p INNER JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor GROUP BY pr.id_profesor ORDER BY num_assigs DESC; 
/*10-Retorna totes les dades de l'alumne més jove.*/
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento ASC LIMIT 1;
/*11-Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.*/
SELECT * from profesor pr INNER JOIN persona p on p.id = pr.id_profesor WHERE id_profesor NOT IN (SELECT id_profesor FROM asignatura);