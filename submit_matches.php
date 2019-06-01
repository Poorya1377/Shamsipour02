<?php
$con=mysqli_connect("localhost", "Admin-Football", "P@ssw0rd9515jzMP", "football");
mysqli_query($con, "SET NAMES utf8");
error_reporting(0);
 if (mysqli_connect_errno())
   {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
$sq = "SELECT ref_id FROM referee WHERE ref_name='$_POST[referee]'";
$sqll = "SELECT team_id FROM teams WHERE team_name='$_POST[first_team]'";
$sqlll = "SELECT team_id FROM teams WHERE team_name='$_POST[second_team]'";
 $sql="INSERT INTO matches (first_team, second_team, match_date, week, referee)
 VALUES
 ($con->query($sqll),$con->query($sqlll) ,'$_POST[date]' ,'$_POST[week]' ,$con->query($sq))";
 
 if (!mysqli_query($con,$sql))
   {
   die('Error: ' . mysqli_error($con));
   }
 echo "1 record added";

 $sqlllll = "UPDATE referee SET ref_matches = ref_matches + 1   WHERE ref_name='$_POST[referee]'";

if ($con->query($sqlllll) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $con->error;
}

 
 mysqli_close($con);
 ?>