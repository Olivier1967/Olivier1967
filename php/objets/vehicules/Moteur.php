<?php


/**
 * @author OBanor
 * @version 1.0
 * @created 19-nov.-2025 10:27:21
 */
class Moteur
{

	private string $marque;
	private float $vitesseMax;



	function getmarque()
	{
		return $this->marque;
	}

	/**
	 * 
	 * @param newVal
	 */
	function setmarque( string $newVal)
	{
		$this->marque = $newVal;
	}

function getvitessemax()
	{
		return $this->vitesseMax;
	}

	/**
	 * 
	 * @param newVal
	 */
	function setvitessemax(float $newVal)
	{
		$this->vitesseMax = $newVal;
	}

	function __construct( float $_vitesseMax, string $_marque)
	{
		$this->marque=$_marque;
		$this->vitesseMax=$_vitesseMax;
	}
/**
	 * 
	 * @param _vitesseMax
	 * @param _marque
	 */


	function __toString():string
	{
		return ", nom du moteur: ".$this->marque.", vitesse moteur: ".$this->vitesseMax;
	}

	
}
