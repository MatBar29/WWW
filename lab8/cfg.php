<?php
//Zdefiniuj parametry połączenia z bazą danych
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$baza = 'moja_strona';
$login = "admin1";
$pass = "haslo123";

function db_connect(){
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '';
    $baza = 'moja_strona';
    {
        $link = new mysqli($dbhost, $dbuser, $dbpass, $baza);

        if ($link->connect_error) {
            die("Zerwane połaczenie: " . $link->connect_error);
        }
        return $link;
    }
}

//Utwórz połączenie z bazą danych
$conn = new mysqli($dbhost, $dbuser, $dbpass, $baza);

//Sprawdź, czy połączenie zostało pomyślnie ustanowione
if ($conn->connect_error) {
    //Obsłuż błąd połączenia
    die("Connection failed: " . $conn->connect_error);
}
?>
