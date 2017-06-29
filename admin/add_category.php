<?php include('includes/header.php'); ?>
<?php include('../libraries/database.php'); ?>
<?php include('../helpers/format_helper.php'); ?>
<?php   
	session_start();
	if(!$_SESSION['login_user'])
	{
		header('location:admin-login.php');
	}
	else
	{
		$db = new Database();
		if(isset($_POST['submit']))
		{
			$name = mysqli_real_escape_string($db->link,$_POST['name']);

			//validation
			if($name == '')
			{
				$error = "Please fill out all fields";
			}
			else
			{
				$query = "INSERT INTO categories (name) VALUES ('$name') ";

				$update_row = $db->update($query);
			}
		}
	}

?>
<div class="col-xs-12" style="min-height: 350px;padding-top: 40px;">
	<form method="POST" action="add_category.php">

	  <div class="form-group">
	    <label>Category Title</label>
	    <input name="name" type="text" class="form-control" placeholder="Enter Category Name">
	  </div>

	  <div>
	  	<input name="submit" type="submit" class="btn btn-primary"></input>
	  	<a href="index.php" class="btn btn-warning">Cancel</a>
	  </div>
	  <br>
	</form>
</div>
<?php include('includes/footer.php'); ?>