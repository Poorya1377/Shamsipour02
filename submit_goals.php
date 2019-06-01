<?php
$con=mysqli_connect("localhost", "Admin-Football", "P@ssw0rd9515jzMP", "football");
mysqli_query($con, "SET NAMES utf8");
error_reporting(0); 
 if (mysqli_connect_errno())
   {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
$sql = "SELECT players_id FROM players WHERE player_name='$_POST[player_name]'";
$sqll = "SELECT team_id FROM players WHERE player_name='$_POST[player_name]'";
$sqlll="INSERT INTO goals (match_id, player_id, goal_minutes)
 VALUES
 ('$_POST[match_id]',$con->query($sql) ,'$_POST[minutes]')";
 
 if (!mysqli_query($con,$sqlll))
   {
   die('Error: ' . mysqli_error($con));
   }
 echo "1 record added";


$sqllll = "UPDATE players SET goals = goals + 1   WHERE player_name='$_POST[player_name]'";

if ($con->query($sqllll) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $con->error;
}

$sqlllll = "UPDATE matches SET first_team_goals = first_team_goals + 1   WHERE first_team=$con->query($sqll) and week = $_POST[week_goal]";

if ($con->query($sqlllll) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $con->error;
}

$sqllllll = "UPDATE matches SET second_team_goals = second_team_goals + 1   WHERE second_team= $con->query($sqll) and week = $_POST[week_goal]";

if ($con->query($sqllllll) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $con->error;
}

 mysqli_close($con);
 ?>