<?php

function PokazPodstrone($id, $mysqli)
{
    $id_clear = htmlspecialchars($id);

    $query = "SELECT * FROM page_list WHERE id='$id_clear' LIMIT 1";
    $result = mysqli_query($mysqli, $query);

    if (!$result) {
        die("Error: " . mysqli_error($mysqli));
    }

    $row = mysqli_fetch_array($result);

    if (empty($row['id'])) {
        $web = '[nie_znaleziono_strony]';
    } else {
        $web = $row['page_content'];
    }

    return $web;
}

?>
