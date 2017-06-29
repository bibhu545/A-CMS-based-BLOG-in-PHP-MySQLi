<?php

	if (isset($_REQUEST["signin"]))
	{
		session_start();
		$userid = $_REQUEST["userid"];
		$password = $_REQUEST["password"];
		include('../libraries/db.php');
		$q = mysql_query("SELECT * FROM admin WHERE userid = '$userid' AND password = '$password'");
		if($arr = mysql_fetch_array($q))
		{
			if($arr["userid"]==$userid && $arr["password"]==$password)
			{
        $_SESSION['login_user'] = $userid;
				header('location:index.php');
			}
			else if($arr["userid"]!=$userid || $arr["password"]!=$password)
			{
				echo "try again";
			}		
		}
	}

?>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Admin Area</title>

    
    <link href="../css/bootstrap.css" rel="stylesheet">

    <link href="../css/signin.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">

      <form class="form-signin" method="POST">
        <h2 class="form-signin-heading">Admin Login</h2>
        <label class="sr-only">Admin Id : </label>
        <input class="form-control" placeholder="User Id" required autofocus name="userid">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password">
        
        <input class="btn btn-lg btn-primary btn-block" type="submit" name="signin" vlaue="Sign in"</input>
      </form>
      <span><?php echo @$msg; ?></span>
    </div> 

  </body>
</html>
