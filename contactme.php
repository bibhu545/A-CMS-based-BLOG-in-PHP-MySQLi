<?php include('config/config.php'); ?>
<?php include('libraries/database.php'); ?>
<?php include('includes/header.php'); ?>

<?php

  $db = new Database();
  if(isset($_REQUEST["sendMessage"]))
  {
      $firstname = mysqli_real_escape_string($db->link,$_REQUEST["firstname"]);
      $lastname = mysqli_real_escape_string($db->link,$_REQUEST["firstname"]);
      $phone = mysqli_real_escape_string($db->link,$_REQUEST["phone"]);
      $email = mysqli_real_escape_string($db->link,$_REQUEST["email"]);
      $message = mysqli_real_escape_string($db->link,$_REQUEST["feedback"]);
      $date = date("Y-m-d h:i:sa");

      $sql = "INSERT INTO feedback (firstname,lastname,phone,email,message,inputdate) VALUES('$firstname','$lastname','$phone','$email','$message','$date')";
      $row = mysqli_query($db->link,$sql);

      //Mail
      $from="bibhuranjan.500@gmail.com";
      $to="bibhuranjan.500@gmail.com";
      $subject="You got a feedback!!";
      $msg="From : ".$firstname." ".$lastname."<br><br>".$message;
      $headers  =  "From:".$from."\r\n".'MIME-Version: 1.0' . "\r\n";
      $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
      mail($to, $subject,$msg, $headers);

      header("location:contactme.php?success=Feedback Sent Successfully.");
  }

?>

          <div class="blog-post" style="overflow-x: auto;">

            <center><h2>Let's Get Connected<br></h2></center>
            <br>
            <?php if(isset($_GET["success"])) : ?>
          
            <center><div class="alert alert-success" style="border: 1px solid blue;border-radius: 20px;"><?php  echo htmlentities($_GET["success"]); ?></div></center>

            <?php endif; ?>
            <form>
              <div class="col-xs-6">
                <input type="text" name="firstname" class="form-control feedback_input" placeholder="Enter First Name*" required="required" tabindex="1">
                <br><br>
                <input type="text" name="phone" class="form-control feedback_input" placeholder="Enter 10 digit Phone number*" required="required" tabindex="3">
              </div>
              <div class="col-xs-6">
                <input type="text" name="lastname" class="form-control feedback_input" placeholder="Enter Last Name*" required="required" tabindex="2">
                <br><br>
                <input type="email" name="email" class="form-control feedback_input" placeholder="Enter Email Here*" required="required" tabindex="4">
              </div>
              <br><br>
              <div class="col-xs-12">
              <br><br>
                <textarea name="feedback" placeholder="Enter your Message Here" class="feedback_message form-control feedback_input" rows="7" tabindex="5" required="required"></textarea><br>
              </div>
              <center>
                <input type="submit" class="btn btn-primary" tabindex="6" value="Send Message" name="sendMessage"><br><br>
              </form>
                <strong>I am also on </strong><br><br>
                    <a href="https://www.facebook.com/b.i.b.h.u.98" target="_blank"><i class="fa fa-facebook fa-fw fa-2x"></i></a>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="https://twitter.com/bibhuranjan500" target="_blank"><i class="fa fa-twitter fa-fw fa-2x"></i></a>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="https://github.com/bibhu545" target="_blank"><i class="fa fa-github fa-fw fa-2x"></i></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="https://twitter.com/bibhuranjan500" target="_blank"><i class="fa fa-instagram fa-fw fa-2x"></i></a>
                        
              </center>
          </div>
          
        </div>



<?php include('includes/footer.php'); ?>