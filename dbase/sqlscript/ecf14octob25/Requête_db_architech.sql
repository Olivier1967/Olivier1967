/* requete ecf mardi 14 octobre */
USE db_architecte;

/* requete 1 selectionner l'identifiant, le nom de tous les clients dont le numéro de téléphone commence par '04' */
SELECT client_ref, client_nom, client_telephone
FROM clients
WHERE client_telephone LIKE '%04%';
/* correction 1 */
OK

/* requete 2 selectionner l'identifiant, le nom et le type de tous les clients qui sont des particuliers */
SELECT client_ref, client_nom, type_clients.type_client_libelle
FROM clients
INNER JOIN type_clients ON type_clients.type_client_id = clients.type_client_id
WHERE type_clients.type_client_libelle = 'Particulier';
/* correction 2 */
OK

/* requete 3 selectionner l'identifiant, le nom et le type de tous les clients qui ne sont pas des particuliers*/
SELECT client_ref, client_nom, type_clients.type_client_libelle
FROM clients
INNER JOIN type_clients ON type_clients.type_client_id = clients.type_client_id
WHERE type_clients.type_client_libelle <> 'Particulier';
/* correction 3 */
OK

/* requete 4 Sélectionner les projets qui ont été livrés en retard */
SELECT projet_date_fin_prevue, projet_date_fin_effective, clients.client_nom
FROM projets
INNER JOIN clients ON clients.client_ref = projets.client_ref
WHERE projet_date_fin_prevue < projet_date_fin_effective;
/* correction 3 
OK
-- plus :
SELECT projet_date_fin_prevue, projet_date_fin_effective, clients.client_nom
FROM projets
WHERE projet_date_fin_effective > projet_date_fin_prevue
OR projet_date_fin_prevue < CURDATE() AND projet_date_fin_effective IS NULL;
*/

/* requete 5 Sélectionner la date de dépot la date de fin prévue, les superficies le prix de tous les projets avec le ,nom du clien et le nom de l'achitect associés au projet*/
SELECT projet_date_depot, projet_date_fin_prevue, projet_superficie_totale, projet_superficie_batie, projet_prix, clients.client_nom, employes.emp_nom
FROM projets
INNER JOIN clients ON clients.client_ref = projets.client_ref
INNER JOIN employes ON employes.emp_matricule = projets.emp_matricule
where employes.fonction_id=1;
-- (select employes.fonction_id FROM employes WHERE employes.fonction_id =1);
/* correction 5
SELECT 
projet_date_depot,
 projet_date_fin_prevue,
 projet_superficie_totale,
 projet_superficie_batie,
 projet_prix,
 client_nom,
 emp_nom,
 emp_prenom
 FROM projets
 INNER JOIN employes ON employes.emp_matricule = projets.emp_matricule
 INNER JOIN clients ON clients.client_ref = projets.client_ref
 */

/* requete 6 Sélectionner tous les projets (dates superficies prix) avec le nombre d'intervenants autres que le client et l'architecte */
SELECT projet_date_depot, projet_date_fin_prevue, projet_superficie_totale, projet_superficie_batie, projet_prix, clients.client_nom, employes.emp_nom
FROM projets
INNER JOIN clients ON clients.client_ref = projets.client_ref
INNER JOIN employes ON employes.emp_matricule = projets.emp_matricule
where employes.fonction_id <> 1;
/* correction 6
SELECT 
projet_date_depot,
 projet_date_fin_prevue,
 projet_date_fin_effective,
 projet_superficie_totale,
 projet_superficie_batie,
 projet_prix,
 count(PA.emp_matricule) AS 'nombre Intervenant'
 FROM projets as P
 INNER JOIN participer AS PA ON PA.projet_ref = P.projet_ref
group by P.projet_ref;
 */

/* requete 7 */
SELECT type_projet_libelle, (select COUNT(type_projet_libelle) FROM type_projets) AS nbprojets, projets.projet_prix
FROM type_projets
INNER JOIN projets ON projets.type_projet_id = type_projets.type_projet_id
order BY type_projet_libelle;

SELECT type_projet_libelle, count(type_projet_libelle)
FROM type_projets
group BY type_projet_libelle;
/* correction 7
SELECT type_projet_libelle, count(*), AVG(projet_prix)
 FROM projets
 INNER JOIN type_projets ON type_projets.type_projet_id = projets.type_projet_id
group by type_projet_libelle;
 */
/* requete 8 */
SELECT type_travaux_libelle, max(projets.projet_superficie_totale) AS superficie
FROM type_travaux
INNER JOIN projets ON projets.type_projet_id = type_travaux.type_travaux_id
group BY type_travaux_libelle;

/* requete 9 */
SELECT projet_date_depot, projet_date_fin_prevue, projet_prix, clients.client_nom, clients.client_telephone, adresses.adresse_num_voie, adresses.adresse_voie,
 adresses.adresse_code_postal, adresses.adresse_ville, type_travaux.type_travaux_libelle, type_projets.type_projet_libelle
FROM projets
INNER JOIN clients ON clients.client_ref = projets.client_ref
INNER JOIN adresses ON adresses.adresse_id = projets.adresse_id
INNER JOIN type_travaux ON type_travaux.type_travaux_id = projets.type_travaux_id
INNER JOIN type_projets ON type_projets.type_projet_id = projets.type_projet_id
/* correction 9 */
OK


/* requete 10 */
SELECT client_nom, adresses.adresse_ville
FROM clients
INNER JOIN adresses ON adresses.adresse_id = clients.adresse_id
WHERE client_nom LIKE adresses.adresse_ville;
/* correction 2
SELECT projet_ref, adresses.adresse_ville
FROM adresses
NATURAL JOIN projets
NATURAL JOIN clients
WHERE clients.adresse_id = projets.adresse_id
*/

