<?php
$con=mysqli_connect("localhost", "Admin-Football", "P@ssw0rd9515jzMP", "football");
mysqli_query($con, "SET NAMES utf8");
 if (mysqli_connect_errno())
   {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
 
 $result = mysqli_query($con,"SELECT * FROM matches WHERE week = $_POST[week]");
 echo "<table frame=vsides align=center width='1000'>
 <tr align=center bgcolor=lightblue>
 <th color=red>تیم اول</th>
 <th>تعداد گل تیم اول</th>
 <th>تعداد گل تیم دوم</th>
 <th>تیم دوم</th>
 </tr>";
 
 while($row = $result->fetch_assoc())
   {
    $sqll = mysqli_query($con,"SELECT team_name FROM teams WHERE team_id = $row[first_team]");
    $sqlll = mysqli_query($con,"SELECT team_name FROM teams WHERE team_id= $row[second_team]");
    while(($row2 = $sqll->fetch_assoc()) && ($row3 = $sqlll->fetch_assoc()))
    {
      echo "<tr align=center>";
      echo( "<td bgcolor=lightblue>" . $row2['team_name'] . "</td>");
      echo "<td bgcolor=lightgray>" . $row['first_team_goals'] . "</td>";
      echo "<td bgcolor=lightgray>" . $row['second_team_goals'] . "</td>";
      echo "<td bgcolor=lightblue>" . $row3['team_name'] . "</td>";
     echo "</tr>";
    }
   }
 echo "</table>";
 
 mysqli_close($con);
 ?>