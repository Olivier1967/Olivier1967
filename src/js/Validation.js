/**
 * Contrôle de données
 */
export class Validation
{
    validerFormatNombre(){
        let regex= /^[\-]?[0-9]+[\.|,]?[0-9]{0,15}$/; // regex nombre entier ou décimal positif

        if(!regex.test(_nombre)){
            throw new Error('Ce n\'est pas un nombre valide')
        }
    }

    /**
    * valider un prix
    * - doit être numérique strictement positif
    * @param {Number} _prix le prix à valider
    */
    validerNombrePositif(_nombre){

        try{
            this.validerFormatNombre(_nombre);

            _nombre = parseFloat(_nombre); 

            if(_nombre < 0){ // si ce n'est pas un nombre positif !
            throw new Error('Ce n\'est pas un nombre positif !');
            }
        }catch (error){
            throw error;
        }

    }
/*
    validerNombreNegatif(){
        try{
            this.validerFormatNombre(_nombre);

            _nombre = parseFloat(_nombre); 

            if(_nombre > 0){ // si ce n'est pas un nombre p !
                throw new Error('Ce n\'est pas un nombre positif !');
            }
            }catch (error){
                throw error;
            }
    }
*/

    /**
     * 
     */
    static validerNom(){

    }
}