-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2025 at 02:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `published_date` date DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `published_date`, `isbn`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', '1925-04-10', '9780743273565'),
(2, 'To Kill a Mockingbird', 'Harper Lee', '1960-07-11', '9780061120084'),
(3, '1984', 'George Orwell', '1949-06-08', '9780451524935'),
(4, 'Pride and Prejudice', 'Jane Austen', '1813-01-28', '9780141439518'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', '1951-07-16', '9780316769488'),
(6, 'The Hobbit', 'J.R.R. Tolkien', '1937-09-21', '9780547928227'),
(7, 'Fahrenheit 451', 'Ray Bradbury', '1953-10-19', '9781451673319'),
(8, 'Brave New World', 'Aldous Huxley', '1932-08-01', '9780060850524'),
(9, 'Moby Dick', 'Herman Melville', '1851-10-18', '9781503280786'),
(10, 'War and Peace', 'Leo Tolstoy', '1869-01-01', '9781420954300'),
(11, 'The Picture of Dorian Gray', 'Oscar Wilde', '1890-07-01', '9780141439570'),
(12, 'The Brothers Karamazov', 'Fyodor Dostoevsky', '1880-11-01', '9780374528379'),
(13, 'Crime and Punishment', 'Fyodor Dostoevsky', '1866-01-01', '9780486415871'),
(14, 'The Grapes of Wrath', 'John Steinbeck', '1939-04-14', '9780143039433'),
(15, 'The Old Man and the Sea', 'Ernest Hemingway', '1952-09-01', '9780684832504'),
(16, 'The Road', 'Cormac McCarthy', '2006-09-26', '9780307387899'),
(17, 'The Alchemist', 'Paulo Coelho', '1988-05-01', '9780061122415'),
(18, 'The Fault in Our Stars', 'John Green', '2012-01-10', '9780525478812'),
(19, 'The Kite Runner', 'Khaled Hosseini', '2003-05-29', '9781594631931'),
(20, 'Life of Pi', 'Yann Martel', '2001-09-11', '9780156012195'),
(21, 'The Book Thief', 'Markus Zusak', '2005-03-01', '9780375842207'),
(22, 'The Hunger Games', 'Suzanne Collins', '2008-09-14', '9780439023528'),
(23, 'Divergent', 'Veronica Roth', '2011-04-25', '9780062024039'),
(24, 'The Maze Runner', 'James Dashner', '2009-10-06', '9780385737944'),
(25, 'The Perks of Being a Wallflower', 'Stephen Chbosky', '1999-08-01', '9780671027346'),
(26, 'The Help', 'Kathryn Stockett', '2009-02-10', '9780399155345'),
(27, 'Gone Girl', 'Gillian Flynn', '2012-06-05', '9780307588371'),
(28, 'The Girl on the Train', 'Paula Hawkins', '2015-01-13', '9781594634023'),
(29, 'The Night Circus', 'Erin Morgenstern', '2011-09-13', '9780385534635'),
(30, 'The Time Traveler\'s Wife', 'Audrey Niffenegger', '2003-01-01', '9780151011032'),
(31, 'The Secret Life of Bees', 'Sue Monk Kidd', '2002-05-14', '9780142001745'),
(32, 'The Lovely Bones', 'Alice Sebold', '2002-01-01', '9780316043492'),
(33, 'The Glass Castle', 'Jeannette Walls', '2005-01-01', '9780743247542'),
(34, 'A Thousand Splendid Suns', 'Khaled Hosseini', '2007-05-22', '9781594483851'),
(35, 'The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', '2010-02-02', '9781400052189'),
(36, 'The Devil in the White City', 'Erik Larson', '2003-02-10', '9780375725609'),
(37, 'The Nightingale', 'Kristin Hannah', '2015-02-03', '9780452290370'),
(38, 'Where the Crawdads Sing', 'Delia Owens', '2018-08-14', '9780735219090'),
(39, 'Educated', 'Tara Westover', '2018-02-20', '9780399590504'),
(40, 'Becoming', 'Michelle Obama', '2018-11-13', '9781524763138'),
(41, 'The Silent Patient', 'Alex Michaelides', '2019-02-05', '9781250301697'),
(42, 'The Vanishing Half', 'Brit Bennett', '2020-06-02', '9780525536963'),
(43, 'The Midnight Library', 'Matt Haig', '2020-08-13', '9780525559474'),
(44, 'Klara and the Sun', 'Kazuo Ishiguro', '2021-03-02', '9780593318171'),
(45, 'The Last Thing He Told Me', 'Laura Dave', '2021-05-04', '9781501171345'),
(46, 'Malibu Rising', 'Taylor Jenkins Reid', '2021-06-01', '9781524798659'),
(47, 'The Paper Palace', 'Miranda Cowley Heller', '2021-07-06', '9780593133240'),
(48, 'Project Hail Mary', 'Andy Weir', '2021-05-04', '9780593135206'),
(49, 'The Song of Achilles', 'Madeline Miller', '2011-09-20', '9780062066210'),
(50, 'Circe', 'Madeline Miller', '2018-04-10', '9780316335770'),
(51, 'The Seven Husbands of Evelyn Hugo', 'Taylor Jenkins Reid', '2017-06-13', '9781501139239'),
(52, 'The Invisible Life of Addie LaRue', 'V.E. Schwab', '2020-10-06', '9780765387561'),
(53, 'The Guest List', 'Lucy Foley', '2020-02-20', '9780062868930');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'miftah', 'scrypt:32768:8:1$j4kU3Q1GD8psgqFZ$e873bad48d80b58e4bc086fd00edbf383c72044d636e07f90e91950d5822fe7c26902f5f70c0043e65e531568a63ec3afc98bf089d42fc4ac21a46f636cc728f', '2025-01-12 09:37:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
