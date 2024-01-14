<?php
global $pass;
session_start();

include("../cfg.php");
// Zdefiniuj parametry połączenia z bazą danych


// Utwórz połączenie z bazą danych
$conn = new mysqli('localhost', 'root', '', 'moja_strona');
// Sprawdź, czy połączenie zostało pomyślnie ustanowione
if ($conn->connect_error) {
    // Obsłuż błąd połączenia
    die("Connection failed: " . $conn->connect_error);
}

// Klasa dla Panelu Administratora
class AdminPanel
{
    private $conn;  // Dodaj właściwość do przechowywania obiektu połączenia
    public function __construct($conn,$pass)
    {
        $this->conn = $conn;
        $this->pass = $pass;
    }


    // Funkcja do wyświetlania formularza logowania
    public function FormularzLogowania()
    {
        $wynik = '
        <div class="logowanie">
         <h1 class="heading">Zaloguj:</h1>
          <div class="logowanie">
           <form method="post" name="LoginForm" enctype="multipart/form-data" action="' . $_SERVER['REQUEST_URI'] . '">
            <table class="logowanie">
              <tr><td class="log4_t">[email]</td><td><input type="text" name="login_email" class="logowanie" /></td></tr>
              <tr><td class="log4_t">[haslo]</td><td><input type="password" name="login_pass" class="logowanie" /></td></tr>
              <tr><td>&nbsp;</td><td><input type="submit" name="x1_submit" class="logowanie" value="zaloguj" /></td></tr>
            </table>
           </form>
          </div>
        </div>
        ';
        return $wynik;
    }

    public function SprawdzLogowanie($login, $pass)
    {
        // Sprawdź, czy dane logowania są poprawne
        if ($login === "admin1" && $pass === "haslo123") {
            // Ustaw sesję
            $_SESSION['logged_in'] = true;
        }
    }

    public function PokazListePodstron()
    {
        $query = "SELECT * FROM page_list";
        $result = mysqli_query($this->conn, $query);

        echo '<h2>Lista Podstron</h2>';
        while ($row = mysqli_fetch_assoc($result)) {
            echo "ID: {$row['id']}, Tytuł: {$row['page_title']}, Status: {$row['status']}<br>";
            echo '<a href="' . $_SERVER['REQUEST_URI'] . '?action=edit_page&id=' . $row['id'] . '">Edytuj</a> | ';
            echo '<form method="post" action="' . $_SERVER['REQUEST_URI'] . '">';
            echo '<input type="hidden" name="page_id" value="' . $row['id'] . '">';
            echo '<input type="submit" name="usun_podstrone" value="Usuń">';
            echo '</form><br>';
        }
    }

    public function DodajPodstrone($pageTitle, $pageContent, $status)
    {
        $query = "INSERT INTO page_list (page_title, page_content, status) VALUES ('$pageTitle', '$pageContent', $status)";
        $result = mysqli_query($this->conn, $query);

        if ($result) {
            header("Location: admin.php");
            exit();
        } else {
            echo '<p>Błąd podczas dodawania podstrony: ' . mysqli_error($this->conn) . '</p>';
        }
    }

    public function FormularzDodawaniaPodstrony()
    {
        $form = '
        <h2>Dodaj Podstronę</h2>
        <form method="post" action="' . $_SERVER['REQUEST_URI'] . '">
            <label for="page_title">Tytuł:</label>
            <input type="text" name="page_title"><br>

            <label for="page_content">Treść:</label>
            <textarea name="page_content"></textarea><br>

            <label for="status">Status:</label>
            <input type="text" name="status"><br>

            <input type="submit" name="dodaj_podstrone" value="Dodaj podstronę">
        </form>
    ';

        return $form;
    }

    public function FormularzEdycjiPodstrony($pageId)
    {
        $query = "SELECT * FROM page_list WHERE id = $pageId";
        $result = mysqli_query($this->conn, $query);
        $row = mysqli_fetch_assoc($result);

        $form = '
        <h2>Edytuj Podstronę</h2>
        <form method="post" action="' . $_SERVER['REQUEST_URI'] . '">
            <input type="hidden" name="page_id" value="' . $pageId . '">
            <label for="page_title">Tytuł:</label>
            <input type="text" name="page_title" value="' . $row['page_title'] . '"><br>

            <label for="page_content">Treść:</label>
            <textarea name="page_content">' . $row['page_content'] . '</textarea><br>

            <label for="status">Status:</label>
            <input type="text" name="status" value="' . $row['status'] . '"><br>

            <input type="submit" name="edytuj_podstrone" value="Zapisz zmiany">
        </form>
        ';

        return $form;
    }

    public function EdytujPodstrone($pageId, $pageTitle, $pageContent, $status)
    {
        $query = "UPDATE page_list
              SET page_title = '$pageTitle', page_content = '$pageContent', status = $status
              WHERE id = $pageId";

        mysqli_query($this->conn, $query);

    }

    public function UsunPodstrone($pageId)
    {
        $query = "DELETE FROM page_list WHERE id = $pageId";
        $result = mysqli_query($this->conn, $query);
        if ($result) {
            header("Location: admin.php");
            exit();
        } else {
            echo '<p>Błąd podczas dodawania podstrony: ' . mysqli_error($this->conn) . '</p>';
        }
    }

    public function WyslijMailKontakt($odbiorca)
    {
            if (empty($_POST['temat']) || empty($_POST['tresc']) || empty($_POST['email'])) {
                echo '[nie wypełniłeś pola]';
                echo $this->PokazKontakt();
            } else {
                $mail['subject'] = $_POST['temat'];
                $mail['body'] = $_POST['tresc'];
                $mail['sender'] = $_POST['email'];
                $mail['recipient'] = $odbiorca;

                $header = "From: Formularz kontaktowy <" . $mail['sender'] . ">\n";
                $header .= "MIME-Version: 1.0\nContent-Type: text/plain; charset=utf-8\nContent-Transfer-Encoding:";
                $header .= "X-Sender: <" . $mail['sender'] . "\n";
                $header .= "X-Mailer: PRapWWW mail 1.2\n";
                $header .= "X-Priority: 3\n";
                $header .= "Return-Path: <" . $mail['sender'] . ">\n";

                mail($mail['recipient'], $mail['subject'], $mail['body'], $header);

                echo '[wiadomość wysłana]';
            }
    }
    public function PokazPrzypomnienieHasla()
    {
        $form = '
        <h2>Przypomnij Hasło</h2>
        <form method="post" action="' . $_SERVER['REQUEST_URI'] . '">
            <label for="email">Email:</label>
            <input type="email" name="email"><br>

            <input type="submit" name="przypomnij_haslo" value="Przypomnij hasło">
        </form>
        ';

        return $form;
    }

    public function PrzypomnijHaslo()
    {
        if (isset($_POST['przypomnij_haslo'])) {
            if (empty($_POST['email'])) {
                echo '[nie wypełniłeś pola]';
                echo $this->PokazPrzypomnienieHasla();
            } else {
                $mail['subject'] = 'Przypomnienie hasła';
                $mail['body'] = 'Twoje hasło: ' . $this->pass;
                $mail['sender'] = '164340@student.uwm.edu.pl';
                $mail['recipient'] = $_POST['email'];

                $header = "From: Przypomnienie hasła <" . $mail['sender'] . ">\n";
                $header .= "MIME-Version: 1.0\nContent-Type: text/plain; charset=utf-8\nContent-Transfer-Encoding:";
                $header .= "X-Sender: <" . $mail['sender'] . "\n";
                $header .= "X-Mailer: PRapWWW mail 1.2\n";
                $header .= "X-Priority: 3\n";
                $header .= "Return-Path: <" . $mail['sender'] . ">\n";

                mail($mail['recipient'], $mail['subject'], $mail['body'], $header);

                echo '[przypomnienie_wysłane]  ';
                echo $this->pass;
            }
        }
    }

    public function PokazKontakt()
    {
        $form = '
        <h2>Formularz Kontaktowy</h2>
        <form method="post" action="' . $_SERVER['REQUEST_URI'] . '">
            <label for="temat">Temat:</label>
            <input type="text" name="temat"><br>

            <label for="tresc">Treść:</label>
            <textarea name="tresc"></textarea><br>

            <label for="email">Email:</label>
            <input type="email" name="email"><br>

            <input type="submit" name="wyslij_mail_kontakt" value="Wyślij">
        </form>
        ';

        return $form;
    }

}



$adminPanel = new AdminPanel($conn, $pass);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sprawdź, czy formularz logowania został przesłany
    if (isset($_POST['login_email']) && isset($_POST['login_pass'])) {
        $login_email = $_POST['login_email'];
        $login_pass = $_POST['login_pass'];

        // Sprawdź dane logowania
        $adminPanel->SprawdzLogowanie($login_email, $login_pass);
    }
    if (isset($_POST['wyslij_mail_kontakt'])) {
        $adminPanel->WyslijMailKontakt('admin@example.com');
    }
    $adminPanel->PrzypomnijHaslo();
}

// Sprawdź, czy użytkownik jest zalogowany
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {

    echo $adminPanel->FormularzLogowania();
    echo $adminPanel->PokazKontakt();
    echo $adminPanel->PokazPrzypomnienieHasla();
}
else {

    // Wyświetl listę podstron i formularz edycji, jeśli użytkownik jest zalogowany

    // Reszta kodu obsługującego formularze dodawania, usuwania, edycji, wyświetlania kategorii, drzewa kategorii, produktów
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'edit_page' && isset($_GET['id'])) {
            $pageId = $_GET['id'];
            echo $adminPanel->FormularzEdycjiPodstrony($pageId);
        }
    }
    if (isset($_POST['dodaj_podstrone'])) {
        $pageTitle = $_POST['page_title'];
        $pageContent = $_POST['page_content'];
        $status = $_POST['status'];

        $adminPanel->DodajPodstrone($pageTitle, $pageContent, $status);
    }
    if (isset($_POST['edytuj_podstrone'])) {
        $pageId = $_POST['page_id'];
        $pageTitle = $_POST['page_title'];
        $pageContent = $_POST['page_content'];
        $status = $_POST['status'];

        $adminPanel->EdytujPodstrone($pageId, $pageTitle, $pageContent, $status);
        echo '<p>Zmiany zostały zapisane.</p>';
    }
    if (isset($_POST['usun_podstrone']) && isset($_POST['page_id'])) {
        $pageIdToDelete = $_POST['page_id'];
        $adminPanel->UsunPodstrone($pageIdToDelete);
    }
    if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
        echo $adminPanel->FormularzLogowania();
    } else {
        // Dodaj przycisk "Wyloguj"
        echo '<a href="' . $_SERVER['REQUEST_URI'] . '?action=logout">Wyloguj</a>';

        // Wyświetl listę podstron i formularz edycji, jeśli użytkownik jest zalogowany
        // ... (poprzedni kod)

        // Dodaj obsługę wylogowania
        if (isset($_GET['action']) && $_GET['action'] == 'logout') {
            // Zakończ sesję i przekieruj na stronę logowania
            session_destroy();
            header("Location: admin.php");
            exit();
        }
    }
    echo $adminPanel->PokazListePodstron();
    echo $adminPanel->FormularzDodawaniaPodstrony();
}