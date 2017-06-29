	  		
	  		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
	  		
		        <div class="sidebar-module sidebar-module-inset">
			        <center><h4>About</h4></center>
			        <center>
			        	<img src="images/bibhu.jpg" class="img-circle" alt="Bibhu Ranjan" width="100" height="100">
			        </center>
			        <p><?php  echo $about_me; ?></p>
			        <center>
			          <strong>Follow me on </strong><br><br>
			              <a href="https://www.facebook.com/b.i.b.h.u.98"><i class="fa fa-facebook fa-fw fa-2x"></i></a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			              <a href="https://twitter.com/bibhuranjan500"><i class="fa fa-twitter fa-fw fa-2x"></i></a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			              <a href="https://github.com/bibhu545"><i class="fa fa-github fa-fw fa-2x"></i></a>
			                  
			        </center>
		        </div>

		        <div class="sidebar-module">
		        <center><h4>categories</h4></center>
		        <?php if($categories) : ?>
			        <div class="list-group">
			        	<?php while($row = $categories->fetch_assoc()) : ?>
			            <center><a href="posts.php?category=<?php echo $row['id']; ?>" class="list-group-item"><?php echo $row['name']; ?></a></center>
			            <?php endwhile;  ?>
			        </div>
			    <?php else: ?>
			    	<p>There are no categories .</p>
			    <?php endif; ?>
		       	</div>
	        </div>
  		</div>
  	</div>

  	<footer class="blog-footer">
      <p>CodeSprint.com &copy; 2017</p>
      <p>
        <a href="#" style="text-decoration: none;">Back to top</a>
      </p>
    </footer>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

</html>