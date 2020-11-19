<?php
include "../../php/config.php";

$con = connection();

session_start();

$id = $_SESSION['id'];

$sql = "SELECT * from progress WHERE user_id = '$id' AND subject = 'MATH'";
$progress = $con->query($sql) or die ($con->error);
$row = $progress->fetch_assoc();
$total = $row["total"];
$done = $row["done"];

$percentage = ($done / $total) * 100;

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Progress Math</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="../../css/progress_math.css">
</head>

<body>

    <h1>Progress: <?= $done ?> / <?= $total ?> </h1>
    <h3>Percentage: <?= $percentage ?> % </h3>

    <div class="container">
    <a href="../../html/subject_progress.html">
            <button class="btn_back">BACK</button>
        </a>

    <?php for($i = 1; $i <= $total; $i++) { ?>

    <!-- done -->
    <?php if($i <= ($done)) { ?>
        <div class="circle<?=$i?>" onclick="showID(<?=$i?>)">
            <img src="../../images/math_passed.svg" alt="" class="circle" id="circle">
        </div>

    <!-- current -->
    <?php } else if($i == ($done + 1)) { ?>

        <div class="circle<?=$i?>" onclick="showID(<?=$i?>)">
            <!-- make assets for math circ  -->
            <img src="../../images/circ<?=$i?>.svg" alt="" class="circle" id="circle">
        </div>

    <!-- locked -->
    <?php }  else { ?>
        <div class="circle<?=$i?>" onclick="" >
            <img src="../../images/math_lock.svg" alt="" class="circle" id="circle">
        </div>
    <?php } ?>


    <?php } ?>

    </div>



</body>

</html>
    <script src="../../jsp_Math/progress.js"></script>
</body>

</html>