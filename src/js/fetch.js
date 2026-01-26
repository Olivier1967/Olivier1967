
/**
 * charger les donnée du fichier plus ceux en localstorage 
 */
export class JsonData 
{
    static async getRoles() {
        let rep = await fetch('./data/role.json');
        let roles = await rep.json();

        let savedRoles = JsonSave.getSavedRoles();

        if(savedRoles !== null) {
            for(let unRole of savedRoles) {
                roles.push(unRole);
            }
        }

        return roles;
    }

     static async getUtilisateurs() {
        let rep = await fetch('./data/utilisateurs.json');
        let utilisateurs = await rep.json();

        let savedUtilisateurs = JsonSave.getSavedUtilisateurs();

        if(savedUtilisateurs !== null) {
            for(let unUtilisateur of savedUtilisateurs) {
                utilisateurs.push(unUtilisateur);
            }
        }

        return utilisateurs;
    }
}

export class JsonSave 
{

    static getSavedRoles() {
        let roles = localStorage.getItem('roles');

        if(roles === null) {
            return [];
        }

        roles = JSON.parse(roles);
        
        return roles;
    }

    static saveRole(_role) {

        let roles = this.getSavedRoles();

        roles.push(_role);

        localStorage.setItem('roles', JSON.stringify(roles));
    }

    static getSavedUtilisateurs(){
        let utilisateurs = localStorage.getItem('utilisateurs');

        if(utilisateurs === null) {
            return [];
        }

        utilisateurs = JSON.parse(utilisateurs);
        
        return utilisateurs;
    }

    static saveUtilisateurs(_utilisateur) {

        let utilisateurs = this.getSavedUtilisateurs();

        utilisateurs.push(_utilisateur);

        localStorage.setItem('utilisateurs', JSON.stringify(utilisateurs));
    }
}
