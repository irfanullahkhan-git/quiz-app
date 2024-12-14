/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.31 : Database - gdc_database
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `buzzers` */

DROP TABLE IF EXISTS `buzzers`;

CREATE TABLE `buzzers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `buzzer_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `buzzers` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `game_team` */

DROP TABLE IF EXISTS `game_team`;

CREATE TABLE `game_team` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `game_id` bigint unsigned NOT NULL,
  `team_id` bigint unsigned NOT NULL,
  `score` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_team_game_id_foreign` (`game_id`),
  KEY `game_team_team_id_foreign` (`team_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `game_team` */

insert  into `game_team`(`id`,`game_id`,`team_id`,`score`,`created_at`,`updated_at`) values 
(1,4,4,0,NULL,NULL),
(4,4,1,100,NULL,NULL),
(3,4,2,20,NULL,NULL);

/*Table structure for table `games` */

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('ict','general knowledge') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `games` */

insert  into `games`(`id`,`name`,`type`,`created_at`,`updated_at`) values 
(1,'Round 1','general knowledge','2024-12-12 16:44:25','2024-12-12 17:00:53'),
(2,'Round 2','ict','2024-12-12 16:49:11','2024-12-12 16:49:11'),
(3,'Round 2','ict','2024-12-12 16:49:46','2024-12-12 16:49:46'),
(4,'Round 1','ict','2024-12-14 09:13:21','2024-12-14 09:13:21');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_04_29_144735_create_attendances_table',1),
(6,'2023_04_29_144749_create_colleges_table',1),
(7,'2023_04_29_144806_create_departments_table',1),
(8,'2023_04_29_144949_create_semesters_table',1),
(9,'2023_04_29_145011_create_students_table',1),
(10,'2023_04_29_145112_create_subjects_table',1),
(11,'2023_04_29_145144_create_teacher_x_subjects_table',1),
(12,'2023_04_29_145200_create_teachers_table',1),
(13,'2023_04_30_071202_add_uuid_to_subjects_table',1),
(14,'2023_04_30_092852_add_timestamps_to_attendances_table',2),
(15,'2023_07_29_085850_add_department_id_to_teachers',3),
(16,'2023_11_04_173720_create_student_requests_table',4),
(17,'2023_11_04_190001_add_columns_to_student_requests',4),
(18,'2023_11_08_184402_add_is_struck_off_to_students',4),
(19,'2023_11_08_190022_add_comments_to_students',4),
(20,'2023_11_25_181427_add_last_struck_off_at_to_students',4),
(21,'2023_11_25_181549_create_struck_off_history_table',4),
(22,'2023_12_11_164912_create_quiz_questions_table',5),
(23,'2023_12_15_212323_create_buzzers_table',5),
(24,'2024_10_26_182251_add_clg_id_to_students_table',6),
(25,'2024_10_26_183108_add_clg_id_to_attendances_table',6),
(26,'2024_10_27_035520_add_clg_id_to_subjects_table',6),
(27,'2024_10_27_101401_add_url_to_colleges_table',7),
(28,'2024_12_10_181810_create_teams_table',8),
(29,'2024_12_11_190610_create_matches_table',9),
(30,'2024_12_11_190646_create_match_team_table',9),
(31,'2024_12_13_173118_add_type_to_quiz_questions_table',10),
(32,'2024_12_13_193559_rename_matches_to_games',11),
(33,'2024_12_13_194742_drop_match_team_table',12),
(34,'2024_12_13_194829_create_game_team_table',13);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `quiz_questions` */

DROP TABLE IF EXISTS `quiz_questions`;

CREATE TABLE `quiz_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_a` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_b` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_c` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_d` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_option` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quiz_questions` */

insert  into `quiz_questions`(`id`,`question`,`option_a`,`option_b`,`option_c`,`option_d`,`correct_option`,`type`,`created_at`,`updated_at`) values 
(1,'What does CPU stand for?','Central Processing Unit','Computer Personal Unit','Central Process Unit','Central Processor Unit','A','ict','0000-00-00 00:00:00','2023-12-16 13:38:15'),
(2,'Which programming language is known as the \"mother of all languages\"?','Java','C','Fortran','COBOL','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'What does HTML stand for?','Hyper Text Markup Language','Hyper Transfer Markup Language','Hyper Tool Markup Language','Hyperlink and Text Markup Language','A','ict','0000-00-00 00:00:00','2023-12-16 13:35:31'),
(5,'Which of the following is not a programming language?','Python','Java','HTML','CSS','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'What does the acronym URL stand for?','Universal Resource Locator','Uniform Resource Locator','Universal Remote Locator','Uniform Remote Locator','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'What is the main function of RAM in a computer?','To store the operating system','To store the user data','To store the computers clock','To store temporary data for the CPU','D','ict','0000-00-00 00:00:00','2023-12-16 14:16:34'),
(10,'In computer science, what does GUI stand for?','Graphical User Interface','General User Interface','Graphical Universal Interface','General Universal Interface','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'Which programming language was developed by Microsoft?','Java','Python','C#','Ruby','C','ict','0000-00-00 00:00:00','2023-12-16 14:13:22'),
(12,'What does CSS stand for in web development?','Counter Style Sheets','Computer Style Sheets','Colorful Style Sheets','Cascading Style Sheets','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'What is the purpose of the \"if\" statement in programming?','To declare a variable','To loop through a sequence','To make a decision','To define a function','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'Which company developed the first personal computer?','IBM','Microsoft','Apple','Intel','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'Which protocol is used to send emails?','HTTP','FTP','SMTP','TCP','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'What is the primary function of an operating system?','To run applications','To manage hardware resources','To store data','To browse the internet','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'Which programming language is often used for artificial intelligence and machine learning?','Java','C++','Python','Ruby','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'What is the purpose of the \"else\" statement in programming?','To start a loop','To handle exceptions','To define a function','To provide an alternative action','D','ict','0000-00-00 00:00:00','2023-12-16 13:20:36'),
(20,'What does SQL stand for?','Structured Language','Standardized Query Language','Sequential Query Language','Structured Query Language','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'Which of the following is a type of sorting algorithm?','Searching','Insertion','Encryption','Bubble','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'What is the file extension for a Microsoft Word document?','.docx','.txt','.pdf','.xlsx','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'What does API stand for?','Application Programming Interface','Advanced Programming Interface','Application Protocol Interface','Advanced Protocol Interface','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'What is the purpose of the \"for\" loop in programming?','To make a decision','To repeat a block of code a specific number of times','To define a function','To handle exceptions','B','ict','0000-00-00 00:00:00','2023-12-16 14:31:04'),
(25,'Which of the following is a programming paradigm?','IDE','OOP','CPU','URL','B','ict','0000-00-00 00:00:00','2023-12-16 14:04:35'),
(26,'What is the role of a compiler in programming?','To execute the program','To debug the program','To convert source code into machine code','To manage memory','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'Which data structure follows the Last In, First Out (LIFO) principle?','Queue','Stack','Array','Linked List','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'What is the purpose of the \"while\" loop in programming?','To repeat a block of code until a condition is met','To make a decision','To define a function','To handle exceptions','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'Which of the following is a network protocol used for secure data communication?','FTP','HTTP','SSH','UDP','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'What does DNS stand for?','Domain Name System','Dynamic Naming Service','Digital Network Service','Data Node System','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'Which programming language is commonly used for web development?','Java','C','Python','JavaScript','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'What is the default port for HTTP?','80','443','22','21','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'Which of the following is a markup language?','JSON','XML','YAML','CSV','B','ict','0000-00-00 00:00:00','2023-12-16 12:48:45'),
(35,'What is the purpose of the \"break\" statement in programming?','To end a loop prematurely','To start a loop','To define a function','To handle exceptions','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'Which data type is used to represent True or False in Python?','int','bool','str','float','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'What is the purpose of the \"git\" version control system?','To create graphical user interfaces','To manage source code versions','To design databases','To develop web applications','B','ict','0000-00-00 00:00:00','2023-12-16 12:40:24'),
(38,'Which of the following is a relational database management system?','MongoDB','MySQL','Redis','Cassandra','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'What is the role of an index in a database?','To organize data in alphabetical order','To speed up data retrieval operations','To encrypt data','To manage user authentication','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'What does IoT stand for?','Internet of Things','Input Output Technology','Information Overload Technology','Integrated Output Transfer','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'Which programming language is often used for game development?','Java','C#','Python','Ruby','B','ict','0000-00-00 00:00:00','2023-12-16 14:17:41'),
(42,'What is the purpose of the \"return\" statement in a function?','To print a value','To exit the program','To terminate a loop','To end the execution of a function and return a value','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'Which of the following is a cloud computing service?','Google Earth','Microsoft Office','Amazon Web Services','Adobe Photoshop','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'What does CSS3 introduce in web development?','New programming language','Database management system','Responsive web design features','Machine learning capabilities','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'What is the purpose of the \"continue\" statement in programming?','To skip the rest of the code in the loop and start the next iteration','To end the loop','To print a value','To define a function','A','ict','0000-00-00 00:00:00','2023-12-16 14:05:04'),
(46,'Which data structure is used to store elements in a LIFO order?','Queue','Stack','Array','Linked List','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'What is the role of a router in a computer network?','To connect devices within a local network','To connect different networks together','To store data temporarily','To manage user authentication','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'Which of the following is a non-relational database?','MySQL','MongoDB','SQLite','PostgreSQL','B','ict','0000-00-00 00:00:00','2023-12-16 14:22:21'),
(49,'What does CSS box model consist of?','Margin, Border, Padding, Content','Header, Footer, Main, Sidebar','Table, Row, Cell','Body, Head, Footer','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'What is the purpose of the \"sizeof\" operator in C programming?','To find the size of a file','To find the size of an array','To find the size of a variable or data type','To find the size of a function','C','ict','0000-00-00 00:00:00','2023-12-16 13:23:55'),
(51,'What is the significance of a 404 error in web development?','Server error','Page not found','Access denied','Syntax error','B','ict','0000-00-00 00:00:00','2023-12-16 14:09:35'),
(52,'What is the difference between HTML and XML?','HTML is used for data storage, while XML is used for markup','HTML is a markup language, while XML is a programming language','HTML is a strict syntax language, while XML is more flexible','HTML is used for web pages, while XML is used for data interchange','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'Which of the following is a client-server architecture model?','Peer-to-Peer','Client-Server','Bus Topology','Star Topology','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'What does DNS resolve into an IP address?','Domain Name Server','Digital Network System','Data Node Service','Domain Name System','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'Which programming language is often used for data analysis and statistics?','Java','R','C++','Python','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'Which of the following is a type of cyber attack?','Phishing','Sorting','Debugging','Decryption','A','ict','0000-00-00 00:00:00','2023-12-16 13:11:58'),
(57,'Which programming language was created by Guido van Rossum?','Java','C++','Python','Ruby','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'What is the primary function of the SQL SELECT statement?','To update records in a database','To insert records into a database','To query and retrieve data from a database','To delete records from a database','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'What is the difference between a function and a method in programming?','A function is a collection of methods','A method is a collection of functions','A function is a block of code that performs a specific task, while a method is a function associated with an object','There is no difference, and the terms are interchangeable','C','ict','0000-00-00 00:00:00','2023-12-16 13:10:46'),
(60,'What is the purpose of the \"NaN\" value in JavaScript?','Not a Negative number','Not a Null','Not a Number','Not a Node','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'Which data structure is used to implement a LIFO queue?','Stack','Queue','Linked List','Array','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'What is the purpose of the \"git commit\" command?','To create a new branch','To merge branches','To stage changes for the next commit','To commit changes to the version control system','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'What is the difference between TCP and UDP?','TCP is connection-oriented, while UDP is connectionless','TCP is faster than UDP','UDP is more reliable than TCP','There is no difference between TCP and UDP','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'What is the purpose of the \"CASE\" statement in SQL?','To define a new table','To update records in a table','To perform conditional logic in a query','To create an index','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'Which of the following is a valid type of join in SQL?','Left Turn','Right Jump','Inner Join','Outer Link','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'What does MVC stand for in the context of web development?','Model-View-Controller','Markup-Validation-Code','Multiple-Variable-Condition','Minimum-Viable-Code','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'Which of the following is a valid regular expression pattern?','[a-zA-Z]','2d{3}','^abc$','All of the above','D','ict','0000-00-00 00:00:00','2023-12-16 13:37:46'),
(68,'What is the purpose of the \"virtual\" keyword in C++?','To create a virtual machine','To define a virtual function in a base class','To allocate memory dynamically','To declare a variable','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'Which programming language is often used for mobile app development?','Java','C#','Swift','All of the above','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'What is the role of a firewall in computer networks?','To protect against viruses','To control access and filter network traffic','To store data temporarily','To manage user authentication','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'Which of the following is a scripting language for web development?','Java','C++','Python','All of the above','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,'Which of the following is an example of a front-end web development framework?','Django','React','Flask','Express','B','ict','0000-00-00 00:00:00','2023-12-16 13:34:48'),
(73,'What is the purpose of the \"Router\" in React?','To handle routes and navigation in a React application','To manage state in a React component','To style React components','To make API calls in a React application','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,'Which data structure is used to implement a FIFO queue?','Stack','Queue','Linked List','Array','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,'What is the purpose of the \"localStorage\" property in web browsers?','To store data locally on the user\'s browser','To access the server\'s file system','To manage browser history','To store data on the server','A','ict','0000-00-00 00:00:00','2023-12-16 14:39:17'),
(76,'What is the primary purpose of the \"alt\" attribute in an HTML image tag?','To specify the image source','To provide alternative text for screen readers','To define the image width and height','To style the image','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,'Which of the following is an example of a front-end JavaScript framework?','React','Express','Node.js','Django','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,'What does the acronym AJAX stand for in web development?','Asynchronous JavaScript and XML','Advanced JavaScript and XHTML','Automated JavaScript and XML','Asynchronous JSON and XHTML','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,'Which of the following is a valid SQL query to retrieve all records from a table named \"users\"?','SELECT * FROM users;','GET * FROM users;','SELECT ALL users;','RETRIEVE FROM users;','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,'What is the role of the \"super\" keyword in object-oriented programming?','To call the constructor of the parent class','To access a static method of the parent class','To define a new class','To create a new object','A','ict','0000-00-00 00:00:00','2023-12-16 13:06:14'),
(81,'Which of the following is a valid JavaScript data type?','undefined','None','NaN','All of the above','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,'What is the purpose of the \"git clone\" command?','To create a new branch','To clone a remote repository to the local machine','To commit changes to the version control system','To merge branches','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,'What does the acronym API stand for in the context of web development?','Automated Protocol Interface','Application Programming Interface','Advanced Programming Interface','Automated Programming Interface','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,'Which of the following is an example of a microservices architecture?','A monolithic application with tightly coupled components','A single server handling all requests','A system with multiple independent and modular services','A system with no services','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,'Which of the following is a valid HTML5 element for embedding video?','<video>','<media>','<film>','<play>','A','ict','0000-00-00 00:00:00','2024-12-13 19:08:44'),
(86,'What is the purpose of the \"this\" keyword in JavaScript?','To refer to the current object','To create a new object','To access a global variable','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,'What is the purpose of the \"cursor\" property in CSS?','To define the shape of the mouse cursor','To specify the size of an element','To create animation effects','To define the color of text','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,'Which of the following is a valid method for handling errors in JavaScript?','handleError()','try...catch','onError()','if (error)','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,'Which of the following is a valid HTML5 semantic element for grouping content?','<group>','<container>','<section>','<block>','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,'Which of the following is a valid CSS pseudo-class?',':hover',':animate',':expand',':active','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,'What is the purpose of the \"aria-label\" attribute in HTML?','To define a label for a form element','To define a label for an image','To provide accessibility information for screen readers','To specify a hyperlink','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,'What is the primary purpose of the \"data-*\" attributes in HTML?','To store data for JavaScript to access','To define the layout of the page','To create custom styles','To link external data files','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,'In object-oriented programming, what is encapsulation?','Hiding the implementation details of an object and exposing only what is necessary','Combining multiple objects into a single class','Creating an instance of an object','Defining the structure of a class','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,'Which of the following is a functional programming language?','Java','C++','Python','Haskell','D','ict','0000-00-00 00:00:00','2023-12-16 12:50:04'),
(95,'What is the purpose of the \"ALTER TABLE\" statement in SQL?','To add, modify, or drop columns in a table','To retrieve data from a table','To create a new table','To join two tables','A','ict','0000-00-00 00:00:00','2023-12-16 14:17:21'),
(96,'Which of the following is a valid JavaScript framework for building user interfaces?','TensorFlow','PyTorch','React','Angular','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,'In networking, what is a subnet mask used for?','To encrypt network traffic','To identify the network portion of an IP address','To prevent network attacks','To establish a secure connection','B','ict','0000-00-00 00:00:00','2023-12-16 13:09:38'),
(98,'What is the purpose of the \"break\" statement in a switch statement?','To terminate the entire loop','To exit the switch statement and continue with the next iteration of the loop','To create a new case','To create a fallthrough effect','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,'Which of the following is a valid HTTP status code for a successful request?','200 OK','404 Not Found','500 Internal Server Error','403 Forbidden','A','ict','0000-00-00 00:00:00','2023-12-16 13:36:29'),
(100,'Which programming language is often used for developing mobile applications for iOS?','Java','Swift','Objective-C','Kotlin','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,'Which of the following is a valid HTML5 semantic element for navigation?','<nav>','<menu>','<navi>','<navbar>','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,'What is the purpose of the \"ORM\" in software development?','Object-Relational Mapping, used to map objects to database tables','Online Resource Management, used to manage internet resources','Object Rendering Model, used to render graphics in applications','Offline Resource Monitoring, used to monitor offline resources','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,'Which of the following is a valid method for handling asynchronous code in JavaScript?','Promises','Loops','Switch statements','Try...Catch blocks','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,'What is the purpose of the \"cursor\" property in CSS?','To define the shape of the mouse cursor','To specify the size of an element','To create animation effects','To define the color of text','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,'Which of the following is a valid CSS pseudo-class?',':hover',':animate',':expand',':active','A','ict','0000-00-00 00:00:00','2023-12-16 14:43:12'),
(106,'What is the purpose of the \"fetch\" API in JavaScript?','To fetch data from a remote server','To create a new HTML element','To perform animations','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,'Which of the following is a type of machine learning?','Regression','Relational','Refraction','Rotation','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,'What is the purpose of the \"aria-label\" attribute in HTML?','To define a label for a form element','To define a label for an image','To provide accessibility information for screen readers','To specify a hyperlink','C','ict','0000-00-00 00:00:00','2023-12-16 14:02:54'),
(109,'What is the primary purpose of the \"data-*\" attributes in HTML?','To store data for JavaScript to access','To define the layout of the page','To create custom styles','To link external data files','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(110,'In computer networks, what does NAT stand for?','Network Authentication Technology','Network Address Translation','Network Application Testing','Network Access Token','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(111,'Which of the following is a valid method for handling a POST request in a web application?','GET','POST','PUT','DELETE','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(112,'What does C stand for in C programming?','Computer','Common','Central','Cray','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(113,'What does C stand for in C programming?','Computer','Common','Central','Cray','A','ict','0000-00-00 00:00:00','2023-12-16 13:05:14'),
(114,'Which of the following is not a valid C/C++ data type?','int','char','float-point','string','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(115,'What is the syntax for declaring a variable in C?','variableType variableName;','variableName variableType;','variableType = variableName;','variableName = variableType;','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(116,'What is the purpose of the \"printf\" function in C?','To input data','To perform mathematical calculations','To print data to the console','To create a loop','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(117,'How do you comment out a single line in C/C++?','// This is a comment','/* This is a comment */','# This is a comment','-- This is a comment','A','ict','0000-00-00 00:00:00','2024-12-13 17:23:54'),
(118,'Which operator is used for pointer dereferencing in C/C++?','*','&','->','.','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(119,'What is the purpose of the \"sizeof\" operator in C/C++?','To find the size of a file','To find the size of an array','To find the size of a variable or data type','To find the size of a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(120,'What is the correct syntax for a multi-line comment in C/C++?','/* This is a comment */','// This is a comment','-- This is a comment','/- This is a comment -/','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(121,'How do you declare a constant in C/C++?','constant const_name = value;','const_name = value;','const value const_name;','const datatype const_name = value;','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(122,'What is the purpose of the \"break\" statement in a loop?','To end the loop and continue with the next iteration','To create a new loop','To skip the rest of the code in the loop and start the next iteration','To define a function','A','ict','0000-00-00 00:00:00','2023-12-16 14:29:14'),
(123,'What is the default value of an uninitialized variable in C/C++?','0','1','Undefined','Null','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(124,'What is the correct syntax for a switch statement in C/C++?','switch (expression) { case 1: break; default: break; }','switch { case 1: break; default: break; }','switch (expression) { 1: break; default: break; }','switch (expression) { break; default: break; }','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(125,'What is the purpose of the \"continue\" statement in C/C++?','To end the loop','To print a value','To skip the rest of the code in the loop and start the next iteration','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(126,'What is the role of the \"const\" keyword in C/C++?','To define a constant','To declare a variable','To create a loop','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(127,'Which type of loop is suitable when you know the number of iterations in C/C++?','for loop','while loop','do-while loop','if statement','A','ict','0000-00-00 00:00:00','2023-12-16 13:22:56'),
(128,'What is the purpose of the \"scanf\" function in C?','To print data to the console','To perform mathematical calculations','To input data','To create a loop','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(129,'What does the \"++\" operator do in C/C++?','Increment by 1','Decrement by 1','Multiply by 2','Divide by 2','A','ict','0000-00-00 00:00:00','2023-12-16 12:38:44'),
(130,'How do you define a function in C/C++?','function_name(parameters) { // code }','function_name() { // code }','void function_name() { // code }','function_name(parameters) // code','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(131,'What is the purpose of the \"return\" statement in a function?','To end the function and return a value','To print a value','To create a loop','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(132,'Which operator is used for logical AND in C/C++?','&&','||','!','&','A','ict','0000-00-00 00:00:00','2023-12-16 13:38:43'),
(133,'How do you declare a pointer in C/C++?','datatype *pointer_name;','pointer_name *datatype;','pointer datatype pointer_name;','datatype pointer_name;','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(134,'What is the purpose of the \"free\" function in C/C++?','To free up memory allocated by malloc()','To create a loop','To end the function','To print data to the console','A','ict','0000-00-00 00:00:00','2023-12-16 14:14:12'),
(135,'Which function is used to dynamically allocate memory in C/C++?','malloc()','calloc()','realloc()','free()','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(136,'What is the purpose of the \"strcmp\" function in C/C++?','To compare two strings','To concatenate two strings','To find the length of a string','To convert a string to uppercase','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(137,'What is the purpose of the \"struct\" keyword in C/C++?','To declare a structure','To declare a variable','To define a function','To create a loop','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(138,'What is the purpose of the \"abs\" function in C/C++?','To find the absolute value of a number','To find the square root of a number','To round a number to the nearest integer','To perform bitwise AND operation','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(139,'What does the \"sizeof\" operator return in C/C++?','Size of a variable or data type in bytes','Size of a function','Size of an array','Size of a file','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(140,'Which of the following is a valid way to define a constant in C++?','const int PI = 3.14;','int PI = 3.14;','define PI 3.14','PI = 3.14;','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(141,'What is the purpose of the \"break\" statement in a switch statement?','To end the loop and continue with the next iteration','To create a new loop','To skip the rest of the code in the switch statement and exit','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(142,'Which of the following is the correct way to define a two-dimensional array in C?','int array[3][4];','int array[3, 4];','int array(3, 4);','int array[3]{4};','A','ict','0000-00-00 00:00:00','2023-12-16 14:08:34'),
(143,'What is the purpose of the \"const\" qualifier in function declarations?','To indicate that the function will not modify the parameter values','To indicate that the function is a constant','To define a constant','To indicate that the function is static','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(144,'Which keyword is used to declare a class in C++?','class','struct','void','main','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(145,'What is the purpose of the \"friend\" keyword in C++?','To declare a friend function','To declare a friend class','To define a function','To create a loop','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(146,'Which of the following is a valid way to initialize an array in C++?','int arr[] = {1, 2, 3, 4};','int arr() = {1, 2, 3, 4};','int arr{} = {1, 2, 3, 4};','int arr[4] = {1, 2, 3, 4};','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(147,'What is the purpose of the \"virtual\" keyword in C++?','To create a virtual machine','To define a virtual function in a base class','To allocate memory dynamically','To declare a variable','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(148,'What does the \"->\" operator do in C++?','Pointer dereferencing for class members','Logical AND operation','Logical OR operation','Pointer dereferencing for variables','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(149,'Which of the following is a correct way to define and initialize a constant in C++?','const int MAX = 100;','int const MAX = 100;','define MAX 100','MAX = 100;','A','ict','0000-00-00 00:00:00','2023-12-16 12:54:19'),
(150,'What is the purpose of the \"typeid\" operator in C++?','To find the type of an expression','To create a loop','To perform bitwise AND operation','To define a function','A','ict','0000-00-00 00:00:00','2023-12-16 12:46:25'),
(151,'What is the default access specifier for members of a class in C++?','public','private','protected','default','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(152,'What is the purpose of the \"cin\" object in C++?','To perform bitwise AND operation','To input data from the console','To output data to the console','To create a loop','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(153,'What is the purpose of the \"reinterpret_cast\" operator in C++?','To convert one pointer type to another','To perform type checking','To create a loop','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(154,'What is the purpose of the \"goto\" statement in C++?','To create a loop','To jump to a labeled statement in the code','To perform bitwise AND operation','To define a function','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(155,'What is the default file extension for Microsoft Word documents?','.doc','.txt','.pdf','.xls','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(156,'How do you save a document in Microsoft Word?','Ctrl + S','Ctrl + P','Ctrl + C','Ctrl + X','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(157,'Which tab is used to change the page layout in Microsoft Word?','Home','Insert','Page Layout','View','C','ict','0000-00-00 00:00:00','2023-12-16 12:46:59'),
(158,'What is the function of the \'Find and Replace\' feature in Microsoft Word?','To search for specific words or phrases in a document','To change the font style','To insert images','To create a table','A','ict','0000-00-00 00:00:00','2023-12-16 14:09:05'),
(159,'Which view allows you to see how your document will look when printed?','Normal','Print Layout','Web Layout','Outline','B','ict','0000-00-00 00:00:00','2023-12-16 14:03:53'),
(160,'What is the purpose of the \'Bullets\' and \'Numbering\' options in Microsoft Word?','To change the page orientation','To apply formatting to text','To create lists','To insert hyperlinks','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(161,'How do you change the font size in Microsoft Word?','Ctrl + B','Ctrl + I','Ctrl + U','Font size is not changed with keyboard shortcuts','D','ict','0000-00-00 00:00:00','2023-12-16 14:01:55'),
(162,'What does the \'Ctrl + Z\' keyboard shortcut do in Microsoft Word?','Undo','Redo','Cut','Copy','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(163,'Which ribbon tab in Microsoft Word contains options for formatting text?','Home','Insert','Page Layout','References','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(164,'What is the purpose of the \"Styles\" feature in Microsoft Word?','To change the font size','To apply predefined formatting to text','To insert images','To create a table','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(165,'How can you insert a page break in Microsoft Word?','Ctrl + Enter','Alt + Enter','Shift + Enter','Ctrl + Shift + Enter','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(166,'How do you align text to the right in Microsoft Word?','Ctrl + R','Ctrl + L','Ctrl + E','Ctrl + J','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(167,'What is the purpose of the \"Mail Merge\" feature in Microsoft Word?','To send emails directly from Word','To merge cells in a table','To create envelopes and labels','To create hyperlinks','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(168,'Which option allows you to see a preview of your document before printing in Microsoft Word?','Print Preview','Print Layout','Web Layout','Normal','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(169,'What is the purpose of the \"SmartArt\" feature in Microsoft Word?','To automatically correct spelling errors','To create visually appealing graphics','To apply advanced mathematical functions','To insert comments','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(170,'How do you change the line spacing in Microsoft Word?','Ctrl + 1','Ctrl + 2','Ctrl + 5','Ctrl + 0','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(171,'Which option is used to insert a table in Microsoft Word?','Insert Table','Table Layout','Table Design','Format Table','A','ict','0000-00-00 00:00:00','2023-12-16 14:28:25'),
(172,'What is the purpose of the \"Footnote\" feature in Microsoft Word?','To insert footers in a document','To add comments at the end of a page','To insert page numbers','To create hyperlinks','B','ict','0000-00-00 00:00:00','2023-12-21 10:11:19'),
(173,'Which keyboard shortcut is used to copy text in Microsoft Word?','Ctrl + C','Ctrl + X','Ctrl + V','Ctrl + Z','A','ict','0000-00-00 00:00:00','2023-12-16 13:06:42'),
(174,'What is the purpose of the \"Header\" and \"Footer\" options in Microsoft Word?','To change font style','To insert images','To add content at the top and bottom of each page','To create a table','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(175,'How do you change the page margins in Microsoft Word?','Page Layout > Margins','File > Page Setup','Format > Page Margins','Edit > Margins','A','ict','0000-00-00 00:00:00','2023-12-16 13:08:53'),
(176,'Which ribbon tab in Microsoft Word contains options for inserting pictures and shapes?','Insert','Home','Design','References','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(177,'What is the purpose of the \"Bookmark\" feature in Microsoft Word?','To mark important pages','To insert hyperlinks','To navigate between pages','To create a table','A','ict','0000-00-00 00:00:00','2024-12-13 18:57:20'),
(178,'How do you change the font color in Microsoft Word?','Font dialog box','Home > Font Color','Page Layout > Font Color','Format > Font','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(179,'What is the purpose of the \"Review\" tab in Microsoft Word?','To format text','To check spelling and grammar','To insert images','To create a table','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(180,'Which view in Microsoft Word displays the document as it will appear on the web?','Print Layout','Normal','Web Layout','Outline','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(181,'How do you create a bulleted list in Microsoft Word?','Pressing Tab key','Pressing Enter key','Pressing Ctrl + B','Pressing Ctrl + L','D','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(182,'What is the default file extension for Microsoft PowerPoint presentations?','.ppt','.doc','.xls','.pdf','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(183,'How do you start a slideshow in Microsoft PowerPoint?','F5','Ctrl + S','Alt + Enter','Shift + F','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(184,'Which tab is used to insert new slides in Microsoft PowerPoint?','Home','Insert','Design','Slide Show','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(185,'How can you apply a new theme to your entire presentation in Microsoft PowerPoint?','Design tab > Themes','Format tab > Theme','Slide Show tab > Theme','Home tab > Theme','A','ict','0000-00-00 00:00:00','2023-12-16 12:47:46'),
(186,'What is the purpose of the \"Slide Sorter\" view in Microsoft PowerPoint?','To format text','To check spelling and grammar','To rearrange slides','To insert hyperlinks','C','ict','0000-00-00 00:00:00','2023-12-16 13:33:47'),
(187,'How do you insert a new text box in Microsoft PowerPoint?','Insert tab > Text Box','Home tab > Text Box','Format tab > Text Box','Design tab > Text Box','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(188,'What is the purpose of the \"Animation Pane\" in Microsoft PowerPoint?','To apply transitions between slides','To organize slides','To view and manage animations on a slide','To insert comments','C','ict','0000-00-00 00:00:00','2023-12-16 14:29:54'),
(189,'How do you save a PowerPoint presentation?','Ctrl + S','Ctrl + P','Ctrl + C','Ctrl + X','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(190,'Which option allows you to view a presentation in full screen mode in Microsoft PowerPoint?','Slide Show > From Beginning','Slide Show > Custom Slide Show','View > Full Screen','Slide Show > Set Up Show','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(191,'What is the purpose of the \"Master Slide\" in Microsoft PowerPoint?','To apply animations','To create a table','To format text','To control the overall layout and formatting','D','ict','0000-00-00 00:00:00','2023-12-16 14:38:25'),
(192,'How do you duplicate a slide in Microsoft PowerPoint?','Ctrl + D','Ctrl + C','Ctrl + V','Ctrl + X','A','ict','0000-00-00 00:00:00','2023-12-16 14:23:52'),
(193,'What is the purpose of the \"Notes Page\" view in Microsoft PowerPoint?','To create speaker notes','To insert hyperlinks','To apply transitions','To format text','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(194,'How do you align text within a text box in Microsoft PowerPoint?','Format tab > Align','Home tab > Align','Slide Show tab > Align','Insert tab > Align','B','ict','0000-00-00 00:00:00','2023-12-16 13:22:25'),
(195,'Which view in Microsoft PowerPoint allows you to modify the layout of individual slides?','Slide Sorter','Normal','Slide Show','Slide Master','D','ict','0000-00-00 00:00:00','2023-12-16 13:08:17'),
(196,'What is the purpose of the \"SmartArt\" feature in Microsoft PowerPoint?','To apply animations between slides','To create visually appealing graphics','To insert hyperlinks','To create a table','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(197,'How can you add a sound effect to a slide transition in Microsoft PowerPoint?','Transition tab > Sound','Insert tab > Sound','Slide Show tab > Sound','Format tab > Sound','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(198,'What is the purpose of the \"Action\" feature in Microsoft PowerPoint?','To format text','To apply animations between slides','To insert hyperlinks','To create a table','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(199,'How do you change the slide layout in Microsoft PowerPoint?','Slide Show tab > Layout','Design tab > Layout','Home tab > Layout','Format tab > Layout','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(200,'Which keyboard shortcut is used to copy a slide in Microsoft PowerPoint?','Ctrl + C','Ctrl + X','Ctrl + V','Ctrl + D','D','ict','0000-00-00 00:00:00','2023-12-16 14:41:41'),
(201,'What is the purpose of the \"Outline\" view in Microsoft PowerPoint?','To create speaker notes','To insert hyperlinks','To view and edit the text of a presentation','To create animations','C','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(202,'How can you apply a transition to all slides in Microsoft PowerPoint?','Select all slides > Transition tab','Select all slides > Home tab','Select all slides > Design tab','Select all slides > Slide Show tab','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(203,'What is the purpose of the \"Grid and Guides\" feature in Microsoft PowerPoint?','To apply animations between slides','To insert hyperlinks','To align objects on a slide','To create a table','C','ict','0000-00-00 00:00:00','2024-12-13 18:57:14'),
(204,'How do you change the background color of a slide in Microsoft PowerPoint?','Design tab > Background Color','Home tab > Background Color','Slide Show tab > Background Color','Format tab > Background Color','D','ict','0000-00-00 00:00:00','2023-12-16 14:23:15'),
(205,'Which ribbon tab in Microsoft PowerPoint contains options for formatting text?','Home','Insert','Design','Slide Show','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(206,'What is the purpose of the \"Speaker Notes\" in Microsoft PowerPoint?','To format text','To add comments for the presenter','To apply animations between slides','To create a table','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(207,'How do you insert a hyperlink in Microsoft PowerPoint?','Insert tab > Hyperlink','Home tab > Hyperlink','Design tab > Hyperlink','Slide Show tab > Hyperlink','A','ict','0000-00-00 00:00:00','2023-12-16 14:14:51'),
(208,'What is the purpose of the \"Handout Master\" in Microsoft PowerPoint?','To create handouts for the audience','To format text','To apply animations','To create a table','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(209,'How do you insert a chart in Microsoft PowerPoint?','Insert tab > Chart','Home tab > Chart','Design tab > Chart','Slide Show tab > Chart','A','ict','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(210,'What is the purpose of the \"Format Painter\" in Microsoft PowerPoint?','To apply animations between slides','To copy and apply formatting to text','To insert hyperlinks','To create a table','B','ict','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `rating_options` */

DROP TABLE IF EXISTS `rating_options`;

CREATE TABLE `rating_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rating_value` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rating_options` */

insert  into `rating_options`(`id`,`rating_value`,`description`,`created_at`,`updated_at`) values 
(1,1,'Strongly Disagree',NULL,NULL),
(2,2,'Disagree',NULL,NULL),
(3,3,'Neutral',NULL,NULL),
(4,4,'Agree',NULL,NULL),
(5,5,'Strongly Agree',NULL,NULL);

/*Table structure for table `teams` */

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `teams` */

insert  into `teams`(`id`,`name`,`description`,`created_at`,`updated_at`) values 
(1,'CtrlShifters',NULL,'2024-12-10 18:49:11','2024-12-10 18:49:11'),
(2,'ByteBlasters','Nasir, Imran, Shahzaib, Maaz','2024-12-10 18:50:21','2024-12-14 09:11:28'),
(3,'TeamCoder',NULL,'2024-12-10 18:51:01','2024-12-10 18:51:01'),
(4,'CodeMaster','Nasir, Imran','2024-12-14 09:12:00','2024-12-14 09:12:00');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
