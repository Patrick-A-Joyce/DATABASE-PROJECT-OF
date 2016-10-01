<?php // sqltest.php
#################################################################
  require_once 'login.php';
  $conn = new mysqli($hn, $un, $pw, $db);             // CONNECTION TO DATABASE USING PARAMITERS FROM LOGIN.PHP
  if ($conn->connect_error) die($conn->connect_error);


  echo '<form action="index.html" method="post">
  
  <div id ="box"><center><input type="submit" value="HOME"></center></div>';

 $query  = "SELECT * FROM parents_table,children_table where parents_table.parent_id = children_table.parent_id;";
  $result = $conn->query($query);
  if (!$result) die ("Database access failed: " . $conn->error);
  $rows = $result->num_rows;                  
  for ($j = 0 ; $j < $rows ; ++$j)
  {
    $result->data_seek($j);
    $row = $result->fetch_array(MYSQLI_NUM);

echo <<<_END

    <!DOCTYPE html>
      <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
      </head>
          <body>  
              <div id ="box">               
                <center><h2>Parent Details</h2></center>
<pre>
               Parent ID:   $row[0]
               First Name:  $row[1]
               Last Name:   $row[2]
               Gender:      $row[3]
               Address:     $row[4]
                            $row[5]
               City:        $row[6]
               Provence:    $row[7]
               Home No:     $row[8]
               Mobile No:   $row[9]
               Note:        $row[10]
</pre>
<br>
<center><h2>Child of parent</h2></center>
<pre>
              Child ID:    $row[11]
              Parent ID:   $row[12]
              Gender:      $row[13]
              First Name:  $row[14]
              Second Name: $row[15]
              NickName:    $row[16]
              Age:         $row[17]
              DOB:         $row[18]
              Note:        $row[19]
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
