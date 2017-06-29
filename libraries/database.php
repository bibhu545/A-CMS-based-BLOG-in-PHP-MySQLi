<?php

	class Database
	{
		public $host = "localhost";
		public $username = "root";
		public $password = "";
		public $db_name = "blog";

		public $link;
		public $error;

		public function __construct()
		{
			$this->connect();
		}

		private function connect()
		{
			$this->link = new mysqli($this->host,$this->username,$this->password,$this->db_name);

			if(!$this->link)
			{
				$this->error = "Connection Error".$this->link->connect_error;
				return false;
			}
		}

		/*
		 *	Select takes our query
		 */

		public function select($query)
		{
			$result = $this->link->query($query) or die($this->link->error.__LINE__);
			if($result->num_rows > 0) //num rows total number of rows that our query is holding :)
			{
				return $result;
			}
			else
			{
				return false;
			}
		}


		/*
		 *  Insert query
		 */

		public function insert($query)
		{
			$insert_row = $this->link->query($query) or die($this->link->error.__LINE__);

			//validate the insertion

			if($insert_row)
			{
				header("location:index.php?msg=".urlencode('Record added'));
				exit();
			}
			else
			{
				die("ERROR : ".$this->link->error);
			}

		}
		/*
		 *  update
		 */

		public function update($query)
		{
			$update_row = $this->link->query($query) or die($this->link->error.__LINE__);

			//validate the insertion

			if($update_row)
			{
				header("location:index.php?msg=".urlencode('Record Updated'));
				exit();
			}
			else
			{
				die("ERROR : ".$this->link->error);
			}

		}

		/*
		 *  delete
		 */

		public function delete($query)
		{
			$delete_row = $this->link->query($query) or die($this->link->error.__LINE__);

			//validate the insertion

			if($delete_row)
			{
				header("location:index.php?msg=".urlencode('Record Deleted'));
				exit();
			}
			else
			{
				die("ERROR : ".$this->link->error);
			}

		}


	}


	
	// $con = mysql_connect("localhost","root","");
	// if(!$con)
	// {
	// 	die("Database Error : ".mysql_error());
	// }
	// else
	// {
	// 	mysql_select_db("blog",$con);
	// }

	//$f = new Database();

?>

