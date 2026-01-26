<?php
class Dbconnexion
{
    private static ?PDO $connexion = null;
    private static $host;
    private static $base;
    private static $user;
    private static $pass;
    private static $port;

    private function __construct()
    {
        
    }

    private static function setConfig()
    {
        $config = require_once __DIR__.'/Config.php';

        self::$host = $config['host'];
        self::$base = $config['base'];
        self::$user = $config['user'];
        self::$pass = $config['pass'];
        self::$port = $config['port']??3306;

    }

    public static function getInstance():PDO
    {
        if(self::$connexion == null){
            self::setConfig();
            try{
                self::$connexion = new PDO("mysql:host=".self::$host.";dbname=".self::$base.";port=".self::$port.";charset=utf8", self::$user, self::$pass,
                [PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]);
            } catch (Exception $e) {
                die("database connexion échouée: " . $e->getMessage());
            }

        }
        return self::$connexion;
    }


}