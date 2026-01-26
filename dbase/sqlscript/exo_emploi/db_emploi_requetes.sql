/* -- Première partie -- */
/* 1. Donner nom, job, numéro et salaire de tous les employés,
puis seulement des employés du département 10 */

SELECT ename, job, sal
FROM emp;

SELECT ename, job, sal
FROM emp
WHERE deptno = 10;


/*2. Donner nom, job et salaire des employés de type MANAGER dont le salaire est supérieur à 2800 */

SELECT ename, job, sal
FROM emp
WHERE job = 'manager' AND sal > 2800;

/* 3. Donner la liste des MANAGER n'appartenant pas au département 30 */
SELECT ename, job, sal, deptno
FROM emp
WHERE job = 'manager' AND deptno <> 30;

/* 4. Liste des employés de salaire compris entre 1200 et 1400 */
SELECT ename, job, sal
FROM emp
WHERE sal >=1200 AND sal <=1400;

/* 5. Liste des employés des départements 10 et 30 classés dans l'ordre alphabétique */
SELECT ename, job, deptno
FROM emp
WHERE deptno=10 OR deptno=30
ORDER BY ename ASC;

/* 6. Liste des employés du département 30 classés dans l'ordre des salaires croissants */
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 30
ORDER BY sal ASC;

/* 7. Liste de tous les employés classés par emploi et salaires décroissants */
SELECT ename, job, sal
FROM emp
GROUP BY job DESC, sal DESC;

/* 8. Liste des différents emplois */
SELECT GROUP_CONCAT(' ',ename SEPARATOR ';') AS nomEmploye, job, COUNT(*) AS effectif
FROM emp
GROUP BY job;

SELECT job
FROM emp
GROUP BY job;

/* 9. Donner le nom du département où travaille ALLEN */
SELECT ename, emp.DEPTNO, dept.DNAME
from emp
INNER JOIN dept ON dept.DEPTNO = emp.DEPTNO
WHERE ename = 'allen';

/* 10. Liste des employés avec nom du département, nom, job, salaire classés par noms de départements et 
par salaires décroissants.*/
SELECT dept.DNAME, ename, job, sal
from emp
INNER JOIN dept ON dept.DEPTNO = emp.DEPTNO
ORDER BY dept.DNAME, sal DESC;


/*11. Liste des employés vendeurs (SALESMAN) avec affichage de nom, salaire, commissions, salaire + 
commissionsv*/
SELECT ename, job, sal, comm, SUM(sal+comm) AS commission
from emp
WHERE comm IS NOT NULL
group BY comm;

/* 12. Liste des employés du département 20: nom, job, date d'embauche sous forme VEN 28 FEV 1997' */
/* pour voir la TIME ZONE */
SELECT @@session.time_zone;
SHOW VARIABLES LIKE 'lc_time_names';
/* --- fin ---- */

SET lc_time_names = 'fr_FR';
SELECT ename, job, DATE_FORMAT(hiredate, "%a %d %b %Y") AS fdate
from emp
where DEPTNO = 20;

/* 13. Donner le salaire le plus élevé par département */
SELECT ename, job, max(sal) AS salary, deptno
from emp
GROUP BY deptno
ORDER BY salary

/* 14. Donner département par département masse salariale, nombre d'employés, salaire moyen par type 
d'emploi. */
SELECT job, deptno, sum(sal) AS Msalarial, COUNT(ename) as nbEmploye, AVG(sal) AS salaireMoyen
from emp
GROUP BY deptno

/* 15. Même question mais on se limite aux sous-ensembles d'au moins 2 employés */



/* 16. Liste des employés (Nom, département, salaire) de même emploi que JONES */
SELECT job, ename, deptno, sal
FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'jones') -- sous requete

/*17. Liste des employés (nom, salaire) dont le salaire est supérieur à la moyenne globale des salaires */
SELECT ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp);

/* 18. Création d'une table PROJET avec comme colonnes numéro de projet (3 chiffres), nom de projet(5 
caractères), budget. Entrez les valeurs suivantes:
101, ALPHA, 96000
102, BETA, 82000
103, GAMMA, 15000 */

DROP TABLE if EXISTS projet;

CREATE TABLE projet(
num_projet INT(3) NOT NULL,
nom_projet VARCHAR(5),
budget int(5)
);

INSERT INTO projet
(num_projet, nom_projet, budget)
VALUE
(101, 'alpha', 96000),
(102, 'beta', 82000),
(103, 'gamma', 15000);

ALTER TABLE projet ADD PRIMARY KEY (num_projet);

/*19. Ajouter l'attribut numéro de projet à la table EMP et affecter tous les vendeurs du département 30 
au projet 101, et les autres au projet 102 */
ALTER TABLE emp ADD num_projet INT(3);

ALTER TABLE emp ADD CONSTRAINT fk_num_projet FOREIGN KEY (num_projet) REFERENCES projet(num_projet);

UPDATE emp
SET num_projet = 101
WHERE deptno = 30;
 
UPDATE emp
SET num_projet = 102
WHERE deptno <> 30;

/* 20. Créer une vue comportant tous les employés avec nom, job, nom de département et nom de projet */
SELECT ename, job, dept.DNAME, projet.nom_projet
FROM emp
INNER JOIN dept ON dept.DEPTNO = emp.DEPTNO
INNER JOIN projet ON projet.num_projet = emp.num_projet

/* 21. A l'aide de la vue créée précédemment, lister tous les employés avec nom, job, nom de département 
et nom de projet triés sur nom de département et nom de projet */
SELECT ename, job, dept.DNAME, projet.nom_projet
FROM emp
INNER JOIN dept ON dept.DEPTNO = emp.DEPTNO
INNER JOIN projet ON projet.num_projet = emp.num_projet
ORDER BY dname, nom_projet;

/* 22. Donner le nom du projet associé à chaque manage */
SELECT emp.JOB, nom_projet
FROM projet
INNER JOIN emp ON emp.num_projet = projet.num_projet
GROUP BY job;