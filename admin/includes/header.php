<!DOCTYPE html>
<html>

<head>

	<title>CodeSprint</title>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../css/custom.css">


</head>

<body>

	
	
  	<div class="container">

    	<nav class="navbar navbar-default navbar-fixed-top">
	      <div class="container">

	        <div class="navbar-header">
	          <a class="navbar-brand" href="index.php">CodeSprint.com</a>
	        </div>

	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav">
	            <li class="active"><a href="index.php">Dash Bord</a></li>
	            <li><a href="add_post.php">Add Post</a></li>
	            <li><a href="add_category.php">Add Categories</a></li>
	            <li><a href="http://localhost:8181/blog/" target="_blank">Visit Blog</a></li>
	          </ul>


	          <ul class="nav navbar-nav navbar-right">
	            <li><a href="logout.php"><span class="glyphicon glyphicon-log-out"> Logout</span></a></li>
	          </ul>
	          
	        </div>
	      </div>
    	</nav>
  	</div>
	

  	<div class="container" style="padding-top: 30px;">
  		<div class="blog-header">
        	<h2 class="blog-title">CodeSprint : Admin Area</h2>
      	</div>


      	<div class="row">
  			<div class="col-xs-12 blog-main">

  			<?php  if(isset($_GET['msg'])) :?>

  				<div class="alert alert-success"><?php echo htmlentities($_GET['msg']); ?></div>
  			<?php  endif; ?>