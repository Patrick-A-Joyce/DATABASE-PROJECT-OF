<?php 
 
  require_once 'login.php';
  $conn = new mysqli($hn, $un, $pw, $db);							
      if ($conn->connect_error) die($conn->connect_error);


  if (isset($_POST['payment_id']))
  {
    $payment_id = get_post($conn, 'payment_id');
    $bill_id = get_post($conn, 'bill_id');
    $amount_paid = get_post($conn, 'amount_paid');
    $amount_outstanding = get_post($conn, 'amount_outstanding');
    
    
    $query  = "UPDATE `schooldb`.`payments_table` SET `amount_paid` = $amount_paid, `amount_outstanding` = $amount_outstanding  WHERE `payments_table`.`payment_id` = $payment_id;";
/* 
    #UPDATE `schooldb`.`payments_table` SET `amount_paid` = '000.00', `amount_outstanding` = '105.00' WHERE `payments_table`.`payment_id` = 1108;




*/
    $result = $conn->query($query);
    if (!$result) echo "UPDATE failed: $query<br>" .
      $conn->error . "<br><br>";
  }

 
 echo '
  
  <div id ="box"><center><a href="index.html"><button type="button">HOME</button></a></center><br>
<br><center><a href="#add1"><button type="button">UPDATE A BILL</button></a></center><br>
	

  </div>';

  $query  = "SELECT * FROM payments_table";
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
<h2><center>Payment Details</center></h2>
<pre>
            Payment ID:         $row[0]
            Bill ID:            $row[1]
            Date of Payment:    $row[2]
            Amount paid:        $row[3]
            Amount outstanding: $row[4]
            Note:               $row[5]
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
<div id="add1"></div>
    <center><table>
    <tr><td><br><form action="sqltest4.php" method="post">
    
      <center><h3>UPDATE A PAYMENT </h3></center>
      <pre>
      Payment ID          <input type="text" name="payment_id" size="10" value="$row[0]">
      Bill ID             <input type="text" name="bill_id" size="10" value="$row[1]">
      Amount payed        <input type="text" name="amount_paid" size="10">
      Amount Outstanding  <input type="text" name="amount_outstanding" size="10">
      
     </pre>
    <br>
    <center><input type="submit" value="update"></form></td>
    </tr></table></center>
   </div>
   <br>
   <form action="index.html" method="post">
  
  <div id="box2">
  <center><input type="submit" value="HOME"></center>
   </div>
</body>
</html>

_END;

  $result->close();													
  $conn->close();
  
  function get_post($conn, $var)
  {																	
    return $conn->real_escape_string($_POST[$var]);
  }
    

?>

