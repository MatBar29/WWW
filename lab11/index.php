<?
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
?>
<?php
// Podłączenie plików konfiguracyjnego i funkcji wyświetlania strony
include('cfg.php');
include('showpage.php');

?>
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Language" content="pl" />
    <meta name="Author" content="Mateusz Barski" />
    <title>Historia lotow kosmicznych</title>
    <script src="js/kolorujtlo.js" type="text/javascript"></script>
    <script src="js/timedate.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css" />

    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 0;
            margin: 20px;
            text-align:center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: white;
        }

        td {
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        h2 {
            color: #555;
        }

        .menu {
            background-color: #333;
            overflow: hidden;
        }

        .menu a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .menu a:hover {
            background-color: #555;
        }


        img {
            float: left;
            margin: 5px;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .square {
            width: 400px;
            margin-bottom: 20px;
        }

        .square img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        clock-container {
            position: initial;
            top: 10px;
            left: 10px;
            color: #333;
        }
        .contact {
            text-align: center;
        }
        .film-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .film {
            width: 560px;
            height: 315px;
            position: relative;
            overflow: hidden;
            border-radius: 8px;
        }

        .film iframe {
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 8px;
        }

        .film-description {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 0 0 8px 8px;
            text-align: left;
        }

    </style>
</head>
<body onload="startclock()">
<div class="menu">
    <a href="index.php?idp=glowna">Strona główna</a>
    <a href="index.php?idp=historia">Historia lotów kosmicznych</a>
    <a href="index.php?idp=misje">Misje kosmiczne</a>
    <a href="index.php?idp=galeria">Galeria</a>
    <a href="index.php?idp=kontakt">Kontakt</a>
    <a href="index.php?idp=filmy">Filmy</a>
</div>
<FORM METHOD="POST" NAME="background">
    <INPUT TYPE="button" VALUE="żółty" ONCLICK="changeBackground('#FFF000')">
    <INPUT TYPE="button" VALUE="czarny" ONCLICK="changeBackground('#000000')">
    <INPUT TYPE="button" VALUE="biały" ONCLICK="changeBackground('#FFFFFF')">
    <INPUT TYPE="button" VALUE="zielony" ONCLICK="changeBackground('#00FF00')">
    <INPUT TYPE="button" VALUE="niebieski" ONCLICK="changeBackground('#0000FF')">
    <INPUT TYPE="button" VALUE="poarańczowy" ONCLICK="changeBackground('#FF8000')">
    <INPUT TYPE="button" VALUE="szary" ONCLICK="changeBackground('#c0c0c0')">
    <INPUT TYPE="button" VALUE="czerwony" ONCLICK="changeBackground('#FF0000')">
</FORM>

<div id="clock-container">
    <div id="zegarek"></div>
    <div id="data"></div>
</div>

//<?php
//error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
//if (empty($_GET['idp'])) {
//    $strona = 'html/glowna.html';
//} elseif ($_GET['idp'] == 'historia') {
//    $strona = 'html/historia.html';
//} elseif ($_GET['idp'] == 'misje') {
//    $strona = 'html/misje.html';
//} elseif ($_GET['idp'] == 'galeria'){
//    $strona = 'html/galeria.html';
//} elseif ($_GET['idp'] == 'kontakt'){
//    $strona = 'html/kontakt.html';
//} elseif ($_GET['idp'] == 'filmy') {
//    $strona = 'html/filmy.html';
//} else {
//    // Handle cases where 'idp' is not recognized (e.g., show a default page)
//    $strona = 'html/glowna.html';
//}
//
//include($strona);
//?>
<?php
    error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
    $pageID = $_GET['idp'];
    $link = db_connect();

    if ($pageID == 'glowna'){
        echo PokazPodstrone(3, $link);
    }elseif ($pageID == 'historia'){
        echo PokazPodstrone(4, $link);
    }elseif ($pageID == 'misje'){
        echo PokazPodstrone(6, $link);
    }elseif ($pageID == 'galeria'){
        echo PokazPodstrone(2, $link);
    }elseif ($pageID == 'kontakt'){
        echo PokazPodstrone(5, $link);
    }elseif ($pageID == 'filmy'){
        echo PokazPodstrone(7, $link);
    }
?>

</body>
<body>
<?php
$nr_indeksu = '164340';
$nrGrupy = '1ISI';
echo 'Autor: Mateusz Barski ' . $nr_indeksu . ' grupa ' . $nrGrupy . ' <br /><br />';
?>
</body>
</html>