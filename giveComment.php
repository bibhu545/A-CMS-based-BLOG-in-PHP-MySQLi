<?php

		include("libraries/database.php");
		session_start();
		$db = new Database();
		$email = $_REQUEST["email"];
		$comment = $_REQUEST["comment_body"];
		$date = date("Y-m-d h:i:sa");
		$post_id = $_SESSION["id"];

		$sql = "INSERT INTO comments (post_id,email,comment,comment_date)VALUES('$post_id','$email','$comment','$date')";
		$row = mysqli_query($db->link,$sql);
	
		header("location:post.php?id=$post_id");
?>