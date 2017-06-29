<?php

	$con = mysql_connect('localhost','root','');
	if(!$con)
	{
		echo "Datbase Error ".mysql_error($con);
	}
	else
	{
		mysql_select_db("blog");
	}

?>