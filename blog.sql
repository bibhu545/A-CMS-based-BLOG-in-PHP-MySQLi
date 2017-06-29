-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2017 at 09:42 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `userid`, `password`) VALUES
(1, 'bibhu', 'bibhu'),
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'C/C++'),
(2, 'Java(JDK)'),
(3, 'PHP/MySQLi'),
(4, 'Tricky Problems'),
(5, 'Data Structure');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `email`, `comment`, `comment_date`) VALUES
(1, 10, 'bibhuranjan.500@gmail.com', 'Hii...\r\nIt was very easily described the method.It helped me a lot.Thank u.', '2017-06-30'),
(2, 13, 'bibhuranjan.500@gmail.com', 'Hello sir,Your javascript api is very good and useful.Please tell me where can i get more stuffs like this . My email id is : b115021@iiit-bh.ac.in', '2017-06-30'),
(3, 13, 'chittaranjan@yahoo.com', 'Hello sir,This method is very useful.But how to take multiple values at a time?', '2017-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `inputdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `firstname`, `lastname`, `phone`, `email`, `message`, `inputdate`) VALUES
(1, 'bibhu', 'bibhu', '9438789444', 'bibhuranjan.500@gmail.com', 'hii i am your huge fan', '2017-06-30'),
(2, 'bibhu', 'bibhu', '9438789444', 'bibhuranjan.500@gmail.com', 'hii i am your huge fan', '2017-06-30'),
(3, 'bibhu', 'bibhu', '9438789444', 'bibhuranjan.545@gmail.com', 'hii I am glad You are here', '2017-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category` int(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `category`, `author`, `tags`, `date`) VALUES
(1, 'Dijkstra''s Algorithm', '	    		<pre>\r\n\r\n#include"iostream"\r\n#include"cstring"\r\nusing namespace std;\r\nint n,adj[100][100];\r\nint min(int Distance[],bool state[])\r\n{\r\n    int index,min = 9999;\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        if(state[i] == false && Distance[i]<=min)\r\n        {\r\n            min = Distance[i];\r\n            index = i;\r\n        }\r\n    }\r\n    cout<<" ";\r\n    return index;\r\n}\r\nvoid Dijsktra()\r\n{\r\n    int parent[100],Distance[100];\r\n    bool state[100];\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        Distance[i] = 9999;\r\n        state[i] = false;\r\n        parent[i] = -1;\r\n    }\r\n    Distance[1] = 0;\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        for(int v=1;v<=n;v++)\r\n        {\r\n            int u = min(Distance,state);\r\n            state[u] = true;\r\n            if(Distance[v]+adj[u][v] <= Distance[v] && adj[u][v] != 0)\r\n            {\r\n                Distance[v] = adj[u][v]+Distance[v];\r\n                parent[v] = u;\r\n            }\r\n        }\r\n    }\r\n    cout<<"Edges : \\n";\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        cout<<"Parent : "<<parent[i];\r\n    }\r\n    cout<<endl;\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        cout<<"Distance : "<<Distance[i];\r\n    }\r\n    cout<<endl;\r\n}\r\nint main()\r\n{\r\n    memset(adj,0,sizeof(adj));\r\n    cout<<"Enter the number of nodes : ";\r\n    cin>>n;\r\n    cout<<"Enter the adjacency matrix : \\n";\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        for(int j=1;j<=n;j++)\r\n        {\r\n            cin>>adj[i][j];\r\n        }\r\n    }\r\n    Dijsktra();\r\n}\r\n\r\n\r\n\r\n</pre>	    	', 1, 'Bibhu', 'C/C++', '2017-06-23 19:27:59'),
(2, 'Prims Algorithm', '	    			    		\r\n<pre>\r\n#include"iostream"\r\n#include"cstring"\r\nusing namespace std;\r\nint n,adj[100][100];\r\nint min(int key[],bool state[])\r\n{\r\n    int index,min = 9999;\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        if(state[i] == false && key[i]<=min)\r\n        {\r\n            min = key[i];\r\n            index = i;\r\n        }\r\n    }\r\n    cout<<" ";\r\n    return index;\r\n}\r\nvoid prims()\r\n{\r\n    int parent[100],key[100];\r\n    bool state[100];\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        key[i] = 9999;\r\n        state[i] = false;\r\n    }\r\n    key[1] = 0;\r\n    parent[1] = -1;\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        for(int v=1;v<=n;v++)\r\n        {\r\n            int u = min(key,state);\r\n            state[u] = true;\r\n            if(state[v] == false && adj[u][v] <= key[v] && adj[u][v] != 0)\r\n            {\r\n                key[v] = adj[u][v];\r\n                parent[v] = u;\r\n            }\r\n        }\r\n    }\r\n    cout<<"Edges : \\n";\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        if(key[i] != 9999)\r\n        {\r\n            cout<<i<<"--->"<<parent[i]<<"--->"<<key[i];\r\n        }\r\n    }\r\n}\r\nint main()\r\n{\r\n    memset(adj,0,sizeof(adj));\r\n    cout<<"Enter the number of nodes : ";\r\n    cin>>n;\r\n    cout<<"Enter the adjacency matrix : \\n";\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        for(int j=1;j<=n;j++)\r\n        {\r\n            cin>>adj[i][j];\r\n        }\r\n    }\r\n    prims();\r\n}\r\n</pre>	    		    	', 1, 'Bibhu', 'C/C++,Data Sructure', '2017-06-23 19:42:35'),
(5, 'Bellman  Ford''s Algorithm', '<pre>\r\n\r\n#include<iostream>\r\n#include<cstring>\r\nusing namespace std;\r\nint n,dist[100],parent[100],weight[100][100];\r\nvoid initializeSource(int source)\r\n{\r\n    for(int i=1;i<=n;i++)\r\n    {\r\n        dist[i] = 9999;\r\n        parent[i] = -1;\r\n    }\r\n    dist[source] = 0;\r\n}\r\nvoid relax(int u,int v)\r\n{\r\n    if(dist[v] > dist[u]+weight[u][v])\r\n    {\r\n        dist[v] =  dist[u]+weight[u][v];\r\n        parent[v] = u;\r\n    }\r\n}\r\nvoid bellmanFord(int source)\r\n{\r\n    initializeSource(source);\r\n    for(int i=1;i<=n-1;i++)\r\n    {\r\n        for(int j=1;j<=n;j++)\r\n        {\r\n            for(int k=1;k<=n;k++)\r\n            {\r\n                if(weight[j][k] != 0)\r\n                {\r\n                    relax(j,k);\r\n                }\r\n            }\r\n        }\r\n    }\r\n    //for negetive node\r\n}\r\nint main()\r\n{\r\n    memset(weight,0,sizeof(weight));\r\n    cout<<"Enter the number of nodes : ";\r\n    cin>>n;\r\n    cout<<"Enter the weighted matrix : ";\r\n    for(int i=0;i<=n;i++)\r\n    {\r\n        for(int j=1;j<=n;j++)\r\n        {\r\n            cin>>weight[i][j];\r\n        }\r\n    }\r\n    int source;\r\n    cout<<"Enter the starting index : ";\r\n    cin>>source;\r\n    bellmanFord(source);\r\n}\r\n\r\n</pre>', 5, 'Bibhu', 'C/C++,Data Sructure', '2017-06-24 02:13:49'),
(6, 'PHP Delete', '	    		<pre><xmp>\r\n<?php\r\n\r\n	if(isset($_POST[''delete'']))\r\n	{\r\n		$query = "DELETE FROM categories WHERE id = ".$id;\r\n		$delete_row = $db->delete($query);\r\n	}\r\n\r\n?></xmp></pre>	    		    		    		    	', 3, 'Bibhu Ranjan', 'php', '2017-06-24 02:18:31'),
(7, 'Hello World - JAVA', '<pre>\r\nclass Hello\r\n{\r\n	public static void main(String[] args) \r\n	{\r\n		System.out.println("Hello World");\r\n	}	\r\n}\r\n</pre>', 2, 'Bibhu Ranjan', 'Java', '2017-06-29 17:01:41'),
(8, 'Circular Double Link List - c++', '	    		<pre>\r\n#include<iostream>\r\n#include<cstdlib>\r\nusing namespace std;\r\nstruct node\r\n{\r\n    int data;\r\n    struct node *next;\r\n    struct node *prev;\r\n};\r\nstruct node *head=NULL,*temp=NULL;\r\nvoid insertNodeFirst(int data)\r\n{\r\n    struct node *newnode;\r\n    if(head == NULL)\r\n    {\r\n        newnode = (struct node *)malloc(sizeof(struct node));\r\n        newnode->data = data;\r\n        newnode->next = NULL;\r\n        newnode->prev = temp;\r\n        head = newnode;\r\n        temp = newnode;\r\n    }\r\n    else\r\n    {\r\n        newnode = (struct node *)malloc(sizeof(struct node));\r\n        newnode->data = data;\r\n        newnode->next = head;\r\n        newnode->prev = temp;\r\n        temp->next = newnode;\r\n        temp = newnode;\r\n    }\r\n}\r\nvoid insertHead(int data)\r\n{\r\n    struct node *newnode;\r\n    if(head == NULL)\r\n    {\r\n        insertNodeFirst(data);\r\n    }\r\n    else\r\n    {\r\n        newnode = (struct node *)malloc(sizeof(struct node));\r\n        newnode->data = data;\r\n        newnode->next = head;\r\n        newnode->prev = temp;\r\n        head = newnode;\r\n    }\r\n}\r\nvoid traverseFromFirst()\r\n{\r\n    if(head == NULL)\r\n    {\r\n        cout<<"Empty List.\\n";\r\n    }\r\n    else\r\n    {\r\n        struct node *t = head;\r\n        while(t->next != head)\r\n        {\r\n            cout<<t->data<<"\\t";\r\n            t = t->next;\r\n        }\r\n        cout<<endl;\r\n    }\r\n}\r\nvoid traverseFromLast()\r\n{\r\n    struct node *t = temp;\r\n    if(head == NULL)\r\n    {\r\n        cout<<"Empty List.\\n";\r\n    }\r\n    else\r\n    {\r\n        while(t->prev != temp)\r\n        {\r\n            cout<<t->data<<"\\t";\r\n            t=t->prev;\r\n        }\r\n    }\r\n    cout<<endl;\r\n}\r\nint main()\r\n{\r\n    int data,choice;\r\n    while(1)\r\n    {\r\n        cout<<"1.Insert Last\\t2.Insert Head\\t3.Traverse First\\t4.Traverse Last\\n\\nEnter your choice : ";\r\n        cin>>choice;\r\n        switch(choice)\r\n        {\r\n        case 1:\r\n            cout<<"Enter Data : ";\r\n            cin>>data;\r\n            insertNodeFirst(data);\r\n            break;\r\n        case 2:\r\n            cout<<"Enter Data : ";\r\n            cin>>data;\r\n            insertHead(data);\r\n            break;\r\n        case 3:\r\n            traverseFromFirst();\r\n            break;\r\n        case 4:\r\n            traverseFromLast();\r\n            break;\r\n        default:\r\n            cout<<"\\nInvalid Choice.\\n";\r\n            exit(0);\r\n        }\r\n    }\r\n}\r\n\r\n<pre>   	', 1, 'Bibhu Ranjan', 'C/C++', '2017-06-29 18:06:14'),
(9, 'Count number of pairs Sum Closest to Zero in an Array', '<pre>\r\n#include&lt;iostream&gt;\r\nusing namespace std;\r\nint main()\r\n{\r\n    int arr[100],n,a,b,diff=9999,sum=0,temp;\r\n    cout&lt;&lt;&quot;Enter number of elements : &quot;;\r\n    cin&gt;&gt;n;\r\n    cout&lt;&lt;&quot;Enter the elements : &quot;;\r\n    for(int i=0;i&lt;n;i++)\r\n    {\r\n        cin&gt;&gt;arr[i];\r\n    }\r\n    for(int i=0;i&lt;n;i++)\r\n    {\r\n        for(int j=0;j&lt;n;j++)\r\n        {\r\n            if(i==j)\r\n            {\r\n                continue;\r\n            }\r\n            else\r\n            {\r\n                sum = arr[i]+arr[j];\r\n                if(sum &gt;= 0)\r\n                {\r\n                    temp = sum;\r\n                }\r\n                else\r\n                {\r\n                    temp = 0-sum;\r\n                }\r\n                if(temp &lt; diff)\r\n                {\r\n                    diff = temp;\r\n                    a = arr[i];\r\n                    b = arr[j];\r\n                }\r\n            }\r\n        }\r\n    }\r\n    cout&lt;&lt;&quot;(&quot;&lt;&lt;a&lt;&lt;&quot;,&quot;&lt;&lt;b&lt;&lt;&quot;)&quot;&lt;&lt;endl;\r\n}\r\n\r\n</pre>', 4, 'Bibhu Ranjan', 'tricky problem', '2017-06-29 19:19:34'),
(10, 'Count Length of Last Word in a sentence', '<pre>\r\n#include&lt;iostream&gt;\r\n#include&lt;string&gt;\r\nusing namespace std;\r\nint main()\r\n{\r\n    string str;\r\n    int t;\r\n    cin&gt;&gt;t;\r\n    while(t--)\r\n    {\r\n        cin.ignore();\r\n        getline(cin,str);\r\n        int c=0;\r\n        for(int i=str.length()-1;i&gt;=0;i--)\r\n        {\r\n            if(str.at(i) == '' '')\r\n            {\r\n                break;\r\n            }\r\n            else\r\n            {\r\n                c++;\r\n            }\r\n        }\r\n        cout&lt;&lt;c&lt;&lt;endl;\r\n    }\r\n}\r\n\r\n</pre>', 4, 'Bibhu Ranjan', 'tricky problem', '2017-06-29 19:24:19'),
(12, 'JavaScript Form Validation', '<pre>\r\n&lt;!DOCTYPE html&gt;\r\n&lt;html&gt;\r\n&lt;head&gt;\r\n&lt;script&gt;\r\nfunction validateForm() {\r\n    var x = document.forms[&quot;myForm&quot;][&quot;fname&quot;].value;\r\n    if (x == &quot;&quot;) {\r\n        alert(&quot;Name must be filled out&quot;);\r\n        return false;\r\n    }\r\n}\r\n&lt;/script&gt;\r\n&lt;/head&gt;\r\n&lt;body&gt;\r\n\r\n&lt;form name=&quot;myForm&quot; action=&quot;/action_page_post.php&quot;\r\nonsubmit=&quot;return validateForm()&quot; method=&quot;post&quot;&gt;\r\nName: &lt;input type=&quot;text&quot; name=&quot;fname&quot;&gt;\r\n&lt;input type=&quot;submit&quot; value=&quot;Submit&quot;&gt;\r\n&lt;/form&gt;\r\n\r\n&lt;/body&gt;\r\n&lt;/html&gt;\r\n</pre>', 3, 'Bibhu Ranjan', 'PHP,JavaScript', '2017-06-29 19:28:08'),
(13, 'JavaScript Form API', '<pre>\r\n&lt;!DOCTYPE html&gt;\r\n&lt;html&gt;\r\n&lt;body&gt;\r\n\r\n&lt;p&gt;Enter a number and click OK:&lt;/p&gt;\r\n\r\n&lt;input id=&quot;id1&quot; type=&quot;number&quot; min=&quot;100&quot; max=&quot;300&quot; required&gt;\r\n&lt;button onclick=&quot;myFunction()&quot;&gt;OK&lt;/button&gt;\r\n\r\n&lt;p&gt;If the number is less than 100 or greater than 300, an error message will be displayed.&lt;/p&gt;\r\n\r\n&lt;p id=&quot;demo&quot;&gt;&lt;/p&gt;\r\n\r\n&lt;script&gt;\r\nfunction myFunction() {\r\n    var inpObj = document.getElementById(&quot;id1&quot;);\r\n    if (inpObj.checkValidity() == false) {\r\n        document.getElementById(&quot;demo&quot;).innerHTML = inpObj.validationMessage;\r\n    } else {\r\n        document.getElementById(&quot;demo&quot;).innerHTML = &quot;Input OK&quot;;\r\n    } \r\n} \r\n&lt;/script&gt;\r\n\r\n&lt;/body&gt;\r\n&lt;/html&gt;\r\n\r\n</pre>', 3, 'Bibhu Ranjan', 'PHP,JavaScript', '2017-06-29 19:30:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
