<html lang="en">
  <head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  </head>
<body>
  <div class="container">
  <?php
  require_once 'dBug.php';

  // Could also use getenv('MYSQL_PORT_3306_TCP_ADDR')
  // But recommended to use the host entry which survives server restart
  // Can use either the 'docker container link name OR the link alias'
  $mysql_hostname = 'percona-container';
  $dsn = 'mysql:host='.gethostbyname($mysql_hostname).';dbname=mysql';
  $usr = 'root';
  $pwd = 'password';

  try {
      $dbh = new PDO($dsn, $usr, $pwd);

      echo '<hr /><p><h2>MySQL Connection Successful!</h2><hr />';

      foreach($dbh->query('SELECT * from user') as $row) {
          print '<h3>[mysql.user] Table Row Data:</h3><ul>';
          print('<li>User: '.$row['User'] . '</li>');
          print('<li>Host: '.$row['Host'] . '</li>');
          print('<li>Encrypted Password: '.$row['authentication_string'] . '</li>');
          print '</ul>';
          print '<hr><br>';
          new dBug($row);
          print '<hr><br>';
          print '<pre>';
          print_r($row);
          print '</pre>';
          print '<hr><br>';
          print '<pre>';
          var_dump($row);
          print '</pre>';
      }
      $dbh = null;
  } catch (PDOException $e) {
      die('Connection failed: ' . $e->getMessage());
  }
  ?>
  </div>
</body>
</html>
