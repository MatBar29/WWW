<?php
$nr_indeksu = '164340';
$nrGrupy = '1';

echo 'Mateusz Barski' . $nr_indeksu . 'grupa' . $nrGrupy . '<br/><br/>';
echo 'Zastosowanie metody include()<br/>';
echo 'Z2 a)<br/>'
?>

<?php
include 'vars.php';
require_once 'vars.php';

echo "$color $fruit<br/>";
echo 'Z2 b)<br/>'
?>

<?php
echo 'if, elseif, else:<br/>';
$a = 5;
$b = 6;
if ($a > $b)
    echo "$a jest większe od $b<br/>";
elseif ($a < $b)
    echo "$a jest mniejsze od $b<br/>";
else
    echo "$a jest równe $b<br/>";

echo 'switch:<br/>';

$e = 1;
switch ($e) {
    case 0:
        echo "e equals 0<br/>";
        break;
    case 1:
        echo "e equals 1<br/>";
        break;
    case 2:
        echo "e equals 2<br/>";
        break;
}
?>
<?php
echo 'while:<br/>';
$i = 1;
while ($i <= 10):
    echo $i . ',';
    $i++;
endwhile;
echo '<br/>';
echo 'for:<br/>';
for ($i = 1; $i <= 10; $i++) {
    echo $i . ',';
}
echo '<br/>';
?>
<?php
echo '_GET:<br/>';
if (isset($_GET['name'])) {
    echo $_GET['name'];
}
echo '<br/>';



echo '_SESSION:<br/>';
session_start();
$_SESSION['name'] = 'John';
echo $_SESSION['name'];
echo '<br/>';

echo '_POST:<br/>';
if (isset($_POST['name'])) {
    echo $_POST['name'];
}
echo '<br/>';
?>


<form action="#" method="get">
    Name: <input type="text" name="name" /><br>
    <input type="submit" value="Submit" name="sub">
</form>
