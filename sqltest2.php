<?php 
 
  require_once 'login.php';
  $conn = new mysqli($hn, $un, $pw, $db);							
      if ($conn->connect_error) die($conn->connect_error);

echo '<form action="index.html" method="post">
  
  <div id ="box"><center><input type="submit" value="HOME"></center></div>';

  if (isset($_POST['delete']) && isset($_POST['parent_id']))
  {
    $parent_id = get_post($conn, 'parent_id');
    $query  = "DELETE FROM parents_table WHERE parent_id ='$parent_id'";      // DELETION QUERY & STATMENT
    $result = $conn->query($query);
    if (!$result) echo "DELETE failed: $query<br>" .
      $conn->error . "<br><br>";
  }

  $query  = "SELECT * FROM parents_table";
  $result = $conn->query($query);
       if (!$result) die ("Database access failed: " . $conn->error);

  $rows = $result->num_rows;										
  
     for ($j = 0 ; $j < $rows ; ++$j)
  {
    $result->data_seek($j);
    $row = $result->fetch_array(MYSQLI_NUM);

    echo <<<_END
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
  <title></title>
</head>
<body>
<div id="box">
    
    
    <pre>
      <center><h2>Parent Details</h2></center>
            Parent ID   $row[0]
            First Name  $row[1]
            Last Name   $row[2]
            Gender      $row[3]
            Address     $row[4]
                        $row[5]
            City        $row[6]
            Provence    $row[7]
            Home No     $row[8]
            Mobile No   $row[9]     
            Note:       $row[10]
    </pre>
    <pre>
    <center><table>
    <tr><td><br><form action="sqltest2.php" method="post">
    <input type="text" size="14" name="delete" value="$row[0]">
    <input type="hidden" name="parent_id" value="$row[0]">
    <input type="submit" value="DELETE RECORD"></form></td>
    </tr></table></center>
 
  </pre>
</div>
</body>
</html>
_END;
  }

  $result->close();													
  $conn->close();
  
  function get_post($conn, $var)
  {																	
    return $conn->real_escape_string($_POST[$var]);
  }
    echo '<form action="index.html" method="post">
    
  <div id ="box"><center><input type="submit" value="HOME"></center></div>';

?>

