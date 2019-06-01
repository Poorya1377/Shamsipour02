<?php
$con=mysqli_connect("localhost", "Admin-Football", "P@ssw0rd9515jzMP", "football");
mysqli_query($con, "SET NAMES utf8");
 if (mysqli_connect_errno())
   {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
 
 $sql="INSERT INTO players (player_name, birthday, position_play)
 VALUES
 ('$_POST[name]','$_POST[date]','$_POST[postition]')";
 
 if (!mysqli_query($con,$sql))
   {
   die('Error: ' . mysqli_error($con));
   }
 echo "1 record added";
 
 mysqli_close($con);
 ?>