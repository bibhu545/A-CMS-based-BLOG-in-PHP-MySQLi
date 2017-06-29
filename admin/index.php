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
    $query = "SELECT * FROM posts ORDER BY id DESC";
    $posts = $db->select($query);
    $query = "SELECT * FROM categories";
    $categories = $db->select($query);
  }

?>

  			<table class="table table-striped">
  					<tr>
              <th>Post Id#</th> 
              <th>Post Title</th> 
              <th>Category</th> 
              <th>Author</th> 
              <th>Date</th>    
            </tr>
            <?php if($posts): ?>
            <?php while($row = $posts->fetch_assoc()) : ?>
            <tr>              
              <td><?php echo $row["id"]; ?></td>
              <td><a href="edit_post.php?id=<?php echo $row["id"]; ?>"><?php echo $row["title"]; ?></a></td>
              <td><?php echo $row["category"]; ?></td>
              <td><?php echo $row["author"]; ?></td>
              <td><?php echo format_date($row["date"]); ?></td>              
            </tr>
            <?php endwhile; ?>
            <?php endif; ?>
				</table>
        <br><br>
        <table class="table table-striped">
            <tr>
              <th>Category Id#</th> 
              <th>Category Name</th>      
            </tr>
            <?php if($categories): ?>
            <?php while($row = $categories->fetch_assoc()) : ?>
            <tr>              
              <td><?php echo $row["id"]; ?></td>
              <td><a href="edit_category.php?id=<?php echo $row["id"]; ?>"><?php echo $row["name"]; ?></a></td>              
            </tr>
            <?php endwhile; ?>
          <?php endif; ?>
        </table>

<?php include('includes/footer.php'); ?>