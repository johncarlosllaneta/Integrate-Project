<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "integratives";

$conn = new mysqli($servername, $username, $password, $dbname); // Create connection
if ($conn->connect_error) {     // Check connection
    die("Connection failed: " . $conn->connect_error);
} 

$user_id = $_SESSION['id'];
$lesson_name = mysqli_real_escape_string($conn, $_POST['lesson_name']);
$score = mysqli_real_escape_string($conn, $_POST['score']);
$passing_score = mysqli_real_escape_string($conn, $_POST['passing_score']);
$no_of_items = mysqli_real_escape_string($conn, $_POST['no_of_items']);
$status = mysqli_real_escape_string($conn, $_POST['status']);

$sql = "INSERT INTO science_table (user_fk,Lesson_Name,Score,Passing_Score,No_Items,Status)
VALUES ('$user_id','$lesson_name', '$score', '$passing_score', '$no_of_items','$status')";

if ($conn->query($sql) === TRUE) {
    echo "Score saved!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$resultsSQL = "SELECT * FROM science_table WHERE Lesson_Name = '$lesson_name'";

$result = $conn->query($resultsSQL) or die ($conn->query);

$row = $result->fetch_assoc();

$result_status = $row["status"];



if($result->num_rows > 1) {​​

    if($result_status != "passed") {​​

        // do nothing

        if($status == "passed") {​​

            $update = "UPDATE progress SET done = done + 1 WHERE user_id = '$user_id' and subject = 'SCIENCE'";

            $conn->query($update) or die("Error");

        }​​

    }​​ 

}​​ 

$conn->close();
?>