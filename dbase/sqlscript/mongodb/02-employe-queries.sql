--00 format date français :

db.emp.aggregate([
  {
    $match: {
      _id: 8001  // Filter by ID
    }
  },
  {
    $project: {
      _id: 1,  // Preserve the _id field
      formattedDate: {
        $dateToString: {
          format: "%d/%m/%Y",  // Use %Y for the four-digit year
          date: "$HIREDATE"
        }
      }
    }
  }
]);

/* résultat:
{
  _id: 7369,
  formattedDate: '05/10/1999'
}
*/
/* ************************* transformer les date string en date isodate */
db.collection.aggregate([
  {
    $project: {
      myDate: {
        $dateFromString: {
          dateString: "$hiredate",
          format: "%Y-%m-%d",
          onError: null
        }
      }
    }
  }
])
-- ------------ avec jour de semaine ---------------
db.emp.aggregate([
  {
    $match: {
      _id: 8001  // Filter by ID
    }
  },
  {
    $project: {
      _id: 1,  // Preserve the _id field
      formattedDate: {
        $concat: [
          {
            $switch: {
              branches: [
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 1] }, then: "Sunday" },
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 2] }, then: "Monday" },
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 3] }, then: "Tuesday" },
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 4] }, then: "Wednesday" },
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 5] }, then: "Thursday" },
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 6] }, then: "Friday" },
                { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 7] }, then: "Saturday" }
              ],
              default: "Unknown"  // Fallback for unexpected cases
            }
          },
          " ",  // Space between weekday and date
          {
            $dateToString: {
              format: "%d-%m-%Y",  // Format the hire date as DD/MM/YYYY
              date: "$HIREDATE"
            }
          }
        ]
      }
    }
  }
]);
/*  ----- resultat ----------
{
  _id: 8001,
  formattedDate: 'Saturday 21-08-1976'
}
*/


-- date anglais :
db.emp.aggregate([
    {
    $match: {
      HIREDATE: {$gte : new ISODate("1970-01-12T00:00:00Z")}
    }
  },
  {
    $project: {
      HIREDATE: 1,
      day: { $dayOfMonth: "$HIREDATE" },
      month: { $month: "$HIREDATE" },
      year: { $year: "$HIREDATE" }
    }
  },
  {
    $addFields: {
      monthName: {
        $arrayElemAt: [
          ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
          { $subtract: ["$month", 1] }
        ]
      },
      weekday: {
        $switch: {
          branches: [
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 1] }, then: "Sunday" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 2] }, then: "Monday" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 3] }, then: "Tuesday" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 4] }, then: "Wednesday" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 5] }, then: "Thursday" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 6] }, then: "Friday" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 7] }, then: "Saturday" }
          ],
          default: ""
        }
      }
    }
  },
  {
    $project: {
      formattedDate: { $concat: ["$weekday", " ", { $toString: "$day" }, " ", "$monthName", " ", { $toString: "$year" }] }
    }
  }
])

-- date français :
db.emp.aggregate([
    {
    $match: {
      HIREDATE: {$gte : new ISODate("1970-01-12T00:00:00Z")}
    }
  },
  {
    $project: {
      HIREDATE: 1,
      day: { $dayOfMonth: "$HIREDATE" },
      month: { $month: "$HIREDATE" },
      year: { $year: "$HIREDATE" }
    }
  },
  {
    $addFields: {
      monthName: {
        $arrayElemAt: [
          ["Jan", "Fev", "Mar", "Avr", "May", "Jui", "Jui", "Aou", "Sep", "Oct", "Nov", "Dec"],
          { $subtract: ["$month", 1] }
        ]
      },
      weekday: {
        $switch: {
          branches: [
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 1] }, then: "Dim" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 2] }, then: "Lun" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 3] }, then: "Mar" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 4] }, then: "Mer" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 5] }, then: "Jeu" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 6] }, then: "Ven" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 7] }, then: "Sam" }
          ],
          default: ""
        }
      }
    }
  },
  {
    $project: {
      formattedDate: { $concat: ["$weekday", " ", { $toString: "$day" }, " ", "$monthName", " ", { $toString: "$year" }] }
    }
  }
])

-- ************************** query ************************** --
-- 1. Donner nom, job, numéro et salaire de tous les employés, 
db.emp.find({},{_id:0, ename:1, job:1, deptno:1, sal:1})

-- Puis seulement des employés du département 10
db["emp"].find({}, {_id:0, ename:1, job:1, deptno:'10'})

-- 2. Donner nom, job et salaire des employés de type MANAGER dont le salaire est supérieur à 2800
db["emp"].find({sal: {$gt: 2800}}, {_id:0, ename:1, job:1, sal:1})

-- 3. Donner la liste des MANAGER n'appartenant pas au département 30
db["emp"].find({deptno: {$ne: 30}}, {_id:0, ename:1, job:1, sal:1, deptno:1})

-- 4. Liste des employés de salaire compris entre 1200 et 1400
db["emp"].find({sal: {$gte: 1200, $lt: 1400}}, {_id:0, ename:1, job:1, sal:1, deptno:1})

-- 5. Liste des employés des départements 10 et 30 classés dans l'ordre alphabétique
db["emp"].find({$or: [{deptno: 30}, {deptno: 10}]}, {_id:0, ename:1, job:1, sal:1, deptno:1}).sort({ename:1})

-- 6. Liste des employés du département 30 classés dans l'ordre des salaires croissants
db["emp"].find({}, {_id:0, ename:1, job:1, sal:1, deptno:'30'}).sort({sal:1})

-- 7. Liste de tous les employés classés par emploi et salaires décroissants
db.emp.find({},{_id:0, ename:1, job:1, sal:1, job:1}).sort({job:1, sal:-1})

/* -- avec aggregate
db.emp.aggregate([
  { $sort: { job: 1, sal: -1 } },
  { $group: { _id: { job: "$job" }, sal: { $first: "$sal" } } }
])
*/

-- 8. Liste des différents emplois
db.emp.distinct("job")

-- 9. Donner le nom du département où travaille ALLEN
db["emp"].find({ename:'ALLEN'}, {_id:0, ename:1, dname:1})


-- 10. Liste des employés avec nom du département, nom, job, salaire classés par noms de départements et par salaires décroissants.
db.emp.find({},{_id:0, dname:1, ename:1, job:1, sal:1}).sort({dname:1, sal:-1})

 
-- 11. Liste des employés vendeurs (SALESMAN) avec affichage de nom, salaire, commissions, salaire + commissions
-- db.emp.aggregate([ {$group: {_id: '$job', totalSal: {$sum: '$sal'},},},])
db.emp.aggregate([
  {
    $match: { job: "SALESMAN" }
  },
  {
    $project: {
      _id: 0,
      ename: 1,
      job: 1,
      sal: 1,
      comm: 1,
      salCommSum: { $add: [ { $ifNull: [ "$sal", 0 ] }, { $ifNull: [ "$comm", 0 ] } ] }
    }
  }
])


-- 12. Liste des employés du département 20: nom, job, date d'embauche sous forme VEN 28 FEV 1997'
db.emp.aggregate([
    {
    $match: {
      HIREDATE: {$gte : new ISODate("1970-01-12T00:00:00Z")}
    }
  },
  {
    $project: {
      HIREDATE: 1,
      day: { $dayOfMonth: "$HIREDATE" },
      month: { $month: "$HIREDATE" },
      year: { $year: "$HIREDATE" }
    }
  },
  {
    $addFields: {
      monthName: {
        $arrayElemAt: [
          ["Jan", "Fev", "Mar", "Avr", "May", "Jui", "Jui", "Aou", "Sep", "Oct", "Nov", "Dec"],
          { $subtract: ["$month", 1] }
        ]
      },
      weekday: {
        $switch: {
          branches: [
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 1] }, then: "Dim" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 2] }, then: "Lun" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 3] }, then: "Mar" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 4] }, then: "Mer" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 5] }, then: "Jeu" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 6] }, then: "Ven" },
            { case: { $eq: [{ $dayOfWeek: "$HIREDATE" }, 7] }, then: "Sam" }
          ],
          default: ""
        }
      }
    }
  },
  {
    $project: {
      formattedDate: { $concat: ["$weekday", " ", { $toString: "$day" }, " ", "$monthName", " ", { $toString: "$year" }] }
    }
  }
])

-- 13. Donner le salaire le plus élevé par département
-- not ok: db.emp.find({},{_id:0, ename:1, dname:1, deptno:1 sal:1}).sort({deptno:1, sal:-1})
db.emp.aggregate([
  { $sort: { deptno: 1, sal: -1 } },
  { $group: { _id: { deptno: "$deptno" }, sal: { $first: "$sal" } } }
])

-- autre
db.emp.aggregate([
  { $group: { _id: { deptno: "$deptno" }, sal: { $max: "$sal" } } }
])

-- autre avec non null
db.emp.aggregate([
      {
    $match: {
      sal: {$ne : null}
    }
  },
  { $group: { _id: { deptno: "$deptno" }, sal: { $max: "$sal" } } }
])

-- autre avec sort
db.emp.aggregate([
  { $group: { _id: { deptno: "$deptno" }, sal: { $max: "$sal" } } }
]).sort({_id:1}) --ou .sort({sal:1})

-- 14. Donner département par département masse salariale, nombre d'employés, salaire moyen par type d'emploi.
db.emp.aggregate([
   {
    $match: { deptno: {$ne : null} }
  },
  {
    $group: {
      _id: {deptno: "$deptno"},
      sal: {$avg: "$sal"},
      total_id: {$sum: 1},
      total_sal: {$sum: "$sal"}

    }
  }
]).sort({_id:1})












-- PARTIE 2 **************************************************

-- 1. Afficher la liste des managers des départements 20 et 30

SELECT
   ENAME AS 'Manager',
   DEPTNO AS 'Département'
FROM
   emp
WHERE
   JOB LIKE 'MANAGER'
   AND
   (  
      DEPTNO = 20
      OR 
      DEPTNO = 30
   );

-- 2. Afficher la liste des employés qui ne sont pas manager et qui ont été embauchés en 81

SELECT
   ENAME AS 'Employé',
   JOB AS 'Poste',
   HIREDATE AS "Date d'embauche"
FROM
   emp
WHERE
   JOB NOT LIKE 'MANAGER'
   AND 
   YEAR(HIREDATE) = 1981;

-- 3. Afficher la liste des employés ayant une commission

SELECT
   ENAME AS 'Employé',
   COMM AS 'Commission'
FROM
   emp
WHERE
   COMM IS NOT NULL
   AND
   COMM > 0;

-- 4. Afficher la liste des noms, numéros de département, jobs et date d'embauche triés par Numero de Département et JOB les derniers embauches d'abord.

SELECT
   ENAME AS 'Employé',
   DEPTNO AS 'Num département',
   JOB AS 'Poste',
   HIREDATE AS "Date d'embauche"
FROM
   emp
ORDER BY
   DEPTNO ASC,
   JOB ASC,
   HIREDATE DESC;

-- 5. Afficher la liste des employés travaillant à DALLAS

SELECT
   ENAME AS 'Employé'
   LOC AS 'Localisation'
FROM
   emp AS E
INNER JOIN
   dept AS D ON D.DEPTNO = E.DEPTNO
WHERE
   LOC LIKE 'DALLAS';

-- 6. Afficher les noms et dates d'embauche des employés embauchés avant leur manager, avec le nom et date d'embauche du manager.

SELECT
   E.ENAME AS 'Employé',
   E.HIREDATE AS "Date d'embauche",
   E2.ENAME AS 'Manager',
   E2.HIREDATE AS "Date d'embauche"
FROM
   emp AS E
INNER JOIN
   emp AS E2 ON E2.EMPNO = E.MGR
WHERE
   E2.HIREDATE > E.HIREDATE;

-- 7. Lister les numéros des employés n'ayant pas de subordonné.

SELECT
	E.EMPNO AS 'No Employé sans subordonné'
FROM
	emp AS E
LEFT JOIN
	emp AS E2 ON E.EMPNO = E2.MGR
WHERE
	E2.EMPNO IS NULL;

-- 8. Afficher les noms et dates d'embauche des employés embauchés avant BLAKE.

SELECT
	E.ENAME AS 'Nom',
	E.HIREDATE AS 'Date embauche'
FROM
	emp AS E
INNER JOIN
	emp AS E2 ON E2.ENAME = 'BLAKE'
WHERE
	E.HIREDATE < E2.HIREDATE;

-- 9. Afficher les employés embauchés le même jour que FORD.

SELECT
	E.ENAME AS 'Nom',
	E.HIREDATE AS 'Date embauche'
FROM
	emp AS E
INNER JOIN
	emp AS E2 ON E2.ENAME = 'FORD'
WHERE
	E.HIREDATE = E2.HIREDATE;

-- 10. Lister les employés ayant le même manager que CLARK.

SELECT
	E.ENAME AS 'Nom',
	E.MGR 'Manager'
FROM
	emp AS E
INNER JOIN
	emp AS E2 ON E2.ENAME = 'CLARK'
WHERE
	E.MGR = E2.MGR;

-- 11. Lister les employés ayant même job et même manager que TURNER.

SELECT
	E.ENAME AS 'Nom',
	E.JOB 'Poste'
FROM
	emp AS E
INNER JOIN
	emp AS E2 ON E2.ENAME = 'TURNER'
WHERE
	E.MGR = E2.MGR
	AND
	E.JOB = E2.JOB;

-- 12. Lister les employés du département RESEARCH embauchés le même jour que quelqu'un du département SALES.

SELECT
   E.ENAME,
   E.HIREDATE
FROM
   emp AS E
INNER JOIN
   dept AS D ON E.DEPTNO = D.DEPTNO
INNER JOIN
   emp AS E2 ON E.HIREDATE = E2.HIREDATE
INNER JOIN
   dept AS D2 ON E2.DEPTNO = D2.DEPTNO
WHERE
   D.DNAME = 'RESEARCH'
   AND D2.DNAME = 'SALES';

-- 13. Lister le nom des employés et également le nom du jour de la semaine correspondant à leur date d'embauche.

SELECT
   ENAME AS 'Nom',
   DATE_FORMAT(HIREDATE, '%W')
FROM
   emp;


-- 14. Donner, pour chaque employé, le nombre de mois qui s'est écoulé entre leur date d'embauche et la date actuelle.

SELECT
  ENAME,
  HIREDATE,
  TIMESTAMPDIFF(MONTH, HIREDATE, CURDATE()) AS mois_ecoules
FROM
  emp;

-- 15. Afficher la liste des employés ayant un M et un A dans leur nom.

SELECT
	ENAME
FROM
	emp
WHERE
	ENAME LIKE '%M%'
  	AND ENAME LIKE '%A%';


-- 16. Afficher la liste des employés ayant deux 'A' dans leur nom.

SELECT
	ENAME
FROM
	emp
WHERE
	ENAME LIKE '%A%A%';


-- 17. Afficher les employés embauchés avant tous les employés du département 10.

SELECT
	ENAME,
	HIREDATE
FROM
	emp
WHERE
	HIREDATE < ALL (
		SELECT
			HIREDATE
		FROM
			emp
		WHERE
			DEPTNO = 10
);


-- 18. Sélectionner le métier où le salaire moyen est le plus faible.

SELECT
	JOB
FROM
	emp
GROUP BY
	JOB
ORDER BY
	AVG(SAL) ASC
LIMIT 1;


-- 19. Sélectionner le département ayant le plus d'employés.

SELECT
	d.DEPTNO,
	d.DNAME,
	COUNT(e.EMPNO) AS nombre_employes
FROM
	dept d
INNER JOIN
	emp e ON d.DEPTNO = e.DEPTNO
GROUP BY
	d.DEPTNO, d.DNAME
ORDER BY
	nombre_employes DESC
LIMIT 1;


-- 20. Donner la répartition en pourcentage du nombre d'employés par département selon le modèle ci-dessous
-- Département Répartition en % 
-- ----------- ----------------
-- 10 21.43 
-- 20 35.71 
-- 30 42.86


