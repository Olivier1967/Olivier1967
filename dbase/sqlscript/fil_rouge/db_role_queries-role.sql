/* Modifier le nom du role n°2 en "moderateur" */
UPDATE t_role SET role_name='moderateur' WHERE role_id=2;


/* Modifier le nom du role n°1
	nouveau nom: padawan
	nouvelle description: les petits nouveaux */
UPDATE t_role SET role_name='padawan', role_description='les petits nouveaux' WHERE role_id=1;

/*Sélectionner toutes les informations de tous les rôles*/
SELECT * FROM t_role;
SELECT role_id, role_description, role_register_code FROM t_role;

/*Sélectionner l'identifiant, le nom et la description de chaque rôle */
SELECT role_id, role_name, role_description FROM t_role;

/*Sélectionner l'identifiantet le nom du role n°3 */
SELECT role_id, role_name FROM t_role WHERE role_id=3;

/*Sélectionner l'identifiant, le nom et la description du rôle dont le libellé est "encadrant" */
SELECT role_id, role_name, role_description FROM t_role WHERE role_name='moderateur';

/*Sélectionner toutes les informations des rôles dont la description est vide */
SELECT role_id, role_name, role_description, role_register_code FROM t_role WHERE role_description IS NULL OR role_description= '';

/*Sélectionner toutes les informations des rôles dont la description n'est pas vide */
SELECT role_id, role_name, role_description, role_register_code FROM t_role WHERE role_description IS NOT NULL AND role_description <> '';

/*Sélectionner l'identifiant, le nom de role dont le nom contient la chaine "ra" */
SELECT role_id, role_name FROM t_role WHERE role_name LIKE '%ra%';

/*Sélectionner l'identifiant, le nom et la description des rôles dont le nom se termine par la lettre "r" */
SELECT role_id, role_name, role_description FROM t_role WHERE role_name LIKE '%r';
/*SELECT role_id, role_name, role_description FROM t_role WHERE role_name LIKE '%r' AND role_description IS NOT NULL;*/

/*Sélectionner l'identifiant, le nom et la description des rôles dont le nom commence par la lettre "r" */
SELECT role_id, role_name, role_description FROM t_role WHERE role_name LIKE 'r%';

/* trier la base */
SELECT role_id, role_name, role_description, role_register_code FROM t_role ORDER BY role_name DESC;
SELECT role_id, role_name, role_description, role_register_code FROM t_role ORDER BY role_name ASC;
/*SELECT role_id, role_name, role_description, role_register_code FROM t_role ORDER BY role_name ASC, role_description DESC;*/

f