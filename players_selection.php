<?php
$con=mysqli_connect("localhost", "Admin-Football", "P@ssw0rd9515jzMP", "football");
mysqli_query($con, "SET NAMES utf8");
error_reporting(0); 
 if (mysqli_connect_errno())
   {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
   $sqll = "SELECT team_id FROM teams WHERE team_name='$_POST[team_name]'";
$sql = "UPDATE players SET team_id=$con->query($sqll)   WHERE team_id IS NULL and player_name='$_POST[player_name]'";

if ($con->query($sql) === TRUE) {
    echo "Informations submit";
} else {
    echo "Error updating record: " . $con->error;
}
 
  mysqli_close($con);
 ?>
  


  