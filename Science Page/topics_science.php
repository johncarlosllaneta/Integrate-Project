<?php
include "../php/config.php";

$con = connection();

session_start();

$id = $_SESSION['id'];

$sql = "SELECT * from progress WHERE user_id = '$id' AND subject = 'SCIENCE'";
$progress = $con->query($sql) or die ($con->error);
$row = $progress->fetch_assoc();
$total = $row["total"];
$done = $row["done"];

$percentage = ($done / $total) * 100;

$topics = ["Human Body Parts", "Living Things", "Plants", "Animals", "Non Living"];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topics</title>
    <link rel="stylesheet" href="../css/topics_science.css">
    <link rel="shortcut icon" href="../images/logo.png" type="image/png">
 
</head>
<body>
    <div class= "container">
    <a href="../html/subject_topic.html">
        <button class= "btn_back">BACK</button>
    </a>
  
    <div class = "topics">
        <img src="../images/Science.svg" alt="" class= "lesson">
       
        <?php for($i = 1; $i <= $total; $i++) { ?>
            <!-- UNLOCKED -->
            <?php if($i <= ($done + 1)) { ?>
                <div id= "pics1" value="<?=$i?>" onclick="showID(<?=$i?>)" >
                        <img src="../images/<?=$topics[$i-1]?>.svg" alt="" class = "pics">
                    </div>
            <!-- LOCKED -->
            <?php } else { ?>
                 <!-- LEFT  -->
                 <?php if($i%2==0) { ?>
                    <div id= "pics1" value="<?=$i?>" >
                        <img src="../images/Lock_Lesson/Lock_Science_Left.svg" alt="" class = "pics">
                    </div>
                <!-- RIGHT -->
                <?php } else { ?>
                <div id= "pics1" value="<?=$i?>" >
                        <img src="../images/Lock_Lesson/Lock_Science_Right.svg" alt="" class = "pics">
                 </div>
        <?php  } } }?>

    </div>
    </div>
    
</body>
<script
    type="text/javascript"
    src="../Science Page/jsp_Science/topics-science.js"
  ></script>
</html>