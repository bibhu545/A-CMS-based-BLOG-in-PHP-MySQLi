<?php
   include('../libraries/database.php');
   session_start();
   
   // $user_check = $_SESSION['login_user'];
   
   // $ses_sql = mysql_query("select username from admin where username = '$user_check' ");
   
   // $row = mysql_fetch_array($ses_sql);
   
   // $login_session = $row['username'];
   
   if(isset($_SESSION['login_user']))
   {
      header("location:index.php");
   }
   else
   {
   		 header("location:add_post.php");
   }
?>