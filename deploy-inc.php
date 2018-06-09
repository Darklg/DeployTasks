<?php

/* ----------------------------------------------------------
  Define main vars
---------------------------------------------------------- */

if (!defined('DT_TOKEN')) {
    echo 'Error : Token is not defined.';
    return;
}

if (!defined('DT_FILE')) {
    echo 'Error : Deploy file is not defined.';
    return;
}

/* ----------------------------------------------------------
  Check params
---------------------------------------------------------- */

/* Token
-------------------------- */

if (!isset($_GET['token']) || $_GET['token'] != DT_TOKEN) {
    echo 'Error : Invalid token.';
    return;
}

/* File
-------------------------- */

if (!file_exists(DT_FILE)) {
    echo 'Error : Invalid file.';
    return;
}

/* ----------------------------------------------------------
  Deploy
---------------------------------------------------------- */

/* Execute deploy
-------------------------- */

$exec_deploy = exec('/bin/bash ' . DT_FILE . ' 2>&1', $out);

/* Display result
-------------------------- */

echo '<pre>' . implode("\n", $out) . '</pre>';

/* Mail result
-------------------------- */

if (defined('DT_EMAIL')) {
    $mail_subject = '[' . $_SERVER['HTTP_HOST'] . '] Deploy';
    mail(DT_EMAIL, $mail_subject, implode("\n", $out));
}
