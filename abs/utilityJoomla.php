#!/usr/bin/php
<?php

if (count($argv) != 3) {
    die ("Syntax error\nphp ".$argv[0]." path_location dominio\n");
}
$location = $argv[1];
$dominio = $argv[2];
$configurazione = $location."/configuration.php";
file_exists($configurazione) or die ("ERRORE: dominio o configuration.php non esistenti\n");

include($configurazione);

$jc = new JConfig();

$filename ="config/".$dominio.".cfg";

$arr = array("General" => array(
        "domain" => $dominio,
        "zip_password" => "cambiami",
        "site_location" => $location,
        "n_max_files_site" => 2,
        "n_max_files_db" => 10,
        "email_report" => "",
        "success_send_email" => 0,
        "db_username" => $jc->user,
        "db_password" => $jc->password,
        "db_name" => $jc->db
    )
);

writePhpIni($arr, $filename);
chmod($filename, 0400);

function writePhpIni($array, $file) {
    $res = array();
    foreach($array as $key => $val) {
        if(is_array($val)) {
            $res[] = "[$key]";
            foreach($val as $skey => $sval) $res[] = "$skey=".$sval;
        }
        else $res[] = "$key=".$val;
    }
    safefilerewrite($file, implode("\r\n", $res));
}
function safefilerewrite($fileName, $dataToSave) {
    if ($fp = fopen($fileName, 'w')) {
        $startTime = microtime(TRUE);
        do {
            $canWrite = flock($fp, LOCK_EX);
            // If lock not obtained sleep for 0 - 100 milliseconds, to avoid collision and CPU load
            if(!$canWrite) usleep(round(rand(0, 100)*1000));
        } while ((!$canWrite)and((microtime(TRUE)-$startTime) < 5));

        //file was locked so now we can store information
        if ($canWrite) {
            fwrite($fp, $dataToSave);
            flock($fp, LOCK_UN);
        }
        fclose($fp);
    }
}
?>

