<?php include('config/config.php'); ?>
<?php include('libraries/database.php'); ?>
<?php include('includes/header.php'); ?>
<?php include('helpers/format_helper.php'); ?>
<?php
 
	$db = new Database();
	$record_per_page = 3;
	$page = '';
	if(isset($_GET['page']))
	{
		$page = $_GET['page'];
	}
	else
	{
		$page = 1;
	}
	$start_from = ($page-1)*$record_per_page;
	$query = "SELECT * FROM posts ORDER BY id DESC LIMIT $start_from,$record_per_page";
	$posts = $db->select($query);
	$query = "SELECT * FROM categories";
	$categories = $db->select($query);
    function add3dots($string) 
    {
          $limit=342;
          $repl = "...";
          if(strlen($string) > $limit) 
          {
            return substr($string, 0, $limit) .$repl; 
          }
          else 
          {
            return $string;
          }
    }
	
?>

<?php  if($posts) : ?>
	<?php while($row = $posts->fetch_assoc()) : ?>

  				<div class="blog-post" style="overflow-x: auto;">
		            <h2 class="blog-post-title"><?php echo $row["title"]; ?></h2>
		            <p class="blog-post-meta"><?php echo format_date($row["date"]); ?> by <a href="https://www.facebook.com/b.i.b.h.u.98"><?php echo $row["author"]; ?></a></p>
		            	<?php echo add3dots($row["body"]); ?>
		            	
		          </div>
		          <a class="readmore" href="post.php?id=<?php echo urldecode($row["id"]); ?>">Read More</a><br>

		      <?php  endwhile ; ?>

                   <div align="center">

                        <?php

                            $query = "SELECT * FROM posts";
                            $page_result = mysqli_query($db->link,$query);
                            $total_records = mysqli_num_rows($page_result);
                            $total_pages = ceil($total_records/$record_per_page);
                            $i = 2;
                            $j = $i-1;
                            if(isset($_GET["page"]))
                            {
                                $i = $_GET["page"];
                                if($i == $total_pages)
                                {
                                    $i = 1;
                                }
                                else
                                {
                                    $i++;
                                }
                            }
                        ?>
                        <nav>
                            <ul class="pager">
                              <li><a href="index.php?page=<?php echo $j; ?>">Previous</a></li>
                              <li><a href="index.php?page=<?php echo $i; ?>">Next</a></li>
                            </ul>
                        </nav>
                    </div>
  			</div>

<?php else :  ?>

	<p>There are no posts yet .</p>


<?php endif; ?>

<?php include('includes/footer.php'); ?>