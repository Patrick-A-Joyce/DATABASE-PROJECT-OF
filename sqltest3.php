<?php 
 
  require_once 'login.php';
  $conn = new mysqli($hn, $un, $pw, $db);							
      if ($conn->connect_error) die($conn->connect_error);


  if (isset($_POST['add']) && isset($_POST['parent_id']))
  {
    $child_id = get_post($conn, 'child_id');
    $parent_id = get_post($conn, 'parent_id');
    $gender = get_post($conn, 'gender');
    $f_name = get_post($conn, 'first_name');
    $l_name = get_post($conn, 'last_name');
    $nickname = get_post($conn, 'nickname');
    $age = get_post($conn, 'age');
    $dob = get_post($conn, 'date_of_birth');
    $other_details = get_post($conn, 'other_details');
    
    $query  = "INSERT INTO `schooldb`.`children_table` (`child_id`, `parent_id`, `gender`, `first_name`, `last_name`, `nickname`, `age`, `dob`, `other_detils`) VALUES ('$child_id', '$parent_id', '$gender', '$f_name', '$l_name', '$nickname', '$age', '$dob', '$other_details');";      // DELETION QUERY & STATMENT
    $result = $conn->query($query);
    if (!$result) echo "INSERT failed: $query<br>" .
      $conn->error . "<br><br>";
  }

  echo '<form action="index.html" method="post">
  
  <div id ="box">
  <center><input type="submit" value="HOME"></center>
  <br><br>
  <center><a href="#add1"><button type="button">ADD A NEW CHILD</button></a></center>
  <br>
  </div>';

 

  $query  = "SELECT * FROM children_table";
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
<div id="box2">
<center><h2>Child Details</h2></center>
<pre>
            Child ID:     $row[0]
            Parent ID:    $row[1]
            Gender:       $row[2]
            First Name:   $row[3]
            Last name:    $row[4]
            Nickname:     $row[5]
            Age:          $row[6]
            DOB:          $row[7]
            Note:         $row[8]
</pre>
    

</div>
</body>
</html>
_END;
  }
  echo <<<_END
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
  <title></title>
</head>
<body>

<div id="box2">
    <center><table>
    <tr><td><br><form action="sqltest3.php" method="post">
      <center>PARENT ID OF NEW CHILD
      <input type="text" size="14" name="add" value="eg:1001"></center>
      <center><h3>Add a Child </h3></center>
      
      <pre>
      Child ID    <input type="text" name="child_id" size="10">
      Parent ID   <input type="text" name="parent_id" size="10">
      Gender      <input type="text" name="gender" size="10">
      First Name  <input type="text" name="first_name" size="10">
      Last Name   <input type="text" name="last_name" size="10">
      Nickname    <input type="text" name="nickname" size="10">
      Age         <input type="text" name="age" size="10">
      DOB         <input type="text" name="date_of_birth" size="10">
      Note:       <input type="text" name="other_details" size="10">
      </pre>
    <br>
    <center><input type="submit" value="Add Child"></form></td>
    </tr></table></center>
   </div>
<div id="add1"></div>   
</body>
</html>

_END;

  $result->close();													
  $conn->close();
  
  function get_post($conn, $var)
  {																	
    return $conn->real_escape_string($_POST[$var]);
  }
    echo '<form action="index.html" method="post">
    
  <div id ="box"><center><input type="submit" value="HOME"></center></div>';

?>

