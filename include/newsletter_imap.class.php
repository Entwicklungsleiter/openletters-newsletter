<?php

/**
 * Diese Datei enthaelt die Klasse <i>NewsletterImap</i>.
 * @author Stefan Rank-Kunitz at Open-Letters
 * @since 2017
 * @package Newslettersystem
 * @subpackage System
 */
/** Elternklasse laden */
require_once( ROOT_PATH . "framework/parentclass.class.php");

/**
 * Ein Objekt dieser Klasse erlaubt den Zugirff auf ein IMAP-Konto
 * @author Stefan Rank-Kunitz at Open-Letters
 * @package Newslettersystem
 * @subpackage System
 */
class NewsletterImap extends Parentclass {

    private static $connection = false;

    public function __construct() {
        parent::__construct();
        
        if (!self::PhpImapExtensionIsLoaded()) {
            throw new Exception('Error using IMAP! Please install PHP IMAP extension!');
        }
    }
    
    public static function PhpImapExtensionIsLoaded() {
        return extension_loaded('imap');
    }

    private function getConnection() {
        if (self::$connection !== FALSE) {
            return self::$connection;
        }

        if (!function_exists('imap_open')) {
            throw new Exception('Error using IMAP! Please install PHP IMAP module.');
        }

        $conn = imap_open(IMAP_MBOX, IMAP_USER, IMAP_PASS);
        if ($conn === FALSE) {
            throw new Exception('Error connecting to IMAP: ' . imap_last_error());
        }
        
        if (imap_check($conn)===FALSE){
            throw new Exception('Error checking IMAP connection: ' . imap_last_error());
        }

        self::$connection = $conn;
        return self::$connection;
    }

    public function saveMailToFolder($mail, $imapFolder) {

        try {
            $conn = $this->getConnection();
        } catch (Exception $ex) {
            $this->logmessage($ex->getMessage());
        }

        $result = imap_append($conn, IMAP_MBOX . $imapFolder, $mail->GetSentMIMEMessage());
        if ($result===false) {
            throw new Exception('Error connecting to IMAP (result='.print_r($result,true).'): ' . imap_last_error());
        }

        return true;
    }
    
    public function folderExists($folder_name) {
        
        try{
            $conn = $this->getConnection();
        } catch (Exception $ex) {
            $this->logmessage($ex->getMessage());
        }
        
        $folders = imap_list($conn, IMAP_MBOX, '*');
        $result = false;
        if (array_search(IMAP_MBOX.$folder_name, $folders)!==false) {
            return true;
        }
        
        return $result;
    }

    public function __destruct() {
        if (self::$connection !== FALSE) {
            imap_close(self::$connection);
        }
    }

}
