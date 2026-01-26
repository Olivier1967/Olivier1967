<?php
require_once ('Voitures.php');

/**
 * @author OBanor
 * @version 1.0
 * @created 19-nov.-2025 10:27:21
 */
class VoitureCourse extends Voitures
{

	/**
	 * 
	 * @param _marque
	 * @param _modele
	 * @param _poids
	 * @param _marqueMoteur
	 * @param _vitesseMax
	 */
	public function __construct(string $_marqueMoteur, float $_vitesseMax, string $_marque, string $_modele, int $_poids = 1000)
	{
		$this->marque = $_marque;
		$this->modele = $_modele;
		$this->poids = $_poids;

		if ($_marqueMoteur === $_marque){
			parent::__construct($_marqueMoteur, $_vitesseMax, $_marque, $_modele, $_poids); 
		}else{
			throw new Exception("ne peut pas faire une voiture de course car moteur différent de la marque ");
		}

	}

	/**
	 * Voiture.vitesseMax = Moteur.vitesseMax - (Voiture.poids x 30%).
	 */
	function vitesseMax(): float
	{
		$vitesse = $this->sonMoteur->getvitessemax() - ($this->poids * 0.05);
		return $vitesse;
	}

	function __toString(): string
	{
		return parent::__toString();
	}

	// "Voiture de sport ".$this->marque.", modèle ".$this->modele."" .$this->sonMoteur->__toString().", poids global ".$this->poids.", vitesse ".$this->vitesseMax().", km/h".PHP_EOL; 
}
