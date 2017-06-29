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
		$id = $_GET['id'];

		$db = new Database();

		$query = "SELECT * FROM categories WHERE id = ".$id;

		$category = $db->select($query)->fetch_assoc();

		$query = "SELECT * FROM categories";

		$categories = $db->select($query);
	}

?>

<?php

	if(isset($_POST['submit']))
	{
		$name = mysqli_real_escape_string($db->link,$_POST['name']);

		//validation
		if($name == '' )
		{
			$error = "Please fill out all fields";
		}
		else
		{
			$query = "UPDATE categories SET 
						name = '$name'
						WHERE id=".$id;

			$update_row = $db->update($query);
		}
	}

?>
<?php

	if(isset($_POST['delete']))
	{
		$query = "DELETE FROM categories WHERE id = ".$id;
		$delete_row = $db->delete($query);
	}

?>
<div class="col-xs-12" style="min-height: 350px;padding-top: 40px;">
	<form method="POST" action="edit_category.php?id=<?php echo $id ?>">

	  <div class="form-group">
	    <label>Category Title</label>
	    <input name="name" type="text" class="form-control" placeholder="Enter Category Name" value="<?php echo $category['name']; ?>">
	  </div>

	  <div>
	  	<input name="submit" type="submit" class="btn btn-primary"></input>
	  	<a href="index.php" class="btn btn-default">Cancel</a>
	  	<input name="delete" type="submit" class="btn btn-danger" value="Delete"></input>
	  	
	  </div>
	  <br>
	</form>
</div>
<?php include('includes/footer.php'); ?>