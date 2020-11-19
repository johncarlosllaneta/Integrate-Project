<?php
include "../../php/config.php";

$conn = connection();

session_start();

$user_id = $_SESSION['id'];;
$lesson_name = mysqli_real_escape_string($conn, $_POST['lesson_name']);
$score = mysqli_real_escape_string($conn, $_POST['score']);
$passing_score = mysqli_real_escape_string($conn, $_POST['passing_score']);
$no_of_items = mysqli_real_escape_string($conn, $_POST['no_of_items']);
$status = mysqli_real_escape_string($conn, $_POST['status']);

$sql = "INSERT INTO math_table (user_fk,Lesson_Name,Score,Passing_Score,No_Items,Status)
VALUES ('$user_id','$lesson_name', '$score', '$passing_score', '$no_of_items','$status')";

if ($conn->query($sql) === TRUE) {
    echo "Score saved!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

if($status = "passed") {
    $update = "UPDATE progress SET done = done + 1 WHERE user_id = '$user_id' and subject = 'MATH'";
    $conn->query($update) or die("Error");
}

$conn->close();
?>