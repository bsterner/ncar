<?php
require_once 'dBug.php';

// Could also use getenv('MYSQL_PORT_3306_TCP_ADDR')
// But recommended to use the host entry which survives server restart
// Can use either the 'docker container link name OR the link alias'
$percona_server_alias = 'percona';
$percona_server_name = 'percona-server';
$dsn = 'mysql:host='.gethostbyname($percona_server_alias).';dbname=docker';
$usr = 'php';
$pwd = 'pass';

try {
    $dbh = new PDO($dsn, $usr, $pwd);

    echo '<hr /><p><em><strong>Connection made!!!</em></strong></p><hr />';

    foreach($dbh->query('SELECT * from people') as $row) {
        print '<ul>';
        print('<li>ID: '.$row['id'] . '</li>');
        print('<li>First Name: '.$row['fname'] . '</li>');
        print('<li>Last Name: '.$row['lname'] . '</li>');
        print '</ul>';
        print_r($row);
        new dBug($row);
        print '<hr><br>';
    }
    $dbh = null;
} catch (PDOException $e) {
    die('Connection failed: ' . $e->getMessage());
}

?>
