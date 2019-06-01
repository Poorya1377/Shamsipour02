<?php
$con=mysqli_connect("localhost", "Admin-Football", "P@ssw0rd9515jzMP", "football");
mysqli_query($con, "SET NAMES utf8");
 if (mysqli_connect_errno())
   {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
 
 $sql="INSERT INTO teams (team_name, first_kit_color, second_kit_color, place, score)
 VALUES
 ('$_POST[name]','$_POST[first_kit]','$_POST[second_kit]','$_POST[place]','$_POST[score]')";
 
 if (!mysqli_query($con,$sql))
   {
   die('Error: ' . mysqli_error($con));
   }
 echo "1 record added";
 
 mysqli_close($con);
 ?>