-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2022 at 07:57 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearniv_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
('1e6ad2ce-497d-4dbc-9325-0209a5ad541d', 'Design', 'design', '2022-08-16 06:41:35', '2022-08-16 06:41:35'),
('3b0eebe9-c3a9-4250-be93-40b58ee1d40c', 'Health & Fitness', 'health-fitness', '2022-08-16 06:42:28', '2022-08-16 06:42:28'),
('6387f943-49ac-48c9-b270-afda93feb165', 'Lifestyle', 'lifestyle', '2022-08-16 06:41:59', '2022-08-16 06:41:59'),
('6fe00827-7c90-48e9-bf3e-7e2591f97ec8', 'Office Productivity', 'office-productivity', '2022-08-16 06:40:53', '2022-08-16 06:40:53'),
('7049c68c-584e-4934-807f-2bf17f3fabfe', 'Photography & Video', 'photography-video', '2022-08-16 06:42:13', '2022-08-16 06:42:13'),
('763283f5-3076-4b06-acba-e33d1f2a0db7', 'Development', 'development', '2022-08-16 06:39:49', '2022-08-16 06:39:49'),
('8955ae82-ba74-4435-8ff5-e52f76594ece', 'Personal Development', 'personal-development', '2022-08-16 06:41:23', '2022-08-16 06:41:23'),
('92f8ccf1-384e-4c27-b429-a1bce510a1cc', 'Music', 'music', '2022-08-23 06:15:16', '2022-08-23 06:15:16'),
('9757989d-24a0-42b7-ab56-11673f671800', 'Marketing', 'marketing', '2022-08-16 06:41:46', '2022-08-16 06:41:46'),
('9ae93b15-0ec2-4b42-ab02-337d0e91eaa0', 'Teaching & Academics', 'teaching-academics', '2022-08-16 06:42:55', '2022-08-16 06:42:55'),
('aca10dcc-c359-4b8d-acaf-d016898d65fa', 'Finance & Accounting', 'finance-accounting', '2022-08-16 06:40:16', '2022-08-16 06:40:16'),
('c54a81fe-9947-4ede-80f7-5b924bb1fa20', 'Business', 'business', '2022-08-16 06:40:03', '2022-08-16 06:40:03'),
('e532600c-8db4-41bd-8eb4-36b5cf67fc49', 'IT & Software', 'it-software', '2022-08-16 06:40:39', '2022-08-16 06:40:39');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `active_for_full_site` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `exp_date`, `status`, `deleted_at`, `active_for_full_site`, `created_at`, `updated_at`) VALUES
('9f11c018-282a-4777-a02f-2d33f29d9d8f', 'FRIDAY10', 10, NULL, 1, NULL, 0, '2022-09-15 07:37:21', '2022-09-15 12:33:35'),
('ce64e1d5-abd4-494a-ab9c-ae76c23a9e68', 'DFFD54', 50, NULL, 1, NULL, 1, '2022-09-15 12:17:48', '2022-09-15 12:33:35'),
('f5f87fa2-9728-4778-9f1b-5bb224c643a7', 'BLACK22', 50, NULL, 1, NULL, 0, '2022-09-15 07:31:50', '2022-09-15 12:33:35');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8_unicode_ci,
  `overview` text COLLATE utf8_unicode_ci,
  `latest_price` float DEFAULT NULL,
  `before_price` float DEFAULT NULL,
  `lessons` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_time` enum('Lifetime','Three Months','Six Months','1 Year') COLLATE utf8_unicode_ci DEFAULT 'Lifetime',
  `requirements` text COLLATE utf8_unicode_ci,
  `what_you_will_learn` text COLLATE utf8_unicode_ci,
  `who_is_this_course_for` text COLLATE utf8_unicode_ci,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `catId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `in_home_page` tinyint(1) DEFAULT '0',
  `in_home_page_set_at` datetime DEFAULT NULL,
  `is_class` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `slug`, `short_desc`, `overview`, `latest_price`, `before_price`, `lessons`, `duration`, `image`, `access_time`, `requirements`, `what_you_will_learn`, `who_is_this_course_for`, `userId`, `catId`, `approved`, `in_home_page`, `in_home_page_set_at`, `is_class`, `created_at`, `updated_at`) VALUES
('130bcd58-0650-4efe-a401-dc949373c699', 'Linux Administration Bootcamp: Go from Beginner to Advanced', 'linux-administration-bootcamp-go-from-beginner-to-advanced', 'Hello. My name is Admin Cannon and I\'m the author of Linux for Beginners, the founder of the Linux Training Academy, and an instructor to thousands of satisfied students. I started my IT career in the late 1990\'s as a Unix and Linux Systems Engineer and I\'ll be sharing my real-world Linux experience with you throughout this course.', '<p>By the end of this course you will fully understand the most important and fundamental concepts of Linux server administration. More importantly, you will be able to put those concepts to use in practical real-world situations. You\'ll be able to configure, maintain, and support a variety of Linux systems. You can even use the skills you learned to become a Linux System Engineer or Linux System Administrator.</p><p><br></p><p><strong>Free Bonus&nbsp;- Video Demonstrations from my best-selling book, C<em>ommand Line Kung-Fu</em>.</strong></p><p>In this series of videos I\'ll be sharing with you some of my favorite Linux command line tricks. These tips will make your life easier at the command line, speed up your work flow, and make you feel like a certified Linux command line Ninja! If you want to see the pages of&nbsp;<em>Command Line Kung-Fu&nbsp;</em>come to life, then you have to watch these videos!</p>', 9.99, 84.99, '76', '9h total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246066/r56386ipf0e55vcjtg3d.jpg', '1 Year', '<ul><li>A desire to learn.</li></ul>', '<ul><li>By the end of this course you will understand the fundamentals of the Linux operating system and be able to apply that knowledge in a practical and useful manner.</li></ul>', '<ul><li>People with limited time.</li><li>Anyone with a desire to learn about Linux.</li><li>People that have Linux experience, but would like to learn about the Linux command line interface.</li><li>Existing Linux users that want to become power users.</li><li>People that need Linux knowledge for a personal or business project like hosting a website on a Linux server.</li><li>Professionals that need to learn Linux to become more effective at work. Helpdesk staff, application support engineers, and application developers that are required to use the Linux operating system.</li><li>People thinking about a career as a Linux system administrator or engineer, but need the basics first.</li><li>Researchers, college professors, and college students that will be using Linux servers to conduct research or complete course work.</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 0, NULL, 0, '2022-08-23 09:14:27', '2022-08-23 09:18:18'),
('142a183d-45f1-4447-9aad-64f736471988', 'AWS Certified Security Specialty 2022', 'aws-certified-security-specialty-2022', 'AWS Certified Security - Specialty certification is one of the widely recognized security certifications across the industry. With the number of security breaches increasing every year, there is a huge demand for individuals who understands the security side of things, specifically Cloud-based Infrastructures.', '<p>This course is specially designed for the aspirants who intend to give the AWS Certified Security Specialty 2022 certification as well for those who want to master the security side of AWS.</p><p>Throughout the course, we explore various Real World scenarios and look into why do website gets hacked, what could have been done to prevent it, and learn the best practices related to Security for your AWS environment.</p><p>Since this is a Specialty level certification, it is very important that the candidate has a prior hands-on experience in AWS, and this also acts as a pre-requisite to this certification. We do start our journey into the security side of things from scratch.</p><p>With tons of quizzes in order to prepare you for exams, Real-world scenarios, and great Support from our Instructor in-case of doubts, this course is all you need to master the Security side of AWS and gain the certification.</p><p>I look forward to seeing you join us in this exciting journey on&nbsp;AWS&nbsp;Security.</p>', 34.99, 0, '251', ' 28h 7m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660635363/e12ibezdvwzr9kbqn3ey.jpg', 'Lifetime', '<ul><li>Basics of AWS</li><li><br></li><li>AWS Solutions Architect Associate or Equivalent Knowledge</li></ul><p><br></p>', '<ul><li>Will be prepared to give AWS Certified Security Specialty Exam</li><li><br></li><li>You will be able to Master the Security aspect of AWS</li><li><br></li><li>Gain deep insights about Enterprise grade Security implementation.</li><li><br></li><li>Will be able to detect attacks and protect the AWS infrastructure from Hackers.</li></ul><p><br></p>', '<ul><li>Those interested in gaining the AWS Security Specialty Certification</li><li>Those who wants to gain deep security insights related to AWS</li></ul><p><br></p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 0, NULL, 0, '2022-08-16 07:36:03', '2022-08-16 09:52:24'),
('308cdeb3-b61f-4fca-a139-9bb219282dd3', 'Complete workout : Complete Fitness Certification', 'complete-workout-complete-fitness-certification', 'Complete workout for Fitness, Weight loss, Weight gain, & Body Building ,Get Certification After completion!', '<p>Complete Workout&nbsp;For Weight Loss &amp; Muscle Building</p><p>In this course I will take you through the process of&nbsp;<strong>becoming a fitness expert step by step</strong>. You will learn everything you need to know about the fundamentals of good training programs and how to design your very own program for you or your clients.</p><p>I created this course for stay-at-home moms, college students, and anybody passionate about health and fitness who wants to create extra income or make a living doing what they love… fitness!</p><p><strong><em>Complete workout for Fitness, Weight loss, Weight gain, &amp; Body Building</em></strong></p><p>By the end of this course you will get Fitness Certification from Institute of Pakistan!</p><p>· Learn weight loss for real &amp; forever in A simple Manner</p><p>· How to lose weight very fast</p><p>· Improved fitness through exercise</p><p>· We will learn how we can contour our body shape</p>', 39.99, 50, '50', '3h 25m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321768/dqnthzwooovl3fl0vamu.jpg', 'Lifetime', '<ul><li>Passion for fitness</li><li>Commitment to complete the course</li><li>Access To Gym and Gym Equipment</li><li>Comfortable clothes and shoes</li></ul>', '<ul><li>We will learn how to do correctly warm up</li><li>We will learn why warm up is important</li><li>Improved fitness through exercises</li><li>We will learn how we can contour our body shape</li></ul><p><br></p>', '<ul><li>This course are for those who want to live life with fitness</li><li>This course are for those who want to know about simple &amp; easy exercises</li><li>This course is for those who want to make a change in their lifestyle.</li><li>This course is for those who want to lose thigh or hip fat, belly fat, side or love handles</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '3b0eebe9-c3a9-4250-be93-40b58ee1d40c', 1, 0, NULL, 0, '2022-08-24 06:16:08', '2022-08-24 06:21:11'),
('3118e959-37af-453b-889b-e3006446127a', 'The Complete Introduction To Accounting and Finance', 'the-complete-introduction-to-accounting-and-finance', 'I have been teaching on Udemy since 2011 (over 10 years) and have created 88 courses on Udemy with 100,000+ students!  I love teaching on online, and empowering students with knowledge in accounting, finance, entrepreneurship, Excel and other business topics. ', '<p><strong>Welcome Students,</strong></p><p><br></p><p>I have been teaching on Udemy since 2011 (over 10 years)&nbsp;and have created&nbsp;88&nbsp;courses on Udemy with 100,000+ students!&nbsp;I&nbsp;love teaching on online, and empowering students with knowledge in accounting, finance, entrepreneurship, Excel and other business topics.&nbsp;</p><p>In my day to day life, I work as a consulting CFO,&nbsp;Chief Financial Officer.&nbsp;Mainly I&nbsp;work with growth stage companies, helping them put in place all the best accounting practices, financial modelling, working with investors, and financial reporting and analysis.&nbsp;&nbsp;</p><p>I have worked as a CFO exclusively to growing companies for 10+&nbsp;years, bringing my past corporate experience, my passion for the entrepreneur community, and experience helping over 100+ startups succeed.</p><p><strong>Now let me take my knowledge and experience and teach you!</strong></p><p><strong>All courses come with lifetime access, friendly support if you get stuck&nbsp;and a&nbsp;30 day money-back&nbsp;guarantee&nbsp;so there\'s no risk to get started.</strong></p><p>See you in class.</p>', 17.99, 89.99, '79', '8h 37m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634620/dcqfowcf3z07sqgsud0e.jpg', 'Lifetime', '<ul><li>Desire to learn accounting &amp; finance</li><li><br></li><li>Access to Excel or other spreadsheet program</li><li><br></li><li>Passion to empower yourself with knowledge</li><li><br></li><li>Commitment to learning</li></ul><p><br></p>', '<ul><li>Learn From A Top Rated Instructor Who Has Been Teaching On Udemy Since 2013 and Taught Over 100,000 Students!</li><li><br></li><li>Understand Basic Accounting Concepts</li><li><br></li><li>Accounting Terminology</li><li><br></li><li>Accounting Fundamentals</li><li><br></li><li>The Audit Process</li><li><br></li><li>The Accounting Cycle</li><li><br></li><li>Debits and Credits</li><li><br></li><li>Accounts Receivable</li><li><br></li><li>Accounts Payable</li><li><br></li><li>Forecasting and Budgeting</li></ul><p><br></p>', '<ul><li>Startups</li><li>Small Business</li><li>Entrepreneurs</li><li>CEO\'s</li><li>CFO\'s</li><li>Accountants</li><li>Bookkeeper</li><li>And anyone else who wants to learn more about accounting and finance</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'aca10dcc-c359-4b8d-acaf-d016898d65fa', 1, 0, NULL, 0, '2022-08-16 07:23:41', '2022-08-16 07:25:59'),
('410d35f5-2fa9-456a-8f8b-0599c1eb45e1', 'How to Run truly Productive Meetings – and add value', 'how-to-run-truly-productive-meetings-and-add-value', 'There don’t seem to be managers that can run good meetings – let alone great ones. ‘Pointless Meetings’ is the joint number one time-waster for business people, according to the Microsoft Office Productivity global survey.\n\nAs for interest and engagement - nearly three quarters of us try doing our own personal work during meetings. The true cost of meetings is often hidden. But not anymore. As well as showing you how to facilitate meetings, it gives great protocols for the whole team and for all types of meetings.', '<p>The principles have been tried and tested in classroom training courses in UK, Scandinavia, Iceland and North Africa, in a mix of global businesses.</p><p>The short summaries give you the basics, literally, in minutes. The 12 videos and accompanying book are structured in short, 5 minute sections - and you can keep improving from the greater detail whenever you want.</p><p>If you’re a first time manager, team leader, or business operator and you’re fed up with the time and cost wasted in meetings – click on the link and make meetings work FOR you.</p><p><br></p>', 9.99, 49.99, '15', '2h 20m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246498/gviacpl4bb55gp6r4dal.jpg', 'Lifetime', '<ul><li>Download and read the workbook</li></ul>', '<ul><li>By the end of the course you will be able to facilitate meetings that add unquestionable value</li><li>You’ll save your colleagues from frustration and give them back their time</li><li>You’ll save your organisation money</li></ul>', '<ul><li>Mangers who call or run meetings</li><li>Managers who attend meetings</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '8955ae82-ba74-4435-8ff5-e52f76594ece', 1, 0, NULL, 0, '2022-08-23 09:21:38', '2022-08-23 09:27:27'),
('5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'Fitness-Yoga-Pilates Combined - Quick Home Workout Program', 'fitness-yoga-pilates-combined-quick-home-workout-program', '21 Days Home Workout based on Fitness, Yoga and Pilates principles for fat loss and backpain aid with your own weight', '<p>Let me ask you a few questions ;</p><p><br></p><p><br></p><p>-Are you happy with the&nbsp;<strong>extra pounds&nbsp;</strong>you\'re carrying around ?</p><p>-Are you happy with your&nbsp;<strong>well-being</strong>&nbsp;?</p><p>-Do you wanna know what is it feel like to wake up without<strong>&nbsp;back pain</strong>&nbsp;and fully&nbsp;<strong>energized&nbsp;</strong>?</p><p>-Have you ever thought why you can\'t&nbsp;<strong>lose weight&nbsp;</strong>?</p><p>-Maybe you\'ve asked yourself&nbsp;<strong>why</strong>&nbsp;do I&nbsp;<strong>skip</strong>&nbsp;workouts after a while&nbsp;?</p><p><br></p><p><strong>I`ve been there</strong>&nbsp;:)</p><p><br></p><p>What if I told you there\'s one thing , just one thing that can help you to change your current situation?</p><p><br></p><p>-<strong>IF</strong>&nbsp;you can spend 25 minutes , 3 times a week,</p><p>-<strong>IF</strong>&nbsp;you want to see difference in short period of time and will motivate you,</p><p>-<strong>IF</strong>&nbsp;you can follow a dietary program that won\'t put you on starving,</p>', 99.99, 499, '21', '5h 35m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321538/yqgwrfjoee4dcqxfiaon.jpg', 'Lifetime', '<ul><li>No experience needed , just you and your mat !</li></ul>', '<ul><li>Quick and Efficient Home Workout !</li><li>Feel Strong and Lose Fat With Bodyweight Exercises !</li><li>Improve Your Core Strength, Upper Body Strength and Your Legs and Booty !</li></ul>', '<ul><li>People claims themself as lazy and have limited time</li><li>People works 8 to 5 in office, on computer all the time</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '3b0eebe9-c3a9-4250-be93-40b58ee1d40c', 1, 0, NULL, 0, '2022-08-24 06:12:19', '2022-08-24 06:21:11'),
('72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', 'Software Project Management For Start-ups And Solopreneurs', 'software-project-management-for-start-ups-and-solopreneurs', 'Software project management for start-ups, small businesses & entrepreneurs using Trello. Especially if hire freelancers.', '<p>If you are a solopreneur or a small business owner, learn project management fundamentals for small businesses, and complete your projects successfully, on time, and on budget.</p><p><br></p><ul><li>Learn business prioritization and decision-making</li><li>Learn to use Trello productivity and project management software</li><li>Hire the best freelancers and make sure they deliver successful projects</li><li>Master early team building</li></ul>', 9.99, 39.99, '38', '2h 6m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661320575/fjhd3tt5e4mtcuf2pzte.jpg', 'Lifetime', '<ul><li>You should be a solo entrepreneur who is hiring online freelancers and looking to improve your project management skills</li></ul>', '<ul><li>Have your products go more smoothly, on time and on budget</li><li>Understand different software project management methodologies so you can use the right one for your project</li></ul><p><br></p>', '<p><br></p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '763283f5-3076-4b06-acba-e33d1f2a0db7', 1, 0, NULL, 0, '2022-08-24 05:56:16', '2022-08-24 06:21:13'),
('742d231f-2d5b-42b6-993e-1edeba676f45', 'Pianoforall - Incredible New Way To Learn Piano & Keyboard', 'pianoforall-incredible-new-way-to-learn-piano-keyboard', 'Learn Piano in WEEKS not years. Play-By-Ear & learn to Read Music. Pop, Blues, Jazz, Ballads, Improvisation, Classical', '<p><strong>Pianoforall is one of the most popular online piano courses with over 300,000 students worldwide</strong></p><p>Now ANYONE Can Learn Piano or Keyboard</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Imagine being able to sit down at a piano and just PLAY - Ballads,&nbsp;Pop, Blues, Jazz, Ragtime, even amazing Classical pieces? Now you can...&nbsp;and you can do it in months not years without wasting money, time and&nbsp;effort on traditional Piano Lessons.&nbsp;</p><p><strong>An Incredible Set of&nbsp;Videos and ebooks (9 books, 600 pages)</strong></p>', 49.99, 145, '426', '38h 17m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321986/le4vkqoanexsuajpdmb9.jpg', 'Lifetime', '<ul><li>You don\'t need any prior knowledge or experience</li><li>Pianoforall works equally well on Piano or Keyboard</li><li>You only need to practice 20 minutes a day to make rapid progres</li></ul>', '<ul><li>Pianoforall will take complete beginners to an intermediate level in a very short space of time</li><li>You get to sound like a pro right from the start</li></ul>', '<ul><li>Suitable for all ages - from teens onwards (not for young kids)</li><li>Perfect for people who want to be able to just sit down at a piano and just amaze everyone.</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '92f8ccf1-384e-4c27-b429-a1bce510a1cc', 1, 0, NULL, 0, '2022-08-24 06:19:47', '2022-08-24 06:21:10'),
('75555389-1085-44b9-9dfb-524c3bdafff0', 'Automate the Boring Stuff with Python Programming', 'automate-the-boring-stuff-with-python-programming', 'If you\'re an office worker, student, administrator, or just want to become more productive with your computer, programming will allow you write code that can automate tedious tasks. This course follows the popular (and free!) book, Automate the Boring Stuff with Python.', '<p>Automate the Boring Stuff with Python was written for people who want to get up to speed writing small programs that do practical tasks as soon as possible. You don\'t need to know sorting algorithms or object-oriented programming, so this course skips all the computer science and concentrates on writing code that gets stuff done.</p><p>This course is for complete beginners and covers the popular Python programming language. You\'ll learn basic concepts as well as:</p><ul><li>Web scraping</li><li>Parsing PDFs and Excel spreadsheets</li><li>Automating the keyboard and mouse</li><li>Sending emails and texts</li><li>And several other practical topics</li></ul>', 49.99, 99.99, '21', '13h 18m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1663504881/d2lshczuny7rcvbbguij.jpg', 'Lifetime', '<ul><li>No programming experience is required.</li><li>Downloading and installing Python is covered at the start of the course.</li><li>Basic computer skills: surfing websites, running programs, saving and opening documents, etc.</li></ul>', '<ul><li>Automate tasks on their computer by writing simple Python programs.</li><li>Write programs that can do text pattern recognition with \"regular expressions\".</li><li>Programmatically generate and update Excel spreadsheets</li></ul>', '<ul><li>Office workers, students, small/home business workers, and administrators would want to improve their productivity.</li><li>Aspiring software engineers who want to add skills to their programming toolbelt.</li><li>Computer users who have heard the \"learn to code\" message, but want practical reasons to learn programming.</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4d', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 0, NULL, 0, '2022-09-18 12:41:22', '2022-09-18 12:43:58'),
('a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'Business Bootcamp: 7 Weeks to Start Your Own Business', 'business-bootcamp-7-weeks-to-start-your-own-business', 'I\'ll teach you the skills necessary to stand out from the crowd. Whether it’s a personal passion or a business pursuit, you can learn video, photography, art, design, marketing skills and more here.', '<p><strong><em>Learn creative&nbsp;skills, from&nbsp;absolute beginner&nbsp;to advanced mastery.&nbsp;</em></strong></p><p><br></p><p>Video School&nbsp;exists to help you succeed in life. Each course has been hand-tailored to teach a specific skill from photography and video to art, design and business.</p><p><strong><em>Whether you’re trying to learn a new skill&nbsp;from scratch, or want to refresh your memory on something you’ve learned in the past, you’ve come to the right place.</em></strong></p><p>Education makes the world a better place. Make your world better with new skills!</p><p>Our courses can be watched 24/7 wherever you are. Most are fully downloadable so you can take them with you. You can also view them on mobile devices with the Udemy mobile app.</p><p>All&nbsp;courses have a 30-day money-back guarantee so that you can check it out, make sure it’s the right course for you, and get a refund if it’s not!</p>', 16.99, 84.99, '52', '6h 33m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634163/icvgops1gqcosgv3dxde.jpg', 'Lifetime', '<ul><li>Students taking this class will be walked through the entire process of creating a business from scratch, so you do not need to do anything before this course begins. It will help you to already know some skills and ideas for a business that you would enjoy running.</li><li><br></li></ul><p><br></p>', '<ul><li>Start your own business with any skill or passion of yours</li><li><br></li><li>Choose your most profitable skill</li><li><br></li><li>Define your target audience &amp; compete with other businesses</li><li><br></li><li>Build your online presence with a website, portfolio, testimonials, and social media profiles</li><li><br></li><li>Find your first clients (and your next ones)</li><li><br></li><li>Manage a business (finances, taxes, expenses, etc.)</li></ul><p><br></p>', '<ul><li>You should take this course IF YOU ARE A COMPLETE BEGINNER, and have never created a business of your own</li><li>You should take this course if you want to be a successful freelancer doing something you love</li><li>You should take this course if you want to scale up your freelance business to an incorporated business</li><li>You should not take this course if you don\'t want to spend the next 7+ weeks working on your business</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'c54a81fe-9947-4ede-80f7-5b924bb1fa20', 1, 1, '2022-08-16 07:17:56', 0, '2022-08-16 07:16:04', '2022-08-16 07:17:56'),
('a4417872-960c-4d9d-9b4c-b05bbc9c4c01', 'Agile Project Management', 'agile-project-management', 'Grow your business, get a raise, finish your IT project under budget with Agile! Learn from a successful executive.', '<p>Welcome to the only course on Udemy to feature a&nbsp;<strong><em>real Fortune 500 CIO&nbsp;</em></strong>and a&nbsp;<strong><em>Scrum trainer</em></strong>&nbsp;and when you are complete Udemy will issue you a certification of completion.</p><p><br></p><p>In this&nbsp;<strong><em>one of a kind course</em></strong>&nbsp;you will learn secrets of better Agile from a real executive with years of experience leading an enterprise IT team.&nbsp;These are the secrets executive normally don\'t share.&nbsp;</p><p>Have you ever been confused by Scrum or transformation efforts?&nbsp;Have you felt disconnected from your work and confused about what you doing?&nbsp;Most workers don\'t understand how their contribution influences a large project.&nbsp;</p>', 11.99, 99.99, '13', ' 1h 28m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321260/rs8f8ublor5skh7lpce0.jpg', 'Lifetime', '<ul><li>A basic understanding of agile is useful but not required</li><li>A basic knowledge of Scrum is useful but not required</li><li>A basic knowledge of IT is useful but not required</li></ul>', '<ul><li>How to lead like a Fortune 500 Executive</li><li>How to lead an Agile team like a proven executive</li><li>IT leadership</li></ul><p><br></p>', '<ul><li>IT professionals</li><li>Tech entrepreneurs</li><li>Tech founders</li><li>Agile leaders</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '6fe00827-7c90-48e9-bf3e-7e2591f97ec8', 1, 0, NULL, 0, '2022-08-24 06:07:41', '2022-08-24 06:21:12'),
('bf330a2e-d308-4e3d-a437-7c0ec31f037e', 'Ruby on Rails 2022 Live Class', 'ruby-on-rails-2022-live-class', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</p><p><strong style=\"color: rgb(32, 33, 36);\">Hours:&nbsp;</strong></p><p><strong>Sunday 5AM – 6AM</strong></p><p>Monday <strong style=\"color: rgb(96, 96, 96);\">5AM – 6AM</strong></p><p>Tuesday <strong style=\"color: rgb(96, 96, 96);\">5AM – 6AM</strong></p><p>Wednesday <strong style=\"color: rgb(96, 96, 96);\">5AM – 6AM</strong></p><p>Thursday <strong style=\"color: rgb(96, 96, 96);\">5AM – 6AM</strong></p><p>Friday <strong style=\"color: rgb(96, 96, 96);\">5AM – 6AM</strong></p><p>Saturday <strong style=\"color: rgb(96, 96, 96);\">5AM – 6AM</strong></p>', 99.99, 149.99, '20', '2 Weeks', 'https://res.cloudinary.com/dev-empty/image/upload/v1664091595/dlttlfepqs2nxi58lmi7.jpg', 'Lifetime', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 0, NULL, 1, '2022-09-25 05:08:38', '2022-09-25 07:39:55'),
('c5c6ee66-84df-46ee-b961-70a3ca173972', 'Learn Time Management, Get Organized & Get Everything Done', 'learn-time-management-get-organized-get-everything-done', 'Frustrated? Nothing gets done and more work piles up? Exhausted? Need to make time for yourself? Do you feel trapped by your hectic schedule? Are things still on your list at the end of the day or the week or even the month?', '<p>&nbsp;Learn to take control of your priorities, set the right goals, and plan your time to live your dreams</p><p>• Learn how to overcome procrastination</p><p>• Learn your personality type and how it affects the way you spend your time</p><p>• Learn how to take control of your schedule</p>', 9.99, 84.99, '5', '50m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246756/p63jr4iep9q2jeia6esv.jpg', 'Lifetime', '<ul><li>A busy schedule that doesn’t let you achieve what you want out of life</li></ul><p><br></p>', '<ul><li>By the end of the course you will know how to take control of your priorities, set the right goals, and plan your time to achieve your dreams</li><li>Learn how to overcome procrastination</li><li>Understand what you’ve put on your to-do list</li></ul>', '<ul><li>Business people who want to achieve their goals</li><li>Anyone who wants to take the stress out of their schedule</li></ul>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '8955ae82-ba74-4435-8ff5-e52f76594ece', 1, 0, NULL, 0, '2022-08-23 09:25:57', '2022-08-23 09:27:26'),
('d92f38eb-e616-414c-be0c-54e79a6809c7', 'Node.js for Beginners - Become a Node js Developer', 'nodejs-for-beginners-become-a-node-js-developer', 'I don\'t know about you,but regular classes bore me, and that is why on this Node.js course we make it fun to learn LOTS of cool things. This course is meant for total beginners in the NodeJs world. ', '<p><strong>What is NODEjs or Node.js ?&nbsp;</strong></p><p>First of all let me just say that Node.js is the most popular technology right now, and it\'s REPO&nbsp;website is the biggest in the WORLD, now let\'s begin......</p><p>Some of us&nbsp;call it<strong>&nbsp;Node.js, NODE,</strong>&nbsp;or just&nbsp;<strong>NodeJs</strong>&nbsp;but they all mean the same thing. NodeJs is a runtime to use&nbsp;JavaScript on servers. A runtime acts like a middle-man and in this case NodeJs is helping us use Javascript to handle system processes, files and even databases. NodeJs is written in C++ which is a powerful high level programming&nbsp;language that does LOTS&nbsp;of cool things.</p><p><br></p><p><strong>My approach</strong></p><p>I\'m profesional but not boring</p><p>I\'m a regular person just like you - your mentor, teacher!</p><p>I joke sometimes, so that you won\'t fall asleep (I know how that is)</p><p>My teaching method&nbsp;are Unorthodox - look it up :)&nbsp;</p>', 16.99, 84.99, '26', '23h 10m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660632448/qlhb9q20dvxs8lpajjsw.jpg', 'Lifetime', '<ul><li>Some Javascript is needed to learn NodeJs</li><li>Some HTML is needed for this course</li></ul>', '<ul><li>To build Amazing NodeJS applications like the CMS we build here using Express, MongoDB and more</li><li>To deploy Nodejs Apps on the Cloud</li><li>To create Login and Registration system using NodeJS</li><li>To use Mongoose (ODM) - very similar to ORM</li><li>To create custom events</li><li>To import and export data</li><li>To use the Express FrameWork</li><li>To handle HTTP requests</li><li>To deal with Files</li><li>To use WebSockets - (Chat application)</li><li>To use PassportJS a module to login to Facebook, Twitter, Google and more</li><li>To use Template Engines like Handlebars</li><li>And LOTS more.......</li></ul><p><br></p>', '<ul><li>If you are a TOTAL beginner for NodeJs you should take this course</li><li>If you are looking for a better career you should take this course</li><li>If you are looking to UP your salary as developer you should take this course</li><li>If you have tried to learn NodeJS before and it was too hard - I make this EASY!</li><li>If you are trying to get into the Angular World</li><li>If you want to become a great Web Developer with a lot of success</li><li>If you just need to make some serious income as a developer</li></ul>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '763283f5-3076-4b06-acba-e33d1f2a0db7', 1, 1, '2022-08-16 07:17:57', 0, '2022-08-16 06:47:29', '2022-08-16 07:17:57'),
('db24afee-e132-4be7-a7e7-0c411ccd41ca', 'SAP ABAP Programming For Beginners - Online Training', 'sap-abap-programming-for-beginners-online-training', 'SAP ABAP is the popular enterprise programming language developed by SAP and used by the biggest organisations in the world to run their business systems.\n\nIn this SAP ABAP video training course, Peter Moxon introduces you to the fundamental skills needed to understand SAP ABAP programming and start creating your own ABAP programs.', '<p>You will learn by watching the author actually perform the operation he is instructing on, as he explains step by step how to create and modify ABAP code. The training explains SAP ABAP from the ground up starting with the absolute basics to ensure you have a thorough grasp of the how best to program SAP enterprise systems. He slowly works you up through learning the key aspects of ABAP development introducing new concepts and language element included in SAP, and covers topics such building report interfaces and modularizing you programs with \'Includes\', \'Forms\' and \'Function Modules\'.</p><p>This training course not only gives you an a thorough insight into how the SAP programming language works but is delivered in such a way that everyone who takes the course will have absolutely no problem in understanding all the topics discussed.</p>', 16.99, 84.99, '133', '13h 18m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660640866/pqtg4apk15znyd1babn5.jpg', 'Six Months', '<ul><li>User level understanding of how to navigate the SAP GUI</li></ul>', '<ul><li>Get your first job in SAP</li><li><br></li><li>Enhance your existing SAP Skill-set</li><li><br></li><li>Extensive, informative and interesting video lecture</li><li><br></li><li>Help pass SAP ABAP Certification Exams</li><li><br></li><li>Instructor contact through the Udemy platform</li></ul><p><br></p>', '<ul><li>Everyone</li><li>Beginners through to season SAP Consultants</li><li>SAP Functional Consultants looking to learn ABAP skills</li><li>SAP Project Team members</li><li>College Students wanting to get ahead with their studies</li><li>SAP BASIS Consultants wanting to expand their knowledge</li><li>SAP BW Consultants - ABAP play a BIG part in this role</li></ul><p><br></p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '6fe00827-7c90-48e9-bf3e-7e2591f97ec8', 1, 0, NULL, 0, '2022-08-16 09:07:47', '2022-08-24 06:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `course_assets`
--

CREATE TABLE `course_assets` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lecture_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lecture_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course_assets`
--

INSERT INTO `course_assets` (`id`, `lecture_name`, `lecture_file`, `courseId`, `created_at`, `updated_at`) VALUES
('289302a0-3a4d-485e-a23f-417340385169', 'How to image proccessing', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660633994/rcsgks9kygvsefxzjdnr.php', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '2022-08-16 07:13:15', '2022-08-16 07:13:15'),
('5dfb4a3f-d6c1-4c01-8aa0-455254fbf6d3', 'Certified Security', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660635440/lggdrfp1jhvqrfv4uwew.pdf', '142a183d-45f1-4447-9aad-64f736471988', '2022-08-16 07:37:21', '2022-08-16 07:37:21'),
('5e4c6ee2-fed7-4938-bd85-7d532fe8af82', 'How to image proccessing', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660641019/bznisqkn49wgxjmasoaf.jpeg', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '2022-08-16 09:10:19', '2022-08-16 09:10:19'),
('81a7a6c0-4dd4-43a6-afbe-f95ddd924473', 'How to image proccessing', 'https://res.cloudinary.com/dev-empty/raw/upload/v1661246283/bb9wygtppwejxmsijx6z.pdf', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:18:04', '2022-08-23 09:18:04'),
('98b2fa7e-105b-4e50-a6c7-5be307e5ff5d', 'Accounting and Finance', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660634743/s8yj6ly5rudzk8fkwcow.sql', '3118e959-37af-453b-889b-e3006446127a', '2022-08-16 07:25:43', '2022-08-16 07:25:43'),
('99cebd1f-ec2c-49d4-b658-1820129f67b9', 'Business Idea', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660634259/mvhsgqhumvg3gfrnkqhu.pdf', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', '2022-08-16 07:17:39', '2022-08-16 07:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `course_progresses`
--

CREATE TABLE `course_progresses` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `finished` tinyint(1) DEFAULT '1',
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `videoId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course_progresses`
--

INSERT INTO `course_progresses` (`id`, `finished`, `userId`, `courseId`, `videoId`, `created_at`, `updated_at`) VALUES
('01ab581a-19dc-4d28-a86d-70cd3209834f', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '6afbf2b0-d5f5-405f-be5c-66aff4375d24', '2022-09-23 15:07:30', '2022-09-23 15:07:30'),
('0b67d04a-eec5-4050-88f7-e33cc5fdae6f', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '7e0cfbd8-1292-44b1-a93a-0834052422fc', '2022-09-20 03:26:54', '2022-09-20 03:26:54'),
('143b2a24-6afe-43e1-a8b8-d4e8efdc5a39', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '75555389-1085-44b9-9dfb-524c3bdafff0', 'fdf70912-4a8c-4613-821f-f1c59a26f857', '2022-09-20 00:02:07', '2022-09-20 00:02:07'),
('3d0ad4b5-867d-4361-8c51-9600c41a18e2', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '092b2d95-fbf9-428f-b690-5d6c74571edd', '2022-09-22 10:53:58', '2022-09-22 10:53:58'),
('455a278f-b98f-460f-9e43-c65acab99c27', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '11aad455-945c-4ac1-9ff4-b56904afee4c', '2022-09-22 10:54:05', '2022-09-22 10:54:05'),
('4654fee1-fb1f-4036-ac1f-400775e43b13', 1, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '7e0cfbd8-1292-44b1-a93a-0834052422fc', '2022-08-30 09:38:54', '2022-08-30 09:38:54'),
('496f9878-281a-47bf-a912-2bba286e002b', 1, '89aeed13-5b6e-4e0d-84af-a24793a83cd8', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', '8b2ce5c0-232a-4441-896b-d78fe64bc17f', '2022-09-21 11:13:36', '2022-09-21 11:13:36'),
('4cd452b8-533b-4591-b1e2-b26ae62cee11', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '742d231f-2d5b-42b6-993e-1edeba676f45', '9bd8d2a6-8c9f-482a-bb11-bdc83fcf6e3a', '2022-09-20 02:33:47', '2022-09-20 02:33:47'),
('67b107c5-c19c-4671-988c-f96c1bfe366f', 1, 'dafa7787-cb5b-4abb-99c5-b47791b23d60', '742d231f-2d5b-42b6-993e-1edeba676f45', '9bd8d2a6-8c9f-482a-bb11-bdc83fcf6e3a', '2022-09-19 02:54:19', '2022-09-19 02:54:19'),
('7ff4758a-cc9d-4400-948e-218d1cac8d60', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', '8b2ce5c0-232a-4441-896b-d78fe64bc17f', '2022-09-19 04:23:45', '2022-09-19 04:23:45'),
('a3235e19-55e3-4908-be51-55ba3763f44f', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '066c6c45-cb41-43d7-b7b8-3ed8aeb4477d', '2022-09-20 03:38:26', '2022-09-20 03:38:26'),
('be5dfea7-82d1-451d-933a-ce7f27f9b866', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', '3118e959-37af-453b-889b-e3006446127a', '6605e17d-3c26-4d01-9565-f59c9623f5e4', '2022-08-23 04:55:11', '2022-08-23 04:55:11'),
('d8e17268-3413-47b4-afb8-3975b33515af', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', '142a183d-45f1-4447-9aad-64f736471988', '3a858fce-8795-4e9e-b8d4-7fe14e47863e', '2022-08-23 14:46:00', '2022-08-23 14:46:00'),
('d9975207-19cd-4d5d-b790-b4bb6142d1b6', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '895fac47-e731-412c-a947-27fb489ef818', '2022-09-23 15:07:03', '2022-09-23 15:07:03'),
('e188e14c-3da3-407d-bca8-fcb3dc6a5f7b', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', '89ba4507-e450-473e-b82c-1bf86f927ff5', '2022-09-21 07:07:19', '2022-09-21 07:07:19'),
('f66747d0-b606-47c4-a5bd-f3e56b7337cb', 1, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', '3118e959-37af-453b-889b-e3006446127a', '7ecba8e0-92d3-4d55-a874-a0bca9038418', '2022-08-23 04:55:13', '2022-08-23 04:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `enrolments`
--

CREATE TABLE `enrolments` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `bought_price` float DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` enum('paid','unpaid') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enrolments`
--

INSERT INTO `enrolments` (`id`, `bought_price`, `payment_method`, `buyer_name`, `buyer_email`, `buyer_avatar`, `userId`, `courseId`, `status`, `created_at`, `updated_at`) VALUES
('036f28de-f9cf-4780-ac10-f20bbb1fca83', 99.99, 'Card', 'Instructor', 'shabbir@salah.software', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'bf330a2e-d308-4e3d-a437-7c0ec31f037e', 'paid', '2022-09-25 07:45:09', '2022-09-25 07:45:09'),
('08e4fb40-a800-473d-81f8-f1ae82be5941', 49.99, 'Card', 'Net', 'sample@email.com', NULL, 'dafa7787-cb5b-4abb-99c5-b47791b23d60', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-09-19 02:53:49', '2022-09-19 02:53:49'),
('11f98892-7fc7-4766-b077-ab4a447c90c9', 99.99, 'Card', 'Student', 'shabbir@envytheme.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'paid', '2022-08-30 09:31:04', '2022-08-30 09:31:04'),
('15a67ffe-86bd-4543-8730-beb4276b5ce5', 16.99, 'Card', 'cjekcez@jzef.fr', 'cjekcez@jzef.fr', NULL, 'cd54e954-1ded-4267-9cd8-cb989e84127c', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'paid', '2022-09-14 08:37:12', '2022-09-14 08:37:12'),
('16790d35-2954-409e-b885-5180a16d3e1b', 39.99, 'Card', 'Instructor', 'shabbir@salah.software', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '308cdeb3-b61f-4fca-a139-9bb219282dd3', 'paid', '2022-08-30 09:34:33', '2022-08-30 09:34:33'),
('25341267-9264-46cf-93cb-5cea35ba44be', 49.99, 'Card', 'Admin ', 'salak@onion10.com', NULL, 'f1ace5b6-2ea0-4119-9a95-bc5746971385', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-08-24 06:59:03', '2022-08-24 06:59:03'),
('2a18c49e-6ab6-4d42-921a-576a8a2300d3', 16.99, 'Card', 'Shabbir', 'shabbirahmed149@gmail.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1660631868/gnfwstr1tv80am1duqp7.png', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'paid', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('4daf7c69-735d-413d-aa25-611bff91fecd', 39.99, 'Card', 'edy', 'edynotifs@gmail.com', NULL, '4786db34-7afe-4997-9146-0e3bb8f9f090', '308cdeb3-b61f-4fca-a139-9bb219282dd3', 'paid', '2022-09-15 19:46:38', '2022-09-15 19:46:38'),
('5526232f-5666-47ce-9212-6bac41797a20', 17.99, 'Card', 'Student', 'shabbir@envytheme.com', NULL, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', '3118e959-37af-453b-889b-e3006446127a', 'paid', '2022-08-23 04:06:33', '2022-08-23 04:06:33'),
('579c47f2-6537-4e26-b6a0-acb29dd69f34', 16.99, 'Card', 'Admin', 'admin@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661245253/wqsnxv0pfdwl2abdakf5.jpg', '89aeed13-5b6e-4e0d-84af-a24793a83cd8', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'paid', '2022-09-21 02:35:39', '2022-09-21 02:35:39'),
('6b2ddd13-4b09-4331-8a26-b7b75885bd30', 34.99, 'Card', 'Student', 'shabbir@envytheme.com', NULL, '0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', '142a183d-45f1-4447-9aad-64f736471988', 'paid', '2022-08-23 07:38:40', '2022-08-23 07:38:40'),
('6ca92bb6-d21a-4d84-98f6-aab35027c75a', 49.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '75555389-1085-44b9-9dfb-524c3bdafff0', 'paid', '2022-09-19 22:10:48', '2022-09-19 22:10:48'),
('762048bd-5f4b-4fc5-8827-8f39a6959f57', 34.99, 'Card', 'Shabbir', 'shabbirahmed149@gmail.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1660631868/gnfwstr1tv80am1duqp7.png', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '142a183d-45f1-4447-9aad-64f736471988', 'paid', '2022-08-18 07:37:04', '2022-08-18 07:37:04'),
('7899ded1-8c3e-48c1-a807-eb6ceb3b98cb', 99.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'paid', '2022-09-22 13:18:18', '2022-09-22 13:18:18'),
('7b23db52-d8ed-467d-a683-39308f9f80cd', 16.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'd92f38eb-e616-414c-be0c-54e79a6809c7', 'paid', '2022-09-22 09:03:17', '2022-09-22 09:03:17'),
('7dfe0304-82dd-4a58-a97f-7a0a0f10acba', 34.99, 'Card', 'Shabbir', 'shabbirahmed149@gmail.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1660631868/gnfwstr1tv80am1duqp7.png', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '142a183d-45f1-4447-9aad-64f736471988', 'paid', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('7f448f9a-5459-4525-9064-7aa7640c8b96', 49.99, 'Card', 'Admin', 'admin@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661245253/wqsnxv0pfdwl2abdakf5.jpg', '89aeed13-5b6e-4e0d-84af-a24793a83cd8', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-09-22 17:39:20', '2022-09-22 17:39:20'),
('8b9cfb81-5774-4d9b-b3a6-f53717f47139', 8.5, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'paid', '2022-09-19 04:23:33', '2022-09-19 04:23:33'),
('b96d42ab-ee73-43ca-99bf-34b6a0c1c572', 16.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'paid', '2022-09-20 03:26:19', '2022-09-20 03:26:19'),
('ba562174-4416-4d9e-aed1-0a6afb54b2f1', 9.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', 'paid', '2022-09-23 10:04:12', '2022-09-23 10:04:12'),
('c0382082-bf4d-499e-af03-aaa75dd601fa', 49.99, 'Card', 'Instructor', 'shabbir@salah.software', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-08-30 09:34:33', '2022-08-30 09:34:33'),
('c7c97041-4720-447c-9fe1-b9305eccbc31', 49.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-09-20 02:15:27', '2022-09-20 02:15:27'),
('d2da0050-a4ba-42f0-afca-42c8fd054a85', 11.99, 'Card', 'Student', 'student@elearniv.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', '0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', 'paid', '2022-09-19 23:43:14', '2022-09-19 23:43:14'),
('d3d33767-fd00-4853-a3cf-10ebfc7eb88a', 16.99, 'Card', 'edy', 'edynotifs@gmail.com', NULL, '4786db34-7afe-4997-9146-0e3bb8f9f090', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'paid', '2022-09-15 19:51:41', '2022-09-15 19:51:41'),
('daa64b0a-1a9d-45fb-a9c3-b4127f30e777', 9.99, 'Card', 'Instructor', 'shabbir@salah.software', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', 'paid', '2022-08-30 09:34:33', '2022-08-30 09:34:33'),
('ec8dbdb1-098e-438c-9326-2f50a9fd40fd', 99.99, 'Card', 'Muttakin', 'muttakinfreelance@gmail.com', NULL, 'bd934db7-5b4e-4ef3-a4c3-e79fe2734e24', 'bf330a2e-d308-4e3d-a437-7c0ec31f037e', 'paid', '2022-09-25 07:46:43', '2022-09-25 07:46:43');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `userId`, `courseId`, `created_at`, `updated_at`) VALUES
('0342b4b8-de1f-4e53-a6fb-e3ec7ebb1b7b', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4d', '742d231f-2d5b-42b6-993e-1edeba676f45', '2022-09-21 11:17:05', '2022-09-21 11:17:05'),
('0eab13a7-9221-42de-9f06-f4d35a67fb51', 'cd54e954-1ded-4267-9cd8-cb989e84127c', '72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', '2022-09-14 08:28:51', '2022-09-14 08:28:51'),
('20f02990-8274-4b30-8d58-4e6bd1cc4b3d', '89aeed13-5b6e-4e0d-84af-a24793a83cd8', '308cdeb3-b61f-4fca-a139-9bb219282dd3', '2022-09-24 03:54:44', '2022-09-24 03:54:44'),
('589ed645-39ee-4d21-9998-35d1b895cbca', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', '2022-08-30 09:34:50', '2022-08-30 09:34:50'),
('7a989a25-e5fe-4c33-817c-897f34739e56', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '2022-08-24 04:58:03', '2022-08-24 04:58:03'),
('7f0ae4e2-973c-4665-b4bf-e5a828faf085', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', '2022-08-30 09:34:51', '2022-08-30 09:34:51'),
('80a7a0b0-50d8-4f8a-be87-8eaacda99996', '27111002-6959-4d1a-be30-20f702857c30', 'c5c6ee66-84df-46ee-b961-70a3ca173972', '2022-08-24 07:44:07', '2022-08-24 07:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_earnings`
--

CREATE TABLE `instructor_earnings` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `earnings` float DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` enum('due','paid','cancelled') COLLATE utf8_unicode_ci DEFAULT 'due',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instructor_earnings`
--

INSERT INTO `instructor_earnings` (`id`, `earnings`, `userId`, `courseId`, `status`, `created_at`, `updated_at`) VALUES
('048c60da-c8f2-4f63-8475-7a9ab7e560c5', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-08-24 06:59:03', '2022-08-24 06:59:03'),
('06f33936-d78b-4e48-8d05-0b39a199f2d7', 99.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'bf330a2e-d308-4e3d-a437-7c0ec31f037e', 'due', '2022-09-25 07:45:09', '2022-09-25 07:45:09'),
('22fbbdd6-756c-4c79-863a-aa81eae6247f', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-09-20 02:15:27', '2022-09-20 02:15:27'),
('32c0ba71-89bd-4eca-8c81-f3fc9084d6b6', 17.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', 'due', '2022-08-22 15:53:28', '2022-08-22 15:53:28'),
('4847033e-68e2-45fb-a107-42ca4d8222a8', 99.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'due', '2022-08-30 09:31:04', '2022-08-30 09:31:04'),
('4fb7d7da-18b2-42c6-8b7f-7776c77fab7d', 16.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'due', '2022-08-22 04:53:57', '2022-08-22 04:53:57'),
('52a0742e-a490-49ad-ab64-792579f26e46', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('56566e6a-6369-4580-9ca5-aef596e9e652', 39.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '308cdeb3-b61f-4fca-a139-9bb219282dd3', 'due', '2022-09-15 19:46:38', '2022-09-15 19:46:38'),
('5f79412b-4d36-443d-b9cf-a8cf720d9e7c', 16.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'due', '2022-09-15 19:51:41', '2022-09-15 19:51:41'),
('6abdeb43-1e56-48ce-8e5a-6be61618c312', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-23 07:38:40', '2022-08-23 07:38:40'),
('774dfeb7-34db-47da-b77a-09adb773cdb0', 16.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'due', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('7b6be192-dd3a-4f4a-9093-d9057b5813a6', 16.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'due', '2022-09-21 02:35:39', '2022-09-21 02:35:39'),
('83888d13-c67c-48f7-8405-885bbd692514', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-22 05:46:13', '2022-08-22 05:46:13'),
('8ebbf562-b204-442b-aa02-dc47396949d7', 8.5, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'due', '2022-09-19 04:23:33', '2022-09-19 04:23:33'),
('95a6bcd2-5f40-47ab-ac7d-0daa6d8ef932', 39.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '308cdeb3-b61f-4fca-a139-9bb219282dd3', 'due', '2022-08-30 09:34:33', '2022-08-30 09:34:33'),
('97ffde2e-1692-4656-ac0b-230bc5c92a78', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-22 05:53:04', '2022-08-22 05:53:04'),
('9a3d7a47-8250-475e-8824-b10f9ca99270', 9.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', 'due', '2022-09-23 10:04:12', '2022-09-23 10:04:12'),
('9bd79c6c-47c9-4ac3-9943-8119f8b49aa6', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-08-30 09:34:33', '2022-08-30 09:34:33'),
('9e9fd936-856a-4955-99cd-b1160ca96a87', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-09-19 02:53:49', '2022-09-19 02:53:49'),
('a2f34f72-78d2-40ce-a8bc-218b14063e50', 16.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'due', '2022-09-20 03:26:19', '2022-09-20 03:26:19'),
('a6f6e736-b84d-4c88-bde2-5b3032738bd2', 11.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', 'due', '2022-09-19 23:43:14', '2022-09-19 23:43:14'),
('a9bacfec-af55-4e44-977a-e12b539e559a', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-09-22 17:39:20', '2022-09-22 17:39:20'),
('ab276105-8031-4cac-98fe-1c81b174a46e', 16.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'd92f38eb-e616-414c-be0c-54e79a6809c7', 'due', '2022-09-22 09:03:17', '2022-09-22 09:03:17'),
('af398513-a6f9-436b-835d-1d5223dd4247', 16.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'due', '2022-08-22 15:45:32', '2022-08-22 15:45:32'),
('c31a7b2f-f851-42e9-9e1e-a9094078e310', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-22 15:50:04', '2022-08-22 15:50:04'),
('c457f731-d9b2-4be1-a87f-fd065b6f43c4', 17.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', 'due', '2022-08-23 04:06:33', '2022-08-23 04:06:33'),
('c57b5ae0-c9c9-4415-aee2-d880923f03a9', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4d', '75555389-1085-44b9-9dfb-524c3bdafff0', 'due', '2022-09-19 22:10:48', '2022-09-19 22:10:48'),
('d57028e6-409c-47f6-a72a-897bf0adb500', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-18 07:37:04', '2022-08-18 07:37:04'),
('d7f4fb38-e86d-4d3a-bfbd-63760335af0f', 16.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'due', '2022-09-14 08:37:12', '2022-09-14 08:37:12'),
('dbe4de48-befc-42f5-83c5-e219bc631fea', 9.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', 'due', '2022-08-30 09:34:33', '2022-08-30 09:34:33'),
('dd1b1a4d-844e-4633-9220-e1f772bc02f8', 99.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'bf330a2e-d308-4e3d-a437-7c0ec31f037e', 'due', '2022-09-25 07:46:43', '2022-09-25 07:46:43'),
('f0c6dbfd-e09f-4594-9d9f-bc7cafff0f4b', 99.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'due', '2022-09-22 13:18:18', '2022-09-22 13:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `partner_image`, `created_at`, `updated_at`) VALUES
('218cd3cb-3862-4a65-9a26-ff41db001ca3', 'MS', 'https://res.cloudinary.com/dev-empty/image/upload/v1661161382/rmxmzufdz49cpzjssosv.png', '2022-08-22 09:43:02', '2022-08-22 09:43:02'),
('7570326b-bb7c-491f-8136-8c91b0434c2e', 'Envato', 'https://res.cloudinary.com/dev-empty/image/upload/v1661161393/odkmwphgku2dlsdyaad4.png', '2022-08-22 09:43:13', '2022-08-22 09:43:13'),
('afbd9d22-f6c4-4254-a80b-85643c3fbc8b', 'Google', 'https://res.cloudinary.com/dev-empty/image/upload/v1661161461/alfegv8btanozdqld3np.png', '2022-08-22 09:44:21', '2022-08-22 09:44:21'),
('c4890409-9b6b-4f52-929a-2760979342ff', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1661161371/ndqnniaryo2n2szdkwsc.png', '2022-08-22 09:42:52', '2022-08-22 09:42:52'),
('e3ffc9a8-b17e-4f47-9767-afa3cb37bc41', 'ThemeForest', 'https://res.cloudinary.com/dev-empty/image/upload/v1661161400/igaeyilojmqpvonhe1am.png', '2022-08-22 09:43:20', '2022-08-22 09:43:20'),
('f268750f-a059-4662-ba6a-355d4a2d007f', 'S3', 'https://res.cloudinary.com/dev-empty/image/upload/v1661161409/pyn8kp9eppisxgwqf2cq.png', '2022-08-22 09:43:29', '2022-08-22 09:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20220807061714-create-user.js'),
('20220809153209-create-category.js'),
('20220810055344-create-testimonial.js'),
('20220810071953-create-partner.js'),
('20220811031005-create-course.js'),
('20220814043222-create-video.js'),
('20220815063929-create-course-asset.js'),
('20220816105113-create-favourite.js'),
('20220817092028-create-enrolment.js'),
('20220817092044-create-instructor-earning.js'),
('20220821065623-create-course-progress.js'),
('20220822101406-create-subscription.js');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `active`, `created_at`, `updated_at`) VALUES
('6f4652e2-fa95-4361-bad4-5f8295110319', 'shabbirahmed149@gmail.com', 1, '2022-08-24 05:19:42', '2022-08-24 05:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `image_url`, `name`, `designation`, `description`, `created_at`, `updated_at`) VALUES
('6d240ff9-a486-4468-b8d8-7d2d29ed21a4', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319916/ikdnht0voicfbwdpwmam.jpg', 'Jhon Smith', 'React Developer', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2022-08-22 07:55:53', '2022-08-24 05:45:17'),
('9dfc677a-0ed2-4cc2-bfbb-690ee34885e1', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319899/jesalmrfyvyjhnc4bn8w.jpg', 'Jason Stathum', 'Python Dev.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2022-08-22 07:56:39', '2022-08-24 05:44:59'),
('ef09c8c4-b6b6-447c-8af1-12eb366acf52', 'https://res.cloudinary.com/dev-empty/image/upload/v1661155050/ulxxkiqnpzqvwcnbutyl.jpg', 'Stiven Smith', 'Captain Of AU.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2022-08-22 07:57:30', '2022-08-22 07:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `profile_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_token` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reset_password_send_at` datetime DEFAULT NULL,
  `reset_password_at` datetime DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` enum('student','admin','instructor') COLLATE utf8_unicode_ci DEFAULT 'student',
  `email_confirmed` tinyint(1) DEFAULT '0',
  `email_confirmed_at` datetime DEFAULT NULL,
  `instructor_request` tinyint(1) DEFAULT '0',
  `instructor_request_confirmed` tinyint(1) DEFAULT '0',
  `instructor_request_confirmed_at` datetime DEFAULT NULL,
  `instructor_status` tinyint(1) DEFAULT NULL,
  `instructor_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructor_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_profile_public` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `designation`, `bio`, `profile_photo`, `location`, `phone`, `reset_password_token`, `reset_password_send_at`, `reset_password_at`, `website`, `twitter`, `facebook`, `linkedin`, `youtube`, `role`, `email_confirmed`, `email_confirmed_at`, `instructor_request`, `instructor_request_confirmed`, `instructor_request_confirmed_at`, `instructor_status`, `instructor_subject`, `instructor_description`, `status`, `is_profile_public`, `created_at`, `updated_at`) VALUES
('0ca83de5-3b71-4f3c-b25f-6767e5efa3c7', 'Student', 'Profile', 'shabbir@envytheme.com', '$2b$10$x4kUZpMmAG6RxwJhvYPtMeLWd9.Ex.vb6oy/fIFDzpanJYgc.fbMO', NULL, NULL, NULL, 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', NULL, NULL, '573674dc-3ec7-43ad-ae3b-2ea7e649373c', '2022-08-22 04:27:26', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-08-22 04:38:20', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-22 04:27:26', '2022-08-24 05:38:45'),
('0ca83de5-3b71-4f3c-b25f-6767e5efa3c8', 'Student', 'Profile', 'student@elearniv.com', '$2b$10$x4kUZpMmAG6RxwJhvYPtMeLWd9.Ex.vb6oy/fIFDzpanJYgc.fbMO', NULL, NULL, NULL, 'https://res.cloudinary.com/dev-empty/image/upload/v1661319525/vybjeg0uupncmfemh5uf.jpg', NULL, NULL, '573674dc-3ec7-43ad-ae3b-2ea7e649373c', '2022-08-22 04:27:26', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-08-22 04:38:20', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-22 04:27:26', '2022-08-24 05:38:45'),
('124abe4b-1558-449b-bde3-dde7e8d1153a', 'Shabbir', 'Ahmed', 'shabbirahmed@gmail.com', '$2b$10$LIt93S54v2a326BJTR0DyuQJBTUg3E9WI.27mzoa9eVLyiA6.9Ksm', NULL, NULL, NULL, NULL, NULL, NULL, 'd5b3462f-1159-447e-b949-7975011c9a28', '2022-08-16 06:22:17', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-16 06:22:17', '2022-08-16 06:22:17'),
('1e906a17-0b74-4a74-8f6c-83accc8f06d7', 'EnvyTheme', 'Admin', 'hello@envytheme.com', '$2b$10$da2GaFSMjfpdjMdsbsfzmum4yhn9/Knsfv3rrO6rKz4XVOW6xQY2i', NULL, NULL, NULL, NULL, NULL, NULL, 'ca11009a-bb2c-44eb-b770-1b2bd828cb88', '2022-08-24 12:03:54', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, '2022-08-24 12:04:03', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-24 12:03:54', '2022-08-24 12:04:50'),
('20d0da75-5297-4e18-bccb-2ac75e606cfd', 'Duke', 'Devin', 'duke@mexcool.com', '$2b$10$IjOh/U2gicac1sHOfczeke0rzWZkOY6ZzV//lo3SErm.MPTs8qAwm', NULL, NULL, NULL, NULL, NULL, NULL, 'c14e5acf-f018-4d93-920e-c5701b203537', '2022-09-15 20:37:01', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-15 20:37:01', '2022-09-15 20:37:01'),
('27111002-6959-4d1a-be30-20f702857c30', 'Raahsalah', 'Salak', 'salak@envytheme.com', '$2b$10$1iGGZ.lCYEaCyqTQbDQFZ.6HnVJL2HtJelan5O/xThxSCpzP.pkbO', NULL, NULL, NULL, NULL, NULL, '01717569992', 'bef6aa1a-21cf-4a56-8678-350dc65f2a2d', '2022-08-21 06:56:31', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, '2022-08-21 07:04:41', 1, 1, '2022-08-21 08:10:59', NULL, 'Test', 'Tess', 1, 1, '2022-08-21 06:56:31', '2022-08-21 08:10:59'),
('35423495-ecae-4c1d-b634-ac8a3d2924c6', 'ant', 'ant', 'nioto02@live.fr', '$2b$10$2.LBdJhRjF83wfNBEdnLS.HREcSdlCOa1ypsEq3gG3wPp/YGa/S.a', NULL, NULL, NULL, NULL, NULL, NULL, '1c1df748-4b3f-407b-8531-c39a158d585d', '2022-09-22 09:53:28', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-22 09:53:28', '2022-09-22 09:53:28'),
('4786db34-7afe-4997-9146-0e3bb8f9f090', 'edy', 'matimbe', 'edynotifs@gmail.com', '$2b$10$Tdqdz25LAt5EOCOEO6oMQeFNgbZWWd7hLN/Z20JA8QTfKFQptfDp.', NULL, NULL, NULL, NULL, NULL, NULL, '1c531f37-7747-42cc-a27f-6ab520d7f36d', '2022-09-15 19:45:57', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-15 19:45:57', '2022-09-15 19:45:57'),
('4affe25a-46a3-4895-b92a-dcbdb734a07d', 'Yunan', 'Ramadani', 'yunanmr@yahoo.com', '$2b$10$yh6Se9xHWQINI.TSuJx8wuOaLAOfhJK9nrHFiEi1j9iuZvBoANdfO', NULL, NULL, NULL, NULL, NULL, NULL, '6a37f293-018f-483d-9c84-60cd52fc1324', '2022-09-15 05:47:00', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-09-15 06:10:55', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-15 05:47:00', '2022-09-15 06:10:55'),
('6532bea5-f187-4d90-8c89-5fb0facafec0', 'dsa', 'dsa', 'ds@ds.com', '$2b$10$F0JkRhBFRaoXgEoPXMT8TOju41mB4WERZk39uOkR8vOEZtttHuySq', NULL, NULL, NULL, NULL, NULL, NULL, 'c36be73d-6c7c-48cc-bbab-41aa46d577b9', '2022-09-13 10:22:19', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-13 10:22:19', '2022-09-13 10:22:19'),
('773d6e08-c3b6-47b5-8b8f-84b20b23596e', 'bongo', 'bas', 'bongo@sending.im', '$2b$10$9CqungF5aZp1claek0nyvOIjTG/dnOkCc21XEV3.G7/O77wm7FuKe', NULL, NULL, NULL, NULL, NULL, '43534534534534', '260ccf52-b4e9-4c26-ace4-ac4ae652674e', '2022-09-18 11:57:43', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-09-18 11:58:58', 1, 0, NULL, NULL, 'Marketing', 'dsfjsdlkfjsd', 1, 1, '2022-09-18 11:57:43', '2022-09-18 11:59:52'),
('78604fb9-429b-4a02-8295-e06cb06769d8', 'test', 'test', 'k.morita@nao.land', '$2b$10$pU8no1NxqIdF6alUGLoiEetz/aT7AWx5zAHfexP0JnLqYUOlARBM2', NULL, NULL, NULL, NULL, NULL, '00000000000', '040fe031-21ac-4961-9769-9ff1c5596c7b', '2022-09-14 14:15:36', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-09-14 14:16:00', 1, 0, NULL, NULL, '111', '1111', 1, 1, '2022-09-14 14:15:36', '2022-09-14 14:16:51'),
('7953d77b-2228-4f07-93b4-70097a2c76d4', 'Guuu', 'Bnjj', 'bymbuysh@yahoo.com', '$2b$10$f2BEPISFZYjydeSR5VJ5zehVmExyNyfRLJqcLskQGGCajXZYgOr/6', NULL, NULL, NULL, NULL, NULL, NULL, 'd3300429-4f9e-4044-9c56-67a28dedc2bd', '2022-09-21 02:26:48', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-21 02:26:48', '2022-09-21 02:26:48'),
('89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'Admin', 'User', 'shabbirahmed149@gmail.com', '$2b$10$dlh6PVGVzG7pHebt8GxVFuwNNsWJvJWb5lZcyB.nAI3FqLMDXSZ.G', NULL, NULL, 'Admin started his career as a Unix and Linux System Engineer in 1999. Since that time he has utilized his Linux skills at companies such as Xerox, UPS, Hewlett-Packard, and Amazon.com. Additionally, he has acted as a technical consultant and independent contractor for small businesses and Fortune 500 companies.', 'https://res.cloudinary.com/dev-empty/image/upload/v1661245253/wqsnxv0pfdwl2abdakf5.jpg', NULL, NULL, 'e52de641-fc1b-419a-b82f-75905bdfac97', '2022-08-16 03:26:55', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, '2022-08-16 03:27:12', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-16 03:26:55', '2022-08-23 14:12:36'),
('89aeed13-5b6e-4e0d-84af-a24793a83cd8', 'Admin', 'User', 'admin@elearniv.com', '$2b$10$dlh6PVGVzG7pHebt8GxVFuwNNsWJvJWb5lZcyB.nAI3FqLMDXSZ.G', NULL, NULL, 'Admin started his career as a Unix and Linux System Engineer in 1999. Since that time he has utilized his Linux skills at companies such as Xerox, UPS, Hewlett-Packard, and Amazon.com. Additionally, he has acted as a technical consultant and independent contractor for small businesses and Fortune 500 companies.', 'https://res.cloudinary.com/dev-empty/image/upload/v1661245253/wqsnxv0pfdwl2abdakf5.jpg', NULL, NULL, 'e52de641-fc1b-419a-b82f-75905bdfac97', '2022-08-16 03:26:55', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, '2022-08-16 03:27:12', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-16 03:26:55', '2022-08-23 14:12:36'),
('94319ac6-0c60-47a1-9c15-72e9b82c7672', 'James', 'Elroy', 'support@malttt.com', '$2b$10$XnVXTt8YA6CPFl1EspAz8uXO8aCDwSv51hzLEI3UVilmi992.7lpy', NULL, NULL, NULL, NULL, NULL, NULL, 'f84e7d8f-774d-45a4-ae71-a4c83a3f0142', '2022-09-22 05:04:43', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-22 05:04:43', '2022-09-22 05:04:43'),
('9bed7263-9c39-4365-bcaa-65c58a52b792', 'Manu', 'numa', 'hello.ituka@gmail.com', '$2b$10$n5A3QsYzfzTTzjToO5wwn.sfsgs9XuUsNlXK571AqDMfUYcN7BApS', NULL, NULL, NULL, NULL, NULL, NULL, '2b03b729-fe31-4f29-9fce-bcf534cb4051', '2022-09-12 17:11:34', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-12 17:11:34', '2022-09-12 17:11:34'),
('bd934db7-5b4e-4ef3-a4c3-e79fe2734e24', 'Muttakin', 'Ahmed', 'muttakinfreelance@gmail.com', '$2b$10$Hv9VKwHeDYnvbFTynGtHGOJY.H1MkxwPIRBpnXbTfw7KfbL7qsvIK', NULL, NULL, NULL, NULL, NULL, NULL, '03805c06-ee60-4e5c-bbe2-d5ff0045177f', '2022-09-25 07:44:29', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-25 07:44:29', '2022-09-25 07:44:29'),
('c0b3d604-1221-4140-b5ed-12c54dec726b', 'joni', 'joni', 'jonatan_gonzalez.ads@icloud.com', '$2b$10$AlxG6AIqigMCupaS/DzjLua7TGQCcbxLmkYpQU3hxAeDonvPjMcJm', NULL, NULL, NULL, NULL, NULL, NULL, '1434c741-baab-4d85-bda9-23cf633e7c18', '2022-09-19 01:24:04', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-19 01:24:04', '2022-09-19 01:24:04'),
('c510fa1e-a350-4b0a-965a-183ee75065fb', 'hfg', 'ffxxs', 'jisan@gmail.com', '$2b$10$48M658LL8iE30DX6ozYcpe3ihyXiUvSKkufEWxNbu.AewCDORCA.G', NULL, NULL, NULL, NULL, NULL, NULL, '2282f9f6-14ba-4619-9bd1-3557b22d0bf5', '2022-08-25 09:25:51', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-25 09:25:51', '2022-08-25 09:25:51'),
('cd54e954-1ded-4267-9cd8-cb989e84127c', 'cjekcez@jzef.fr', 'cjekcez@jzef.fr', 'cjekcez@jzef.fr', '$2b$10$9FmDGOcUD7g3kPxFWeYWtetgiF9vQNXzc3LRxgtRKDQldavJjsmvi', NULL, NULL, NULL, NULL, NULL, NULL, '748c4c41-07af-4c68-ae83-5abd8b191ee6', '2022-09-13 14:48:03', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-13 14:48:03', '2022-09-13 14:48:03'),
('d1b20776-fc1f-4514-8937-50a2808b80e3', 'mohamed', 'tazi', 'mohamedmaroc733@gmail.com', '$2b$10$Zi12OqNDyCoG8ETKOWcn1OU/bIIwovc2LzdsDrhlUSWpwWnLa55zi', NULL, NULL, NULL, NULL, NULL, NULL, '9a747afe-9881-4ffd-9224-105ea050597f', '2022-09-21 16:47:38', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-21 16:47:38', '2022-09-21 16:47:38'),
('dafa7787-cb5b-4abb-99c5-b47791b23d60', 'Net', 'Guy', 'sample@email.com', '$2b$10$byYWjJxRlyd1gsOPCWkFFO8IGs9Xl9BPVHIrmBtSTg0DsxDjVSAym', NULL, NULL, NULL, NULL, NULL, NULL, '7633ecd0-890a-4318-a261-6382defbc305', '2022-09-19 02:52:01', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-19 02:52:01', '2022-09-19 02:52:01'),
('ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'Instructor', 'User', 'shabbir@salah.software', '$2b$10$cQuqV3bPHw3EQFZXSBxxhOf5wYeAOhZ8ShRPZmmDra1M0J173Sxly', NULL, NULL, 'AP consultant and the #1 SAP instructor on Udemy.\n\nI hope you find my courses interesting and I really hope you enjoy them.', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', NULL, '+8801646295918', 'aed837d4-6237-4e9a-b7a3-22dfbb5ab9ad', '2022-08-16 05:25:46', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, '2022-08-16 07:29:43', 1, 1, '2022-08-16 07:33:08', NULL, 'Register to Become an Intructor', 'Register to Become an Intructor', 1, 1, '2022-08-16 05:25:46', '2022-08-23 04:59:20'),
('ee2ddc7c-08ec-430b-afd0-4da0184bcc4d', 'Instructor', 'User', 'teacher@elearniv.com', '$2b$10$cQuqV3bPHw3EQFZXSBxxhOf5wYeAOhZ8ShRPZmmDra1M0J173Sxly', NULL, NULL, 'AP consultant and the #1 SAP instructor on Udemy.\r\n\r\nI hope you find my courses interesting and I really hope you enjoy them.', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', NULL, '+8801646295918', 'aed837d4-6237-4e9a-b7a3-22dfbb5ab9ad', '2022-08-16 05:25:46', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, '2022-08-16 07:29:43', 1, 1, '2022-08-16 07:33:08', NULL, 'Register to Become an Intructor', 'Register to Become an Intructor', 1, 1, '2022-08-16 05:25:46', '2022-08-23 04:59:20'),
('f08c1f22-f812-449a-80a0-56645c352dfa', 'Денис', 'Остарков', 'odanis@ya.ru', '$2b$10$bYStCHkExWZJHRz4E1Mtguqgw1DBY71Q4JR6Hu7R38Yf1sFrvoJgK', NULL, NULL, NULL, NULL, NULL, NULL, '0dc39f4d-0109-485e-962a-a29509c002b2', '2022-09-18 06:47:24', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-18 06:47:24', '2022-09-18 06:47:24'),
('f1ace5b6-2ea0-4119-9a95-bc5746971385', 'Admin ', 'RAA', 'salak@onion10.com', '$2b$10$mS9CuudNuq.EfnC.9owYUOfj0PL4ysoCv1wXkOGjcbPD8WSH1VnzK', NULL, NULL, NULL, NULL, NULL, NULL, '7cc98129-ddfb-424d-b591-d0092723a91a', '2022-08-21 07:51:49', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, '2022-08-21 07:52:10', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-21 07:51:49', '2022-08-21 07:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_length` float DEFAULT NULL,
  `is_preview` tinyint(1) DEFAULT '0',
  `short_id` int(11) NOT NULL DEFAULT '0',
  `assets_zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `group_name`, `title`, `thumb`, `video`, `video_length`, `is_preview`, `short_id`, `assets_zip`, `userId`, `courseId`, `created_at`, `updated_at`) VALUES
('066c6c45-cb41-43d7-b7b8-3ed8aeb4477d', 'Introduction', 'Programming For Beginners', 'https://res.cloudinary.com/dev-empty/image/upload/v1660640937/wdyfkal8ixben5aalosn.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660640934/jcjji9fsuiccbjiufkw3.mp4', 17.5, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '2022-08-16 09:08:57', '2022-08-16 09:08:57'),
('092b2d95-fbf9-428f-b690-5d6c74571edd', 'Introduction', 'Basic Programming', 'https://res.cloudinary.com/dev-empty/image/upload/v1660633890/snyxmtqc13ivp5uu8k7h.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660633888/zey9eadfw6lnuo64zcbh.mp4', 13.723, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '2022-08-16 07:11:30', '2022-08-16 07:11:30'),
('11aad455-945c-4ac1-9ff4-b56904afee4c', 'Project', 'Project Video', 'https://res.cloudinary.com/dev-empty/image/upload/v1660633959/wmp0xk23vaqmwfb7bvt3.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660633957/sgkdeqyltqzizuatjigv.mp4', 15.182, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '2022-08-16 07:12:40', '2022-08-16 07:12:40'),
('3a858fce-8795-4e9e-b8d4-7fe14e47863e', 'Introduction', 'Introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1660635409/r5tc5zabmmhagtr4w5wa.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660635408/w2abrcwvisrbylga6hmb.mp4', 13.931, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', '2022-08-16 07:36:50', '2022-08-16 07:36:50'),
('571fcdf8-a9b9-4b36-9a39-9bd67624703a', 'Introduction', 'Setting Priorities', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246823/bgty9tt6hjzysv3watvf.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246821/gvwwerhv8bxzdusvvnad.mp4', 27.561, 0, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'c5c6ee66-84df-46ee-b961-70a3ca173972', '2022-08-23 09:27:03', '2022-08-23 09:27:03'),
('6605e17d-3c26-4d01-9565-f59c9623f5e4', 'Introduction', 'Introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634707/d6rjplfgcmbnrjhaoeva.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660634704/yhwecyta11b0puhwwkgo.mp4', 17.5, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', '2022-08-16 07:25:08', '2022-08-16 07:25:08'),
('6afbf2b0-d5f5-405f-be5c-66aff4375d24', 'Introduction', 'Introduction, what you will learn and discover', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246579/pzoul4zxymhwsvgpk1vc.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246576/s9rkqxyds8j1eqfq7rik.mp4', 3.737, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '2022-08-23 09:22:59', '2022-08-23 09:22:59'),
('728f13d3-9116-4b14-984c-0871342fa162', 'Diet Plan Example for Men', 'Diet Plan Example for Men', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321596/krxhp6htpzxbi8rt1g3d.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661321594/jhkj9brhuzwqqtnllo2v.mp4', 3.737, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', '2022-08-24 06:13:17', '2022-08-24 06:13:17'),
('7e0cfbd8-1292-44b1-a93a-0834052422fc', 'Introduction', 'SAP ABAP', 'https://res.cloudinary.com/dev-empty/image/upload/v1660640995/knb0egtwurtagre0c2bn.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660640994/my3ryeymr8dzhiacrbh8.mp4', 7.524, 0, 2, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '2022-08-16 09:09:56', '2022-08-16 09:09:56'),
('7ecba8e0-92d3-4d55-a874-a0bca9038418', 'Accounting and Finance', 'Accounting and Finance', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634657/gdhfodxucmkdwqmmj6fe.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660634655/fw0ku9yccybda9u9c6gy.mp4', 11.762, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', '2022-08-16 07:24:17', '2022-08-16 07:24:17'),
('895fac47-e731-412c-a947-27fb489ef818', 'Introduction', 'Key 2 Ownership', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246643/jolpp4lrgckmyyb9gsmd.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246641/nialxz7ppsdfozlrkdpk.mp4', 15.549, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '2022-08-23 09:24:03', '2022-08-23 09:24:03'),
('89ba4507-e450-473e-b82c-1bf86f927ff5', 'From assessment to action Agile leadership', 'From assessment to action Agile leadership', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321328/g6pdnywxtkr4gi5aqsqo.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661321326/nsrvkzi4dxz2tyqqihey.mp4', 15.549, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', '2022-08-24 06:08:49', '2022-08-24 06:08:49'),
('8b2ce5c0-232a-4441-896b-d78fe64bc17f', 'Introduction', 'Basic business idea', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634228/z9y1sljcm4akckkn1n1w.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660634226/lnmkkzzprveknhdv4mz8.mp4', 17.5, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', '2022-08-16 07:17:08', '2022-08-16 07:17:08'),
('9bd8d2a6-8c9f-482a-bb11-bdc83fcf6e3a', 'Before We Begin', 'Before We Begin', 'https://res.cloudinary.com/dev-empty/image/upload/v1661322036/ifsvlvrm0leoct92zhwo.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661322032/jkoszozrilpyne8mn65i.mp4', 16.7033, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', '2022-08-24 06:20:37', '2022-08-24 06:20:37'),
('a7aad65e-568b-4e09-ac2f-6a23b5640c06', 'Introduction', 'Installing VirtualBox on Intel-Based Macs', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246261/aiuyy5fu09gzt4c4jtrj.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246259/uomy6a0qysnmgicbb6lv.mp4', 13.931, 0, 3, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:17:42', '2022-08-23 09:17:42'),
('a8aec4be-707b-410d-a887-ad33d660d1ac', 'Introduction', 'Course introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1661320758/zlllw1oqwpzoc8cjfxtz.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661320753/umpgo4hxrxpst5fddnik.mp4', 15.182, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', '2022-08-24 05:59:19', '2022-08-24 05:59:19'),
('bbe49bf9-86a0-41b9-9ec1-b4f7ef966e7c', 'Introduction 2', 'Introduction 2', 'https://res.cloudinary.com/dev-empty/image/upload/v1661317924/nkxupqaykiyns4q5pft9.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661317921/ryn66wyo1uqcfjfsgbh5.mp4', 15.182, 0, 0, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', '2022-08-24 05:12:05', '2022-08-24 05:12:05'),
('bf3be034-ef30-47c0-afe3-75f2fa15e09c', 'Introduction', 'Introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246119/polfjt273mrfivldozwf.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246117/bbwy7trp6707pwcbzxow.mp4', 13.723, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:15:19', '2022-08-23 09:15:19'),
('d0ebd79e-08f2-40db-89b2-703f886a7e9d', 'Introduction', 'Lenux Distributions', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246202/s96gtx40hjsdvmmuz7tv.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246197/j0l1gvvlcwstb2pxjay6.mp4', 15.182, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:16:42', '2022-08-23 09:16:42'),
('f2587d22-96e2-4349-ae57-60d907b2a500', 'Benefits of exercise', 'Benefits of exercise', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321832/lrkg87blmrq17ywjxjpt.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661321830/y3xopkmxg7kvwtjhftt8.mp4', 8.171, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '308cdeb3-b61f-4fca-a139-9bb219282dd3', '2022-08-24 06:17:12', '2022-08-24 06:17:12'),
('fdf70912-4a8c-4613-821f-f1c59a26f857', 'Introduction', 'Beginning ', 'https://res.cloudinary.com/dev-empty/image/upload/v1663504993/arxmxkglcc3smwqy2qem.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1663504991/t6pvq0j50qctx0ajrgcz.mp4', 13.723, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4d', '75555389-1085-44b9-9dfb-524c3bdafff0', '2022-09-18 12:43:14', '2022-09-18 12:43:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `userId` (`userId`),
  ADD KEY `catId` (`catId`);

--
-- Indexes for table `course_assets`
--
ALTER TABLE `course_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `course_progresses`
--
ALTER TABLE `course_progresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`),
  ADD KEY `videoId` (`videoId`);

--
-- Indexes for table `enrolments`
--
ALTER TABLE `enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`catId`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_assets`
--
ALTER TABLE `course_assets`
  ADD CONSTRAINT `course_assets_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_progresses`
--
ALTER TABLE `course_progresses`
  ADD CONSTRAINT `course_progresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progresses_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progresses_ibfk_3` FOREIGN KEY (`videoId`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrolments`
--
ALTER TABLE `enrolments`
  ADD CONSTRAINT `enrolments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrolments_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD CONSTRAINT `instructor_earnings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instructor_earnings_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
