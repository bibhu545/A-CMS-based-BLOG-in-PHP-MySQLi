<?php include('config/config.php'); ?>
<?php include('libraries/database.php'); ?>
<?php include('includes/header.php'); ?>
<?php include('helpers/format_helper.php'); ?>
<?php
	
	$id = $_GET['id'];
	session_start();
	$_SESSION["id"] = $id;
	$db = new Database();
	$query = "SELECT * FROM posts WHERE id = ".$id;
	$post = $db->select($query)->fetch_assoc();
	$query = "SELECT * FROM categories";
	$categories = $db->select($query);



?>
<?php

	$sql = "SELECT * FROM comments WHERE post_id = '$id' ORDER BY comment_id DESC";
	$comments = mysqli_query($db->link,$sql);
	$total_records = mysqli_num_rows($comments);

?>

	<h2 class="blog-post-title"><?php echo $post["title"]; ?></h2>
	<p class="blog-post-meta"><?php echo format_date($post["date"]); ?> By <a href="https://www.facebook.com/b.i.b.h.u.98"><?php echo $post["author"]; ?></a></p>
	<?php echo $post["body"]; ?>
		<div style="padding-top: 40px;">
		<h5>
			Before posting your code you must <a href="https://www.freeformatter.com/html-escape.html" target="
			_blank">escape it to view</a> . To format your source code and use format highlighting, post your source code inside <br>
			&lt;pre&gt;&lt;code&gt;----Your Source Code---- &lt;/code&gt;&lt;/pre&gt; (Remove spaces from pre and code tags)
		</h5><br>
		<h3><span class="badge"><?php echo $total_records; ?></span> Comments</h3><br>
		<form method="post" action="giveComment.php">
			<div class="col-xs-6" style="padding: 0px;">
			<input type="email" name="email" class="form-control feedback_input" required="required" placeholder="Enter Your Email*"><br></div>
			<textarea name="comment_body" class="form-control feedback_input" required="required" placeholder="Your Comment*" rows="5"></textarea>
			<br>
			<input type="submit" name="post_comment" class="btn btn-primary" value="Post Comment" style="float: right;border-radius: 20px;">
		</form>
		<br>
		<br>

		<?php while($result = $comments->fetch_assoc()): ?>
			<a href="mailto:<?php echo $result["email"]; ?>" style="text-decoration: none;"><?php echo $result["email"]; ?></a>
			<br><br>
			<div class="comment_body">
				<?php echo $result["comment"]; ?>
			</div>
			<hr noshade>
		<?php endwhile; ?>
	</div>
</div>



<?php include('includes/footer.php'); ?>