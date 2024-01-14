<?php
session_start();

include('cfg.php');

$conn = new mysqli('localhost', 'root', '', 'moja_strona');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function dodajDoKoszyka($id, $ilosc, $baza)
{
    if (!isset($_SESSION['koszyk'])) {
        $_SESSION['koszyk'] = array();
    }

    $produktID = "produkt_" . $id;
    if (array_key_exists($produktID, $_SESSION['koszyk'])) {
        $query = "SELECT ilosc_sztuk FROM produkt WHERE id = $id";
        $result = mysqli_query($baza, $query);
        $produkt = mysqli_fetch_assoc($result);

        if ($produkt['ilosc_sztuk'] >= $ilosc) {
            $_SESSION['koszyk'][$produktID]['ilosc'] += $ilosc;
            $newQuantity = $_SESSION['koszyk'][$produktID]['ilosc'];
            $updateQuery = "UPDATE produkt SET ilosc_sztuk = ilosc_sztuk - $ilosc WHERE id = $id";
            mysqli_query($baza, $updateQuery);
        } else {
            echo "Brak dostępności wystarczającej ilości produktu w magazynie. Ilość sztuk w magazynie: {$produkt['ilosc_sztuk']}";
        }
    } else {
        $query = "SELECT * FROM produkt WHERE id = $id";
        $result = mysqli_query($baza, $query);
        $produkt = mysqli_fetch_assoc($result);

        if ($produkt['ilosc_sztuk'] >= $ilosc) {

            $_SESSION['koszyk'][$produktID] = array(
                'id' => $produkt['id'],
                'tytul' => $produkt['tytul'],
                'ilosc' => $ilosc,
                'cena_brutto' => $produkt['cena_netto'] * (1 + $produkt['podatek_vat']),
                'zdjecie' => $produkt['zdjecie'], // Uwzględnij URL zdjęcia
            );

            $newQuantity = $_SESSION['koszyk'][$produktID]['ilosc'];
            $updateQuery = "UPDATE produkt SET ilosc_sztuk = ilosc_sztuk - $ilosc WHERE id = $id";
            mysqli_query($baza, $updateQuery);
        } else {
            echo "Brak dostępności wystarczającej ilości produktu w magazynie. Ilość sztuk w magazynie: {$produkt['ilosc_sztuk']}";
        }
    }
}

function usunZKoszyka($id, $ilosc, $baza)
{
    $produktID = "produkt_" . $id;
    if (array_key_exists($produktID, $_SESSION['koszyk'])) {
        $_SESSION['koszyk'][$produktID]['ilosc'] -= $ilosc;

        if ($_SESSION['koszyk'][$produktID]['ilosc'] <= 0) {
            unset($_SESSION['koszyk'][$produktID]);
        }

        $newQuantity = $ilosc;
        $updateQuery = "UPDATE produkt SET ilosc_sztuk = ilosc_sztuk + $newQuantity WHERE id = $id";
        mysqli_query($baza, $updateQuery);
    }
}

function zliczWartoscKoszyka()
{
    $wartosc = 0;
    if (isset($_SESSION['koszyk']) && !empty($_SESSION['koszyk'])) {
        foreach ($_SESSION['koszyk'] as $produkt) {
            $wartosc += $produkt['cena_brutto'] * $produkt['ilosc'];
        }
    }
    return $wartosc;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['dodaj_do_koszyka'])) {
        $produktID = $_POST['produkt_id'];
        $ilosc = $_POST['ilosc'];
        $baza = db_connect();

        // Sprawdź dostępność również po stronie serwera
        $query = "SELECT ilosc_sztuk FROM produkt WHERE id = $produktID";
        $result = mysqli_query($baza, $query);
        $produkt = mysqli_fetch_assoc($result);

        if ($produkt['ilosc_sztuk'] >= $ilosc) {
            dodajDoKoszyka($produktID, $ilosc, $baza);
        } else {
            echo "Brak dostępności wystarczającej ilości produktu w magazynie. Ilość sztuk w magazynie: {$produkt['ilosc_sztuk']}";
        }
    } elseif (isset($_POST['usun_z_koszyka'])) {
        $produktID = $_POST['produkt_id'];
        $ilosc = $_POST['ilosc'];
        $baza = db_connect();
        usunZKoszyka($produktID, $ilosc, $baza);
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sklep internetowy</title>
</head>
<body>

<?php
echo "<h2>Produkty</h2>";

$query_produkty = "SELECT * FROM produkt";
$result_produkty = mysqli_query($conn, $query_produkty);

if (mysqli_num_rows($result_produkty) > 0) {
    echo "<div style='display: flex; flex-wrap: wrap;'>";
    while ($produkt = mysqli_fetch_assoc($result_produkty)) {
        echo "<div style='border: 1px solid #ddd; margin: 10px; padding: 10px; text-align: center;'>";
        echo "<img src='{$produkt['zdjecie']}' alt='{$produkt['tytul']}' style='max-width: 100px; max-height: 100px;'>";
        echo "<p>{$produkt['tytul']}</p>";
        echo "<p>Cena netto: {$produkt['cena_netto']} PLN</p>";
        // Oblicz cenę brutto na podstawie ceny netto i stawki VAT
        $cenaBrutto = $produkt['cena_netto'] * (1 + $produkt['podatek_vat']);
        echo "<p>Cena: {$cenaBrutto} PLN</p>";

        echo "<p>Ilość: {$produkt['ilosc_sztuk']}</p>";
        echo "<form method='post'>";
        echo "<input type='hidden' name='produkt_id' value='{$produkt['id']}'>";
        echo "<label for='ilosc'>Ilość:</label>";
        echo "<input type='number' name='ilosc' value='1' min='1' max='{$produkt['ilosc_sztuk']}'>";
        echo "<input type='submit' name='dodaj_do_koszyka' value='Dodaj do koszyka'>";
        echo "</form>";
        echo "</div>";
    }
    echo "</div>";
} else {
    echo "<p>Brak produktów do wyświetlenia</p>";
}

echo "<h2>Koszyk</h2>";

echo "<div style='border: 1px solid #ddd; padding: 10px;'>";
if (isset($_SESSION['koszyk']) && !empty($_SESSION['koszyk'])) {
    foreach ($_SESSION['koszyk'] as $produktID => $produkt) {
        echo "<div style='display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ddd; padding: 5px;'>";
        echo "<div>";


        if (!empty($produkt['zdjecie'])) {
            echo "<img src='{$produkt['zdjecie']}' alt='{$produkt['tytul']}' style='max-width: 100px; max-height: 100px;'>";
        } else {
            echo "<p>Zdjęcie niedostępne</p>";
        }

        echo "</div>";
        echo "<div>";
        echo "{$produkt['tytul']} (ilość: {$produkt['ilosc']})";
        echo "</div>";
        echo "<div>";
        echo "{$produkt['cena_brutto']} PLN";
        echo "</div>";
        echo "<div>";
        echo "<form method='post'>";
        echo "<input type='hidden' name='produkt_id' value='{$produkt['id']}'>";
        echo "<label for='ilosc'>Ilość:</label>";
        echo "<input type='number' name='ilosc' value='{$produkt['ilosc']}' min='1' max='{$produkt['ilosc']}'>";
        echo "<input type='submit' name='usun_z_koszyka' value='Usuń z koszyka'>";
        echo "</form>";
        echo "</div>";
        echo "</div>";
    }
    echo "<p style='text-align: right; margin-top: 10px;'>Wartość koszyka: " . zliczWartoscKoszyka() . " PLN</p>";
} else {
    echo "<p>Koszyk jest pusty</p>";
}
echo "</div>";
?>

</body>
</html>
