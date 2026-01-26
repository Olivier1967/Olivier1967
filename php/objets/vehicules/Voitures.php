<?php
require_once ('Moteur.php');

/**
 * @author OBanor
 * @version 1.0
 * @created 19-nov.-2025 10:27:21
 */
class Voitures
{// attributs
	protected string $marque;
	protected string $modele;
	protected int $poids;
	protected Moteur $sonMoteur;
// propriétés
function getpoids()
	{
		return $this->poids;
	}

	function getmodele()
	{
		return $this->modele;
	}
function getleMoteur()
	{
		return $this->sonMoteur;
	}

	public function getmarque()
	{
		return $this->marque;
	}

//modifieurs

	/**
	 * 
	 * @param newVal
	 */
	function setpoids(int $newVal)
	{
		$this->poids = $newVal;
	}

	
	/**
	 * 
	 * @param newVal
	 */
	function setleMoteur( Moteur $newVal)
	{
		$this->sonMoteur = $newVal;
	}
	/**
	 * 
	 * @param _marqueMoteur
	 * @param _poids
	 * @param _modele
	 * @param _marque
	 * @param _vitesseMax
	 */
	public function __construct(string $_marqueMoteur, float $_vitesseMax, string $_marque, string $_modele, int $_poids = 1000)
	{
		$this->marque=$_marque;
		$this->modele=$_modele;
		$this->poids=$_poids;
		$this->sonMoteur= new Moteur($_vitesseMax, $_marqueMoteur);
	}

	/**
	 * Voiture.vitesseMax = Moteur.vitesseMax - (Voiture.poids x 30%).
	 */
	function vitesseMax(): float
	{
		$vitesse = $this->sonMoteur->getvitessemax() - ($this->poids * 0.3);
		return $vitesse;
	}

	function __toString(): string
	{
		return "Voiture de marque: ".$this->marque.", modèle: ".$this->modele."" .$this->sonMoteur->__toString().", poids global: ".$this->poids.", vitesse max: ".$this->vitesseMax().", km/h".PHP_EOL; 
	}

	/* marque ".$this->sonMoteur->getmarque()." de vitesse max : ".$this->sonMoteur->getvitessemax()*/
}
