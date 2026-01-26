# Projet Fil-Rouge #1

Gérer des utilisateurs dans une application Web (comptes utilisateurs, droits...)

Ceci est un projet fil-rouge qui sera complété petit à petit.

**Dans l'ordre vous allez réaliser :**

1. FRONTEND : Les vues HTML/CSS (frontend)
2. BASE DE DONNEES: Le stockage des comptes utilisateurs
3. BACKEND : Les services mettant en relation le frontend et la base de données 

## Contexte 

Dans chaque application, les utilisateurs ont la possibilité de créer un compte pour accéder aux  fonctionalités avancées. Dans certains cas, disposer d'un compte utilisateur est obligatoire pour accéder à l'application.

## Les utilisateurs 

Un utilisateur est caractérisé par un *nom*, *prénom*, une *adresse email*.

Un utilisateur enregistré est associé à un rôle parmi la liste suivante : **Usager**, **Encadrant**, **Administrateur**.

Un utilisateur non identifié est considéré comme un **invité**.

## Les groupes d'utilisateurs

- **Invité**
    - Un invité peut s’identifier
    - Après identification, il est redirigé vers la page de son profil
    - Un invité peut créer un compte s’il dispose du code d’inscription
    - Après la création, il est redirigé vers le formulaire d’identification
    - Un invité peut demander à réinitialiser son mot de passe
- **Usager**
    - Un usager peut consulter son profil
    - Un usager peut modifier les informations de son propre profil sauf son rôle
    - Un usager peut parcourir la liste des utilisateurs enregistrés
    - La liste des utilisateurs affiche : Nom, Prénom, Intitulé du rôle
    - Un usager ne peut pas consulter les fiches individuelles des autres utilisateurs
    - Un usager peut se déconnecter de l’application
- **Encadrant**
    - Un encadrant est un usager avec privilèges accrus
    - Un encadrant peut consulter les profils individuels des usagers et encadrants
    - Un encadrant peut modifier les informations des usagers sauf leur rôle et leur mot de passe
- **Administrateur**
    - Un administrateur est un encadrant avec privilèges accrus
    - Un administrateur peut consulter le profil individuel de n’importe quel utilisateur
    - Un administrateur peut modifier toutes les informations d’un utilisateur enregistré
    - Un administrateur peut ajouter un utilisateur sans code d’inscription
    - Un administrateur peut supprimer un utilisateur
    
> Si nécessaire, ajoutez les cas d’utilisation supplémentaires que vous jugerez pertinents. Toutefois, gardez en mémoire que dans un projet client, chaque fonctionnalité ajoutée coûte du temps et doit être justifiée auprès des décideurs.

# Partie 1 : Créer les vues 

La 1ère étape consiste à créer les différentes vues HTML/CSS nécessaire à la future application de gestion des utilisateurs.

**Voici la démarche à adopter:**

1. Faites un FORK du dépôt suivant :  [gestion-utilisateurs](https://github.com/mdevoldere/gestion-utilisateurs-2503)
    - Lors du FORK, ajoutez vos initiales à la fin du nom du dépôt.
2. Cloner votre copie du dépôt sur votre machine locale.
3. Choisissez un jeu de couleur pour votre application
    - Créer sa palette de couleurs sur [Coolors.co](https://coolors.co)
    - Enregistrer la palette de couleur dans des variables CSS
4. Implémenter les vues HTML/CSS : 
    - **index.html** : Ne rien faire pour le moment
    - **roles.html** : Lister les différents rôles dans un tableau (nom du rôle, description)
    - **utilisateurs.html** : Lister les différents utilisateurs dans un tableau (ajoutez-y 3 utilisateurs)
    - **roles-ajouter.html** : Formulaire pour créer un rôle
    - **utilisateurs-ajouter.html** : Formulaire pour créer un utilisateur
    - **profil.html** : Afficher les détails d'un utilisateur (soyez créatif !)


