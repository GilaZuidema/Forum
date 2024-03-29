-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 28 jun 2019 om 23:33
-- Serverversie: 10.1.35-MariaDB
-- PHP-versie: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum_gila`
--
CREATE DATABASE IF NOT EXISTS `forum_gila` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forum_gila`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) UNSIGNED NOT NULL,
  `category_title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `categories`
--

INSERT INTO `categories` (`cat_id`, `category_title`) VALUES
(1, 'Food Items'),
(2, 'Games'),
(3, 'Programming languages');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `replies`
--

CREATE TABLE `replies` (
  `reply_id` int(3) UNSIGNED NOT NULL,
  `category_id` int(3) UNSIGNED NOT NULL,
  `subcategory_id` int(3) UNSIGNED NOT NULL,
  `topic_id` int(3) UNSIGNED NOT NULL,
  `author` varchar(16) NOT NULL,
  `comment` text NOT NULL,
  `date_posted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `subcategories`
--

CREATE TABLE `subcategories` (
  `subcat_id` int(3) UNSIGNED NOT NULL,
  `parent_id` int(3) UNSIGNED NOT NULL,
  `subcategory_title` varchar(128) NOT NULL,
  `subcategory_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `subcategories`
--

INSERT INTO `subcategories` (`subcat_id`, `parent_id`, `subcategory_title`, `subcategory_desc`) VALUES
(1, 1, 'chinese food', 'bami, rijst, sate'),
(2, 1, 'Italien food', 'pizza, pasta, brood'),
(3, 1, 'japans', ' sushi, fish, lorem ipsum'),
(4, 2, 'Starcraft 2', 'wins, films '),
(5, 2, 'lol', 'champion, bot, mid'),
(6, 3, 'java', 'dit is java'),
(7, 3, 'php', 'how to make php');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(8) UNSIGNED NOT NULL,
  `category_id` int(3) UNSIGNED NOT NULL,
  `subcategory_id` int(3) UNSIGNED NOT NULL,
  `author` int(16) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `date_posted` date NOT NULL,
  `views` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(8) UNSIGNED NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(4, 'user 1', '12345'),
(5, 'user2', '1'),
(6, 'gila', 'gila'),
(7, 'douwe', '12345');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexen voor tabel `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexen voor tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`subcat_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexen voor tabel `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `subcategory_id_2` (`subcategory_id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `replies`
--
ALTER TABLE `replies`
  MODIFY `reply_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subcat_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcat_id`),
  ADD CONSTRAINT `replies_ibfk_3` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

--
-- Beperkingen voor tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Beperkingen voor tabel `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcat_id`);
--
-- Database: `forum_klas1`
--
CREATE DATABASE IF NOT EXISTS `forum_klas1` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `forum_klas1`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `replies`
--

CREATE TABLE `replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Gegevens worden geëxporteerd voor tabel `replies`
--

INSERT INTO `replies` (`id`, `content`, `topic_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Quia esse eveniet aut iusto doloribus. Est ut omnis architecto ex odio consequuntur. Quidem officiis ut qui. Asperiores quidem voluptatem necessitatibus alias aut cumque. Reprehenderit quam qui cumque hic et maxime facilis consequatur. Quo corrupti aut odio. Sint qui quas reprehenderit ex et. Voluptas quisquam id nulla eos eligendi. Quo consequatur autem et omnis omnis. Et ad a beatae debitis non eligendi. Perspiciatis nam earum debitis facere et odio amet cumque. Asperiores vitae reprehenderit sapiente est. Sit laudantium officiis maxime ut facilis vero.', 56, 5, '2018-01-30 09:47:15', NULL),
(2, 'Laboriosam unde sit soluta alias fugit velit voluptatem. Voluptate id similique assumenda officia optio harum aut. Dolores nobis iste rerum corporis. Quod doloremque magnam a officiis tenetur. Reprehenderit et quis suscipit aut itaque. Deserunt sed similique porro ut voluptas delectus enim. Qui sed dolor ut aliquid quae quod adipisci. Cumque illum qui ut et dicta quidem quasi.', 14, 10, '2018-01-30 09:47:15', NULL),
(3, 'Quibusdam autem repellendus reiciendis voluptas. Assumenda velit voluptatem iste in distinctio enim et facere. Eos quo dolorem eveniet quae eaque praesentium. Numquam quae rerum omnis. Quisquam eos iste eaque ad expedita magni. Amet corrupti non earum consequatur esse similique quam. Voluptas exercitationem nihil quia vel pariatur dolorum sapiente. Provident ut quo impedit. Rem quisquam qui alias cupiditate ab nesciunt. Ea dolores dolor voluptatibus dolorem voluptatibus. Architecto aut tempore adipisci saepe sit. Corrupti vitae cum sed laborum quae nostrum qui soluta.', 26, 4, '2018-01-30 09:47:15', NULL),
(4, 'Quos eaque ipsum ut quia. Omnis sit et corporis eos at. Ut dolor et in qui perspiciatis minima et. Quia voluptates ea magni harum necessitatibus quam. Ut voluptatem hic aut officia. Qui cumque enim quia commodi voluptates et vel. Saepe ut veniam nemo consequatur. Et temporibus et cumque hic aut. Fuga quos accusantium expedita delectus aspernatur. Dolores quasi quibusdam rerum modi. Enim aut laborum qui omnis. Optio rerum consequatur minus accusamus.', 23, 8, '2018-01-30 09:47:15', NULL),
(5, 'A eligendi qui exercitationem dicta eos ea. Nulla nihil et impedit eum quasi ut ad. Vel minus cupiditate possimus error. Ducimus dignissimos quis qui nam ipsa quas. Voluptas soluta aut unde esse quidem et. Repudiandae doloribus rem commodi aperiam. Et non ab aut fugiat. Et nesciunt ut labore vel nesciunt deserunt aspernatur deserunt.', 51, 9, '2018-01-30 09:47:15', NULL),
(6, 'Occaecati cum ex aut dicta. Aut provident officiis harum dicta. Qui eos nostrum accusantium natus animi. Ipsam praesentium qui dolorem aliquam. Ad voluptate error rerum aut. Dignissimos blanditiis est totam vel id ab. Quia id sed adipisci suscipit quidem. Explicabo itaque ipsa praesentium. Earum vitae voluptas quo laudantium et quas. Ipsum ab quibusdam saepe voluptatibus maiores excepturi. Dolorem enim aliquam non. Inventore molestias porro ut amet rem et et. Sequi atque molestias similique cumque minus. Tempore maiores doloribus fugit iusto.', 50, 10, '2018-01-30 09:47:15', NULL),
(7, 'Ut rerum ea maxime blanditiis. Est consectetur voluptatem dolorem excepturi expedita rerum consectetur. In quos necessitatibus esse. Illo repudiandae ex corporis doloribus inventore dignissimos optio non. Quia qui accusamus ullam autem aliquid. Non et dolorum sit reiciendis. Repellendus qui itaque et beatae et illum ut.', 13, 1, '2018-01-30 09:47:15', NULL),
(8, 'Deserunt ut qui voluptas. Necessitatibus in beatae et libero. Eum eos incidunt quia soluta dolor ut aliquid. Aspernatur aperiam enim molestias ratione placeat nulla vero ducimus. Dolores quis et quia fugiat libero architecto ea molestias. Aut minima sunt repellat dolorem id qui. Architecto quaerat est sunt pariatur temporibus et. Magnam ab voluptas sequi rerum ducimus optio ipsa.', 38, 5, '2018-01-30 09:47:15', NULL),
(9, 'Ut sequi assumenda exercitationem ut vitae pariatur. Est eos ullam esse doloremque earum est est. Delectus accusamus unde est labore consequatur nostrum consequatur. Architecto molestias itaque fuga facere vel. Quo voluptates aut autem amet. Dolore harum aut facere sint amet voluptates ratione. Quisquam natus corrupti aut amet. Deleniti molestias quidem earum consequuntur quasi vitae.', 1, 8, '2018-01-30 09:47:15', NULL),
(10, 'Ducimus officia atque autem deleniti praesentium. Ipsa quod quisquam ducimus possimus eos impedit eveniet. Possimus fugiat eius suscipit voluptatem quia cum quis recusandae. Voluptatem quis cum porro iure a id. Temporibus voluptatem saepe reprehenderit reprehenderit consequatur rerum quod corporis. Sit est sunt quis quia. Et earum quos nisi doloremque eius culpa fugit numquam. Accusamus enim quos soluta ut voluptas assumenda sint. Incidunt voluptas ratione laborum sunt est. Ut dolorem ullam quae quis aut sit.', 6, 4, '2018-01-30 09:47:15', NULL),
(11, 'In ut tempore sit necessitatibus nihil. Ad sunt ut alias quis accusamus sint. Eveniet dolorum nulla eius ex exercitationem dolorum. Assumenda quibusdam necessitatibus odit est assumenda pariatur. Non voluptatem sed voluptatum corrupti ducimus ut neque. Explicabo nemo est qui similique dolor sed. Ut dignissimos laboriosam dolor quia quod et minima. Quia est sit voluptas enim et aut rerum et. Cumque optio ipsum sunt ut id quaerat.', 19, 5, '2018-01-30 09:47:15', NULL),
(12, 'Aspernatur autem dignissimos qui odit quis. Quia aspernatur rem non impedit hic unde labore. Odit quia nesciunt dolores. Voluptas minus natus exercitationem cumque. Iusto ab maxime nulla modi vel inventore mollitia. Pariatur quia non sit qui provident similique velit ut. Ullam doloribus molestiae fugit.', 6, 7, '2018-01-30 09:47:15', NULL),
(13, 'Officia perspiciatis et quos. Optio non consequuntur maiores. Earum consequatur explicabo error voluptas vitae quod. Exercitationem sit ut delectus vitae voluptate et. Tempora est perspiciatis a non occaecati. Ut rem voluptatem magni quos enim. Debitis consectetur repudiandae modi ullam quia nostrum aspernatur. Sequi qui impedit quae esse dolorem esse quod. Tempora praesentium adipisci rerum illum error reiciendis neque aspernatur. Ut voluptatem neque et deserunt cum hic. Eveniet et at ut magni. Provident quisquam culpa aliquid minus recusandae numquam.', 34, 11, '2018-01-30 09:47:15', NULL),
(14, 'Aut et provident saepe dolor et ut. Id natus incidunt quo. Qui et accusamus voluptatem neque facere eos. Non culpa sit eos sunt eius temporibus. Sapiente hic consequatur ab. Et consequuntur et neque harum. Quisquam ullam rerum distinctio ut tempora suscipit. Pariatur blanditiis omnis libero minima nostrum hic ipsa. Molestiae ut explicabo omnis. Quae nemo quaerat quibusdam id doloribus nemo quaerat. Praesentium ut ex a voluptatibus assumenda. Ut exercitationem quo nobis omnis exercitationem est ut iure. Repudiandae mollitia consequuntur libero voluptas adipisci. Placeat et quo atque. Nulla dolorem neque debitis expedita.', 35, 2, '2018-01-30 09:47:15', NULL),
(15, 'Magnam aut illum tempore. Facilis nam deserunt sunt quae facere eos aliquam. Voluptatum eos quia esse consectetur et adipisci. Ut vel dolores quia qui vel cum sit. Et in autem sed magni modi ipsa. Laborum perferendis non illo pariatur ad. At et quidem provident minima. Laudantium aperiam optio explicabo illo neque et. Dolor qui nemo ut quam est recusandae.', 23, 8, '2018-01-30 09:47:15', NULL),
(16, 'Libero voluptatibus harum id hic. Nulla consectetur minus veniam distinctio debitis. Dolore est aut occaecati iusto enim quibusdam rem aperiam. Fugiat a assumenda sit. Quia maxime quae veniam ullam non dicta possimus ut. Mollitia minima fugit aut commodi quod commodi. Saepe porro dolor unde et optio.', 43, 8, '2018-01-30 09:47:15', NULL),
(17, 'Ea unde quam quaerat consequatur officiis iure velit libero. Molestias est necessitatibus quia quia. Animi sed asperiores rerum. At veritatis delectus aut eligendi tempora eaque quia. Repellendus eligendi voluptatem vel voluptatem nesciunt. Delectus sit consequatur consectetur quasi laudantium deleniti. Perferendis rerum quasi provident delectus enim sit voluptatibus deleniti. Sit quasi ab doloribus.', 46, 5, '2018-01-30 09:47:15', NULL),
(18, 'Iste fuga quibusdam et doloremque in. Autem et ut numquam ipsum. Commodi non voluptatibus et quia omnis qui pariatur. Ea molestiae harum qui. Neque aut recusandae at veritatis. Tempore est quo consequatur nostrum. Nam minus dignissimos fugit vero veritatis quia labore nemo.', 58, 5, '2018-01-30 09:47:15', NULL),
(19, 'Voluptatem ipsum est provident error officiis animi. Enim neque incidunt accusantium. Consequuntur error corporis sed in. At quas voluptas rerum aut iste maiores. Atque magni est quis autem expedita. Quos qui ut veniam quidem quos harum placeat sed. Est in voluptatem nemo minima ratione autem voluptatem. A qui est non ipsa beatae fugiat soluta vel. Adipisci magni reprehenderit et consequatur autem. Dolor aliquid minus quod totam ut sit temporibus minus. Animi non vel excepturi cum. Molestias error quia molestias nihil quae.', 37, 11, '2018-01-30 09:47:15', NULL),
(20, 'Excepturi commodi est facere alias dolore non ut. Nobis ea adipisci dolorum illum deserunt soluta provident. Impedit aut sed cupiditate molestiae. Et mollitia beatae porro repellat quidem nisi nihil. Ut est incidunt impedit. Magnam incidunt ab nulla molestiae et magni sint magni. Sequi accusamus modi amet illum nihil incidunt qui. Voluptatibus facilis eos consequatur debitis est. Assumenda sit quasi quod sequi magni et quisquam. Corporis et blanditiis ipsum adipisci. Consequatur facilis aut sit eligendi ullam molestias. Nostrum occaecati voluptatem maxime aliquid in dolorem.', 40, 3, '2018-01-30 09:47:15', NULL),
(21, 'Aut non omnis et quo. Recusandae autem odio et itaque libero dolor. Voluptatem quia ipsa ut corporis quae maiores et. Sunt deserunt cum excepturi quam vel deserunt ullam. Ut inventore autem totam et fugit. Corporis et quisquam praesentium est et eligendi sed voluptas. Ut reprehenderit unde quia et sapiente. Sit debitis dolorum facilis cupiditate. Fugiat illo alias non quasi hic sint atque.', 45, 7, '2018-01-30 09:47:15', NULL),
(22, 'Ut iste quia ab velit. Non consequatur doloribus provident. Nisi dolore beatae laudantium qui ab fugit. Voluptatem omnis quis minus illo placeat quod est quasi. Veniam dolor iusto laudantium eos. Et facilis ut quia ipsum qui. Animi nihil rerum quasi commodi. Porro sint praesentium mollitia id odit eius. Laudantium dolore natus amet earum quasi odio explicabo.', 24, 1, '2018-01-30 09:47:15', NULL),
(23, 'Possimus consequatur tempore sint necessitatibus veniam. Ut ut odit sed veniam aut possimus. Sequi aliquam ipsam molestias corrupti ex recusandae in. Est reiciendis qui quia doloribus atque id. Delectus ipsa asperiores vitae. Sed nobis aut praesentium velit quo. Velit quia doloremque odit maxime sint expedita nesciunt nihil. Accusamus quibusdam ex possimus quibusdam qui. Tempore aut id ut esse eaque. Et est et et.', 46, 10, '2018-01-30 09:47:15', NULL),
(24, 'Consequuntur et consequuntur quia ducimus voluptatem iure vel ad. Dolores ut reiciendis vero totam necessitatibus. Aut molestias voluptate quia rerum. Consequatur nulla libero laboriosam quasi rem excepturi facere reiciendis. Consequatur adipisci eum corporis minus laboriosam delectus. Iure ratione nobis ipsam eos modi. Accusantium quam velit et. Incidunt id in temporibus laborum.', 25, 11, '2018-01-30 09:47:15', NULL),
(25, 'Quae eum maxime quibusdam iusto vero sed ut illo. Voluptatum voluptas iusto nobis sed optio veniam voluptatibus. Reiciendis quo nobis qui excepturi et fugiat consequuntur. Aperiam porro minima deserunt dolor enim est. Quidem sed nobis sed optio dolores ipsam. Molestiae dolores consequatur amet ipsum ea recusandae. Sunt id dolorem repellat qui ducimus animi corporis. Voluptatem voluptatem neque soluta aliquid dignissimos ipsa. Dolor nulla sunt molestiae similique ducimus est et quis.', 42, 9, '2018-01-30 09:47:15', NULL),
(26, 'Quidem est et nobis a. Consequatur deleniti amet reprehenderit minima itaque est. Quibusdam sit laudantium eaque ullam sed. Ea non et aut est enim. Laboriosam non totam voluptatum vitae nesciunt quis. Est quod ea corrupti aut. Sunt voluptate at accusantium et ut omnis. Quis voluptatem nam voluptatem et eum ducimus qui. Molestiae odio reiciendis quidem sint aperiam. Repellat sit laudantium possimus et ab rerum sequi ut. Maiores harum quae aliquam ut. Voluptas est ad voluptatum eos voluptatum quas reiciendis. Reiciendis dolorem magnam incidunt corrupti et.', 51, 11, '2018-01-30 09:47:15', NULL),
(27, 'Et et sed iste commodi eveniet sed libero enim. Necessitatibus quam amet et quis. Voluptates delectus iusto nostrum dolorem repellat. Doloribus deserunt velit quaerat voluptatum. Illum dolorem velit optio illo ut eum aliquam. Sed et nulla exercitationem natus aspernatur qui sunt. Iste nulla minus labore. Exercitationem quae quia ut omnis beatae pariatur.', 4, 11, '2018-01-30 09:47:15', NULL),
(28, 'Vero qui nulla dolorem qui. Est assumenda placeat explicabo ut culpa delectus amet. Et enim eius impedit nihil aspernatur voluptatibus. Assumenda quia fugiat consequatur asperiores velit velit eius. Dolore necessitatibus asperiores temporibus laborum. Dolores modi corporis qui fugiat ipsam ex excepturi voluptas. Maxime et nisi est officia. Rerum et asperiores ex pariatur possimus soluta omnis. Molestiae voluptatum sequi quo nemo voluptas explicabo et in. Voluptate cupiditate hic corporis magni cupiditate ipsum eaque. Ducimus libero odio nihil animi voluptatum. Itaque voluptatem accusantium delectus dolore consequuntur et doloremque. Qui non iste omnis qui eum.', 9, 2, '2018-01-30 09:47:15', NULL),
(29, 'Unde repudiandae sed non eligendi aliquam. Iure corrupti mollitia odit qui fugiat provident odit. Eum eos error fuga est voluptas adipisci at. Ea enim natus consectetur magnam ut est neque. Qui sequi necessitatibus recusandae sequi recusandae. Possimus omnis hic explicabo nam. Deleniti debitis adipisci fugit deserunt ea nulla. Placeat expedita porro harum voluptas nam esse nesciunt. Quo qui quia et similique qui beatae. Vel ut libero doloribus dolores.', 34, 5, '2018-01-30 09:47:15', NULL),
(30, 'Explicabo eius omnis eum assumenda. Eaque provident minus officia facilis explicabo. Deserunt ipsum hic quia soluta dolorem ut ab. Vitae nam eius ea. In harum facere sit qui. Est reprehenderit quis voluptatibus et culpa modi et minima. Ut omnis at quas excepturi ex minima. Est ut dolores magnam laborum et.', 37, 4, '2018-01-30 09:47:15', NULL),
(31, 'Impedit optio aperiam error. Qui unde quidem quia autem fugit. Non libero provident occaecati quasi sed exercitationem. Quis earum numquam optio aut consequatur incidunt repudiandae sit. Et ut aliquid id quod eos. Soluta natus fuga sint velit. Reprehenderit molestiae unde eum ea ab esse aut. Qui libero ullam aut. Non voluptatem qui quisquam quibusdam qui inventore. Nihil corrupti omnis dolorem aut est esse mollitia. Ipsam doloremque dolorum esse pariatur. Ut dolore asperiores voluptatibus consequuntur. Sequi ad omnis qui ab minus vel velit. Sequi deleniti excepturi ut et molestiae ab.', 50, 11, '2018-01-30 09:47:15', NULL),
(32, 'Ut itaque sint ipsa corporis. Omnis ipsa minus aut similique dolorem et. Dolorem quia aliquid sit illum. Sed quidem autem repudiandae qui voluptas. Nesciunt ea suscipit expedita occaecati sit. Sed dolores perspiciatis qui architecto et unde dolores. Nulla et consectetur atque eveniet. Modi natus eius eaque rerum voluptas sint dicta eveniet. Nobis aperiam pariatur ut ut accusamus tempora. Libero pariatur fuga id quibusdam aliquid quo.', 20, 5, '2018-01-30 09:47:15', NULL),
(33, 'Vel recusandae pariatur velit asperiores cupiditate. Sit quaerat sunt velit autem sequi placeat aliquam distinctio. Aut ut voluptatem quam ut voluptas vel. Dolores temporibus omnis vel quae. Qui id amet quasi accusantium blanditiis vero. Blanditiis beatae porro dolores id est. Atque et repellendus quas aut et perferendis dicta. Id nisi voluptatem adipisci. Et asperiores ut vel nostrum.', 42, 7, '2018-01-30 09:47:15', NULL),
(34, 'Qui vitae minus quisquam. Eum facilis saepe esse voluptates error vel qui fuga. Minus qui eos sit deserunt dolor. Commodi modi nobis sit veniam consequatur temporibus. Excepturi voluptas sapiente quisquam quia id similique. Fuga et eum molestiae maxime natus. Corrupti est nulla illum repellendus. Est illo iure dolorum eligendi vero. Ab quis ipsum rerum assumenda eos. Non molestiae repudiandae commodi nihil.', 54, 3, '2018-01-30 09:47:15', NULL),
(35, 'Consequatur velit debitis excepturi temporibus. Repellendus quia explicabo adipisci et fugiat eum labore. Consequatur temporibus eaque numquam perspiciatis cumque et provident minus. Et assumenda consequatur ea non. Quia fugit dolorum impedit similique. Accusantium maiores facere et dolorem. Ut labore vero occaecati tempore voluptatum. Velit corrupti rerum ab libero. Officia sequi et omnis qui iste iure saepe.', 12, 9, '2018-01-30 09:47:15', NULL),
(36, 'Ex nostrum ipsa nostrum. In quaerat dolorum natus nemo natus. Expedita iure ut nostrum omnis alias voluptatem non. Voluptatem sed quidem suscipit numquam non maiores. Et velit consectetur explicabo est facilis neque. Quidem dolorem autem quis libero laboriosam. Sapiente ut et accusantium qui ea iure. Tempore illo non rerum. Labore aut iste est qui quisquam ratione praesentium molestias. Nam quidem dignissimos harum. Velit sed aliquid fugit sed facilis. Ut rerum quibusdam omnis aut est rerum. Nostrum amet et quis cum. Rerum quis hic quibusdam accusamus optio ipsam.', 58, 11, '2018-01-30 09:47:15', NULL),
(37, 'Quae cupiditate dignissimos quia dolores est aperiam est. Labore in id tenetur in deserunt sint optio. Cupiditate error voluptas voluptatem molestiae vitae libero neque. Dolores ut dolor minima veritatis. Veniam est culpa cum qui consequatur enim ea. Minus minima vitae id et temporibus ipsa eos. Ut corporis eaque et officia nam id sunt cumque. Doloribus natus earum a temporibus sit numquam. Labore quia vel quis aut. Sunt voluptate consequatur quia aut explicabo ea consequuntur. Qui ex excepturi voluptate architecto ut dolorum animi aut. Quisquam aperiam ut provident totam. Laboriosam ut qui expedita possimus consequatur. Explicabo iusto illum quos aliquid aut quod.', 8, 7, '2018-01-30 09:47:15', NULL),
(38, 'Ducimus sequi repudiandae quo. Ipsam praesentium illo aperiam consequuntur rerum vitae. Aut et ipsum aperiam qui accusamus nostrum fuga. Sit amet quisquam sunt similique. Rem beatae qui esse aut. Maiores minima repellat vel dolorem ex voluptatem impedit. Dolorem quo ut laudantium deserunt sit officiis. Sit minima mollitia doloribus eum quo. Est tenetur quis inventore in atque qui. Hic quidem molestiae tenetur velit magnam. Ab eaque harum eum cum eum. Quis culpa dolorum hic et veniam cupiditate corrupti. Fugit tempora dicta non sit.', 5, 2, '2018-01-30 09:47:15', NULL),
(39, 'Aperiam porro dicta soluta beatae provident facilis possimus. Harum amet nam voluptatum reiciendis et. Ducimus ullam cum expedita deserunt soluta. Quisquam facilis vel laborum sunt tempore. Maiores voluptas et illo porro veniam maxime laudantium. Sit corrupti eveniet mollitia dolor quod minus. Ipsa est rerum perferendis ea.', 45, 10, '2018-01-30 09:47:15', NULL),
(40, 'Non et impedit at sit sed enim. Harum deleniti nulla omnis praesentium. Dicta dolorum neque sit explicabo. Debitis aut omnis natus et. Velit consequatur fuga modi natus nobis minima. Dignissimos quod placeat voluptas repellat vitae. Quas provident rerum hic deserunt eos.', 47, 8, '2018-01-30 09:47:15', NULL),
(41, 'Non possimus quo repellendus dignissimos fugiat quod. Ut omnis quas accusantium est rerum magni et velit. Vel id nesciunt a exercitationem ea laborum ducimus dolorem. Sint ex odio enim laboriosam eveniet. Veritatis autem qui est perferendis. Facere distinctio dignissimos voluptate velit vitae voluptates error. Quia sit consequatur placeat doloremque. Earum reiciendis voluptatem temporibus et quo deserunt asperiores omnis. Vel temporibus ratione libero commodi eum quo odio. Eum sit soluta dicta sint. Qui magni error laudantium incidunt.', 40, 9, '2018-01-30 09:47:15', NULL),
(42, 'Rerum ab ut odio similique. Tempore voluptatem autem quia omnis provident. Nulla sint animi et ratione quo. Eius voluptates dicta accusantium quod. Voluptas quo est tempora et similique consequuntur commodi. Culpa qui eum porro iste qui ex. Non neque aspernatur corporis aperiam ex eum quas.', 55, 6, '2018-01-30 09:47:15', NULL),
(43, 'Qui ratione veritatis suscipit libero. Corrupti commodi aut quae aut. Facere reiciendis numquam sint et fuga. Pariatur sit eaque voluptas cupiditate. Eius dicta sequi illo aliquam quod iusto cupiditate. Debitis odio quisquam dolores et iste quibusdam est. Impedit ut minus et quia quo eum modi. Suscipit impedit in qui quaerat distinctio pariatur. Doloremque architecto debitis nam quis minus incidunt soluta. Nam odit asperiores est tempore incidunt inventore. Sit debitis nemo reprehenderit adipisci ut.', 19, 10, '2018-01-30 09:47:15', NULL),
(44, 'Quisquam rem molestias rem ipsam. Saepe modi error rerum vero necessitatibus impedit. Deleniti repellat autem itaque autem sint voluptatem. Animi ea eos doloremque. Iusto est eveniet in illum saepe ex necessitatibus. Qui quia id aut. Ut qui sunt qui eligendi. Eos quia sapiente quos. Ut facere sit ullam eum.', 56, 11, '2018-01-30 09:47:15', NULL),
(45, 'Consequuntur ut quod doloribus necessitatibus. Dolorum porro pariatur corporis maiores enim. Architecto fugit et sed cumque necessitatibus dignissimos. Nam est et ullam nihil voluptatem et. Cum deleniti hic ipsum laborum accusantium. Quas sed voluptates eos occaecati. Natus error rerum saepe et est dolorem laborum. Quo nostrum impedit omnis rem iste est. At qui est iste possimus nesciunt nihil. Consequatur deserunt temporibus sed itaque. Velit eius officia possimus rem ea est corrupti quia. Quia temporibus expedita accusantium quas a iure eum quam. Facilis beatae aut officia sequi et commodi et. Dicta qui corporis incidunt quia.', 44, 2, '2018-01-30 09:47:15', NULL),
(46, 'Rerum fugiat quo unde voluptatem accusamus dolorem vitae ut. Ipsam consequuntur architecto cumque aut similique. Et voluptas tenetur dolorem animi. Consequatur et sapiente modi illum. Ut quam minus et quas unde. Neque quo et omnis corporis aperiam repudiandae eius libero. Tempore sunt ut at officia est modi saepe. Aut eligendi nobis qui ea aspernatur. Et et ex amet laboriosam fugiat nisi est dolorem. Quia esse laudantium praesentium.', 27, 7, '2018-01-30 09:47:15', NULL),
(47, 'Nihil rerum ut quisquam sed. Est ex quo consequatur repudiandae quo numquam et. Dolor sint ut suscipit et. Cupiditate magnam suscipit omnis. Dolorum quia aut optio eos. Nulla pariatur repellendus voluptatem. Assumenda unde vel odit. Deserunt dolore officia fugiat cupiditate.', 1, 3, '2018-01-30 09:47:15', NULL),
(48, 'Esse corrupti reprehenderit rerum alias quas perspiciatis laboriosam. Atque quia quae aut. Eius et quos quasi reiciendis quia accusamus. Odio voluptatem ipsa facilis unde totam. Voluptatibus facilis aperiam amet saepe odio repellat. Rerum eos mollitia excepturi delectus. At veniam occaecati veniam consequatur qui. Voluptate occaecati minus eveniet consectetur esse enim consectetur. Perferendis odio quos eos voluptatum exercitationem id. Temporibus quia tempore rerum quaerat aliquam. Dolores a necessitatibus illo aut repellat assumenda. Vel aliquam corrupti quibusdam repellendus. Cumque et nihil doloremque eos accusantium quia.', 9, 3, '2018-01-30 09:47:15', NULL),
(49, 'Delectus voluptatem ut unde at. Recusandae exercitationem odit sint ipsum vero ab rem. Autem a voluptates vel perspiciatis aut reiciendis. Modi doloribus aspernatur autem quos. Quis natus molestiae est ex earum. Et amet dolores voluptatem hic fugit. Dolor labore vero consequatur quia libero. Tenetur nemo non nobis dolorum architecto sapiente. In voluptas veniam est. Nobis recusandae nihil aut in. Veniam aut doloribus nihil quos. Alias explicabo soluta maiores tempore placeat ullam nihil.', 11, 1, '2018-01-30 09:47:15', NULL),
(50, 'Autem illum eos sapiente asperiores qui et veritatis. Laboriosam eos distinctio voluptatum dolores veniam minus totam qui. Quos explicabo vitae dolores unde et id. Aut sit deleniti reprehenderit cumque odit qui accusantium. Qui repudiandae ea eius architecto rerum ut. Expedita debitis quidem rem laudantium est. Repellendus rerum aut quae inventore ex labore iure. Et expedita aspernatur dolor magnam doloribus inventore fugit. Sequi a blanditiis saepe repellendus quisquam culpa.', 11, 2, '2018-01-30 09:47:15', NULL),
(51, 'Sint accusantium odio veritatis repellat est. Repudiandae officia dolores officia voluptas et aut omnis. Nobis veritatis voluptates et quas rerum. Earum a quibusdam ex aut et cupiditate. Sint sint recusandae est placeat error ipsam maxime. Assumenda iure laboriosam distinctio molestiae. Distinctio voluptatum labore et animi. Esse sint ex ducimus dolorem omnis. Maiores aut possimus dolores velit est. Ut omnis odio dolores facere. Molestiae aut quaerat hic voluptatibus eum porro illo et. Doloremque consequatur nihil totam. Sit a quisquam sit vero beatae ut. Omnis odio et non maxime dignissimos.', 41, 7, '2018-01-30 09:47:15', NULL),
(52, 'Ratione voluptatem at fugit quisquam esse non veniam. Consequatur quis accusantium sed porro quas unde quo. Temporibus aut eaque mollitia incidunt. Accusamus libero possimus asperiores sit labore. Id velit nesciunt natus cumque. Minus aut error ratione eveniet magnam accusantium alias. Dicta voluptas qui ut et ex eius et. Doloribus sint illum et odit unde. Dolorum quas ea aut voluptatem hic. Non ut impedit tenetur et magnam.', 54, 7, '2018-01-30 09:47:15', NULL),
(53, 'Deleniti aut quae facilis ut repellendus quos. Ipsum quas expedita id ipsa fugit et illum amet. In consequatur sit repellendus laudantium aliquid hic dolor incidunt. Id ea officia placeat hic enim. Sit adipisci nostrum numquam minus aut a rerum. Eaque ullam facere temporibus corporis nisi. Non rerum voluptatum placeat animi iste dolorum. Alias aut aut earum sed fugit accusamus est.', 24, 5, '2018-01-30 09:47:15', NULL),
(54, 'Est ipsum aut voluptatem ipsa et et officia magnam. Amet repellendus qui iure voluptatem qui. Et commodi sunt omnis ratione quo suscipit. Aut autem quaerat quidem placeat nam. Voluptatum qui ipsam officiis nam nobis tenetur. Necessitatibus distinctio mollitia at tenetur deserunt error. In animi ex ducimus molestiae. Et architecto blanditiis eum nihil voluptas. Sit est ut pariatur quis. Autem quis ut illo deserunt eum. Error dicta harum iure in fugit et ut deleniti. Doloribus ipsam et accusamus voluptatem. Delectus quas illo distinctio quis ipsum veritatis ut. Magnam alias exercitationem necessitatibus.', 49, 9, '2018-01-30 09:47:15', NULL),
(55, 'Corrupti quis fuga molestias. Aliquam tempore consequatur vero et architecto eius aut. Est cum deleniti est odit voluptas minima illum. Aliquam asperiores quis magni cupiditate dolor vel accusamus mollitia. Aut eius quia quo qui impedit in dolores. Nesciunt et voluptatem consequatur ut maxime corrupti nam. Sequi dicta hic esse voluptatem. Atque tempora eum iure molestiae. Et quod nihil molestiae autem dolorem in. Deleniti in velit corrupti. Dicta laudantium ut quae. Minima molestiae perferendis earum maiores porro tempore aut.', 22, 10, '2018-01-30 09:47:15', NULL),
(56, 'Qui laudantium quis dolorem. Aut qui officia consequatur quasi rerum. Corrupti quam labore nihil tenetur. Error impedit sed dolor eius aliquam deserunt nobis eos. Et dignissimos non nesciunt et qui. Eos molestiae ullam ad recusandae ea. Cumque sed fugit ut. Saepe dolorem sit dolorem a enim aut. Aut facere ut ullam adipisci. Reprehenderit ratione adipisci sed suscipit vitae deleniti. Aperiam sunt error non et rerum. Laudantium odio quasi explicabo nobis est praesentium.', 12, 1, '2018-01-30 09:47:15', NULL),
(57, 'Suscipit excepturi fugiat quia veritatis eos. Modi id consequatur aut autem tempora. Et quo temporibus eum dicta officia et voluptate corporis. Omnis et est perferendis qui. Et voluptatem ut ad animi et voluptatem. Quia numquam voluptas quam fuga non dolor. Officiis quia sed repellat fuga nobis rerum. Assumenda ex in reprehenderit voluptatem id quae soluta esse. Ut labore dolorum harum et dolor culpa. Iste recusandae hic quae nam. Et omnis quis ut recusandae.', 42, 7, '2018-01-30 09:47:15', NULL),
(58, 'Omnis iste consequatur perspiciatis et voluptas. Libero ab qui quas vel non fugiat numquam. Dignissimos eveniet rerum qui debitis. Voluptas perferendis adipisci et sed dolorem. Ut culpa dolorum vero nihil dolorem sint. Voluptatibus adipisci et enim et cupiditate facilis dolorum omnis. Quis cumque cupiditate id et rerum.', 11, 7, '2018-01-30 09:47:15', NULL),
(59, 'Ad magni sint dolorum occaecati officia ut. Expedita delectus labore a. Deleniti numquam earum est voluptatem nemo. Doloribus vero quia soluta repellendus soluta in. Et officiis tempore tempora quasi aut aliquid ab. Aut in aliquid natus iure. Perspiciatis rerum voluptatem exercitationem sit. Et autem aut accusantium aliquam sint tempora id. Ex iusto corporis magni provident.', 39, 3, '2018-01-30 09:47:15', NULL),
(60, 'Enim sunt quis fugiat quia et. Nostrum similique ullam nobis nihil sit dolorem. Sit omnis dolor voluptates. Vero aperiam aliquam quam eum voluptatem ex omnis. Blanditiis quidem quidem iure pariatur aut molestiae omnis. Neque delectus nisi ut deleniti corrupti. Quia nobis natus quae expedita nihil sint. In qui voluptatem beatae nobis. In harum id quis quo. Fuga ipsam non quam et. Velit similique tenetur molestiae quibusdam sed. Eligendi fugiat est soluta aut praesentium asperiores.', 16, 11, '2018-01-30 09:47:15', NULL),
(61, 'Adipisci sunt et dignissimos. Fuga iusto assumenda et iste in quia. Repudiandae sed aperiam ipsam dolore. Animi fuga ut aut id aliquam. Minima fugiat error amet sit. Magnam quibusdam cumque esse. Tempore minus quae labore quisquam et dicta nostrum. Corporis dolorem repellendus velit esse. Est qui enim sequi. Non libero voluptas voluptas qui vel omnis vel. Natus soluta ipsam qui corrupti voluptas quibusdam. Sit sunt autem blanditiis maxime ab eum. Perspiciatis fugiat repellat error sit quo. Necessitatibus corporis labore vel tenetur.', 6, 7, '2018-01-30 09:47:15', NULL),
(62, 'Cumque recusandae deserunt dolorem velit. Sint inventore in sed. Omnis qui sit rerum labore ut corrupti corrupti aut. Expedita molestiae sequi sit. Quo aliquam amet consequatur molestias temporibus earum. Est quidem omnis molestiae itaque porro. Quam doloremque a quas dolorum sit ad. Ea illo provident ea aliquid. Illum at veritatis voluptates iste temporibus eligendi eum. Consequatur aut expedita voluptates reiciendis qui ut aliquid cupiditate. Reiciendis nihil quia explicabo in.', 53, 7, '2018-01-30 09:47:15', NULL),
(63, 'Qui modi quae accusantium eius quos et consequatur. Quidem velit officiis quia in. Aut vel est iure corrupti. Modi dolores beatae esse. Ut reiciendis voluptas iure sint accusantium distinctio. Et neque doloremque aliquid voluptatum dolores. Aut rem ut sint facere aut aut quia. Quisquam eligendi nisi et maiores ducimus voluptatem delectus consequatur. Maxime in nam error tempora. Laboriosam in accusantium et cupiditate provident dicta. Ex deserunt laboriosam quis. Omnis vitae magnam delectus possimus id rerum laboriosam ducimus. Nam sit eum illum rerum minus.', 23, 8, '2018-01-30 09:47:15', NULL),
(64, 'Et quibusdam aut commodi saepe minima omnis. Sed nesciunt ut odio doloremque laboriosam id. Qui eaque tenetur ducimus aperiam voluptates tenetur saepe. Rem voluptatem molestiae aliquam. Doloribus ex animi molestiae error quidem. Nulla omnis beatae mollitia enim laudantium quasi reiciendis. Veritatis non iusto delectus in. Repellendus numquam praesentium magni debitis et repellendus tempora. Aut quis tempora ipsam eos dolor quam voluptatem. Perferendis rem facilis et repellendus. Error dolores assumenda aut pariatur. Vel ut placeat quia.', 56, 3, '2018-01-30 09:47:15', NULL),
(65, 'Aut aliquam illo et labore voluptatem incidunt minus. Minima dolore architecto illo et. Non ut qui provident tempore suscipit. Labore laborum laborum nulla aut animi enim consequatur ratione. Ut beatae facere autem placeat. Porro et aliquid dolore dicta. Nihil voluptatibus error quasi aut. Amet doloremque velit recusandae. Ab modi molestiae saepe error. Et et magnam aspernatur. Et et recusandae dolor. Id molestiae veritatis assumenda quis.', 41, 3, '2018-01-30 09:47:15', NULL),
(66, 'Assumenda voluptatem adipisci laudantium qui. Doloremque omnis maxime tempore ipsum natus cupiditate. Eveniet recusandae odit quos. Nesciunt laboriosam voluptas eveniet praesentium. Sint et harum in dolores. Fugit officia sapiente architecto voluptatum a. Inventore sint officia eaque nihil et quas in. Possimus dolor illum officiis velit architecto quibusdam illum voluptates. Dicta vel odio odio rerum. Et cumque modi repellat perferendis et. Dignissimos quas sit consectetur ullam soluta. Commodi ea hic rerum.', 6, 1, '2018-01-30 09:47:15', NULL),
(67, 'Perspiciatis consequatur non dignissimos adipisci itaque vel. Enim officiis ullam doloremque fuga quae et voluptatem rem. Nihil quaerat commodi deserunt a adipisci. Voluptas vel sit maxime. A laboriosam exercitationem nisi sint. Eos delectus sed architecto ducimus iste sunt. Nostrum omnis assumenda sit iusto amet saepe.', 28, 8, '2018-01-30 09:47:15', NULL),
(68, 'Provident qui corporis commodi aut. Nostrum doloribus labore quo dolorum. Incidunt consequuntur aut occaecati repellat. Esse sed ea occaecati amet repudiandae nostrum. Quos alias voluptas sint ullam pariatur quia magnam. Nulla ab animi non cum animi distinctio et. Voluptas blanditiis cumque eligendi quibusdam molestiae.', 42, 4, '2018-01-30 09:47:15', NULL),
(69, 'Rerum sint officiis placeat nihil beatae est. Optio ut ut cupiditate. Mollitia nesciunt sunt aut rerum iure sint. Nostrum voluptate rerum consectetur beatae eveniet sit. Nobis velit provident ullam nulla. Voluptate laborum temporibus deleniti accusamus. Voluptas voluptatibus ut illum eum nam. Quas nostrum et commodi. Possimus ut eos quis sit. Aut minus tempore dolore et veritatis.', 28, 7, '2018-01-30 09:47:15', NULL),
(70, 'Magnam dolore sit enim quo veritatis non natus. Consectetur eligendi quod sapiente quidem quo delectus optio. In deleniti ipsam fugit accusantium ut. Qui voluptatem rerum dolores sed. Ad assumenda eligendi at omnis ut qui maxime doloribus. Distinctio sunt est ullam. Recusandae et dolorem impedit fugit omnis.', 20, 3, '2018-01-30 09:47:15', NULL),
(71, 'Voluptates iusto laboriosam qui assumenda vitae. Aut quidem voluptas voluptates animi eum. Quis ad deserunt perferendis ea. Quae et dolore maxime eos. Unde et aut enim rerum et. Corporis consequatur recusandae vero praesentium nostrum minima nesciunt. Labore veritatis commodi officiis et dolores. Nobis officia et rerum ut non delectus. Est asperiores autem optio voluptas architecto ducimus consequatur. Ipsa dolore possimus consequatur blanditiis velit. Molestias omnis aut aut at. Magni qui aut eum alias odio facilis. Delectus ullam tenetur vero voluptatibus.', 40, 6, '2018-01-30 09:47:15', NULL),
(72, 'Qui maiores fugit accusamus aliquid amet ut. Est et quis delectus sapiente tempore. Fuga quia expedita error et libero quis. Consequatur nisi quos omnis in possimus consequatur repudiandae corrupti. Placeat qui cupiditate eius placeat perferendis odit ea cum. Rerum at nemo temporibus quia vitae suscipit. Quaerat vero odit alias eius consequatur. Autem quidem ea expedita dolor voluptatibus. Vel consectetur culpa laboriosam vel ducimus. Et voluptatibus molestiae aut non quod impedit consequatur qui. Id sequi quod expedita autem aperiam. Debitis dolor sapiente voluptas. Labore inventore nesciunt veniam ab labore quas.', 41, 11, '2018-01-30 09:47:15', NULL),
(73, 'Nisi consequuntur ducimus odio quasi at. Maiores quis sit veniam ullam excepturi consequatur sed. Nulla ullam culpa iusto qui beatae eligendi unde. Dolorum dolor voluptatum aut laborum doloremque ut non. Et occaecati vero debitis vel. Ex exercitationem ut mollitia in omnis autem. Aut sunt aliquid consequatur ab. Non fuga sequi esse et. Quia ea deleniti similique optio laboriosam voluptas at non. Eos delectus repudiandae hic facilis hic rerum. Fugiat libero voluptate officiis aut eaque nobis. Quod recusandae earum sed quia dolor.', 13, 11, '2018-01-30 09:47:15', NULL),
(74, 'Voluptatibus pariatur cum voluptate ab. Porro totam deserunt consequatur tempora ut porro nesciunt doloribus. Sit ratione ut aut incidunt. Vel harum velit veniam molestias voluptate ea. Nobis quibusdam voluptatem voluptate ea et ut. Omnis modi dolor non dolorem quis unde a. Fuga praesentium magni id officia dolores. Deleniti optio ea quam aliquam voluptatem recusandae. Molestiae doloremque vitae fugiat. Voluptas odit in porro eos pariatur ut deserunt ut.', 46, 11, '2018-01-30 09:47:15', NULL),
(75, 'Voluptas veniam numquam consequatur consequatur dolores rerum repellat. Necessitatibus odit fuga quas fugiat est. Ut eaque reprehenderit provident corrupti et magnam. Maiores facere quae rem sit eos voluptatem. Ipsum eos non consequatur nostrum quis dolorem. Harum voluptas soluta ullam debitis. Minus fugiat veniam eius sed sint est corrupti. Quasi saepe itaque et necessitatibus. Adipisci culpa optio nam suscipit aut non. Explicabo suscipit sint impedit aut velit iusto sed. Aut rerum amet maiores et molestiae. Ea enim ratione error et pariatur voluptatem. Dolores commodi autem autem temporibus ut quo qui autem. Odio numquam quia animi explicabo.', 54, 3, '2018-01-30 09:47:15', NULL),
(76, 'Animi suscipit libero qui ab distinctio dolores est. Et explicabo cumque impedit ducimus. Quo error et veniam. Ratione eum cupiditate optio vel. Impedit sint quis et deleniti est excepturi velit. Autem voluptatum officia reprehenderit cum repudiandae. At enim odit iure ipsa nostrum. Sit omnis saepe neque voluptates.', 50, 4, '2018-01-30 09:47:15', NULL),
(77, 'Soluta sit quia molestiae reiciendis eligendi incidunt. Ab quo quis dolorem voluptatem adipisci facilis sunt. Quod et aliquam consequatur nihil. Similique aperiam rerum dolor iusto aut aut eum. Ab sunt non dicta laborum. Ut odit ullam velit cum dolorem. Nostrum inventore est tempora qui dolor quo. Tempora voluptatem qui recusandae perspiciatis. Quas et et temporibus officia est quis expedita. Quia consequatur quibusdam optio aliquid dolor. Nostrum in repellendus porro ut dolorem natus. Deleniti sed sequi nostrum nihil reiciendis consectetur eveniet.', 32, 6, '2018-01-30 09:47:15', NULL),
(78, 'Temporibus dolores voluptatem dolore nihil. Error facere sapiente harum natus libero. Minima qui mollitia perferendis in temporibus. Sed natus sit a velit ad cum eius. Placeat rerum minus dicta dolores. Qui veritatis eum quos. Accusantium aliquid alias numquam aliquid. Sed et quas dolorum voluptatem placeat. Accusamus unde voluptatem et et deleniti. Reprehenderit quia non quisquam provident aliquid sed praesentium. Quaerat explicabo inventore accusantium temporibus tempora. Iusto voluptas rem tempora quasi. Consequatur a soluta impedit sequi iusto itaque.', 14, 3, '2018-01-30 09:47:15', NULL),
(79, 'Non amet nulla et laborum quod error a. Atque quos nobis quo nostrum architecto veritatis esse. Quasi ipsa numquam ex. Beatae veniam quam ipsam asperiores tempora ad qui cumque. Ea molestias nihil excepturi officiis velit accusamus natus cupiditate. Consequatur est unde nobis laudantium totam quis est. Sunt quis dolor commodi dolores nisi. Explicabo unde voluptatem aut. Possimus non consequatur ea. Aspernatur est voluptates et quasi ut aspernatur.', 1, 2, '2018-01-30 09:47:15', NULL),
(80, 'Vero occaecati id veniam iste ratione. Ratione voluptas est et voluptas autem mollitia similique. Et aut et voluptatibus et. Nobis dolorem assumenda consequatur atque distinctio. Rem sed atque voluptas adipisci consectetur iusto explicabo. Quisquam qui qui laboriosam distinctio ipsam quae autem. Deserunt vel dignissimos alias ratione. Distinctio quas similique eius autem nulla voluptas. Voluptas cumque ut id. Ex labore eum dicta debitis voluptatem vero eveniet. Quasi quia iusto voluptas id velit pariatur. Molestias officiis eius voluptas culpa itaque qui vel vero.', 52, 9, '2018-01-30 09:47:15', NULL),
(81, 'Rerum rerum impedit nam reiciendis sint suscipit doloribus. Eius ad iste ut rerum. Fugiat sit ut ut dolores. Non non sed ut nulla illum voluptatem est. Quae alias quis porro est. Sed iusto aut inventore sit optio accusamus non qui. Quia saepe inventore nihil ut beatae sed quasi aspernatur. Voluptatibus officiis tempora possimus voluptatibus. Vero perferendis aliquid et inventore ea perferendis et. Necessitatibus optio ut ut qui. Dolor aliquam amet maiores similique aperiam culpa. Nemo quia qui ut adipisci illo est modi.', 2, 3, '2018-01-30 09:47:15', NULL),
(82, 'Excepturi est error qui quia corrupti officia. Et cumque nulla autem placeat non. Quia ea voluptatem et dolorum quibusdam ipsam quae. Enim et doloribus ad atque expedita. Enim quia magnam atque eligendi ex. Ea sed labore quia a quos. Voluptates nihil praesentium minima deleniti dolorem vitae beatae. Odit illum quibusdam ab ut ex.', 7, 5, '2018-01-30 09:47:15', NULL),
(83, 'Quidem nihil culpa sequi omnis ab. Nihil provident non velit natus amet atque vitae. Vel ex quia optio voluptatem sint sit. Vero voluptatem velit enim commodi error eum consequatur. Hic eum rerum rerum veniam laboriosam et veniam. Et quo ullam et cupiditate atque. Velit ea maxime ut odio et unde deleniti autem. Id suscipit modi quasi inventore at quia veniam. Animi quia perspiciatis eveniet eaque. Sit dignissimos perspiciatis doloremque dolorum voluptas. Error error quibusdam molestiae sit officia excepturi. Non quibusdam ex molestiae temporibus veritatis aut a. Ipsa doloribus tenetur sit quia tempore vero. Reprehenderit alias alias harum.', 34, 2, '2018-01-30 09:47:15', NULL),
(84, 'Delectus rerum provident odit dolorem rerum consequatur quia. Ut alias ex quos veniam et eius odio. Corrupti molestiae perspiciatis voluptatem illo. Fugit et velit officiis quidem odio. Consequatur quidem dolorem aspernatur ut exercitationem vero. Ipsam modi a aut deserunt dignissimos. Quo eius voluptatem sapiente assumenda adipisci consequuntur. Qui consequatur cumque voluptatibus est ea culpa adipisci. Velit voluptatem tempora ea atque molestiae ipsum reprehenderit omnis.', 42, 1, '2018-01-30 09:47:15', NULL),
(85, 'Fugit excepturi ipsam enim vero. Nulla ut ut sapiente blanditiis voluptatem eos aut. Repellat accusamus dolore suscipit consequuntur tenetur. Repellat qui qui exercitationem porro numquam. Beatae ipsam rerum rerum minima. Qui molestias nisi id. Nesciunt sint blanditiis voluptates. Perferendis possimus ut dolores ex nisi vitae.', 28, 4, '2018-01-30 09:47:15', NULL),
(86, 'Blanditiis inventore perspiciatis voluptatum. Ex quia molestias facere fugiat quo. Atque veniam cumque facilis impedit qui minus. Cumque voluptatibus deleniti vero sit odit. Corrupti sit ea consectetur deleniti fugit fugit repudiandae. Nam ut voluptatem assumenda sed ut iste officiis ea. Temporibus rerum sapiente laboriosam et. Sed voluptas labore voluptatem consequuntur. Qui esse eum ducimus sit. Ut quasi qui nostrum sed harum. Dolorem eligendi facere odio exercitationem.', 8, 3, '2018-01-30 09:47:15', NULL),
(87, 'Et amet ex error eum et quod natus. Minus pariatur consequatur voluptatem. Enim et quia minus qui voluptatem porro. Quidem sed inventore omnis adipisci est quos aut. Dicta rerum illo quisquam omnis earum saepe magni. Reprehenderit dolorem ut ipsum possimus eius inventore. Voluptatem odit tempora ut quod est ut. Voluptas culpa qui minima facilis voluptatem error. Ex sapiente unde quisquam sapiente omnis recusandae est. Iusto dolor voluptatem pariatur aliquid. Ut id hic aperiam nisi ab ut quidem. Eum qui fuga maiores in fugiat.', 40, 4, '2018-01-30 09:47:15', NULL),
(88, 'Dolor consequatur nulla dolores nihil. Ipsam ratione ut vero facilis debitis mollitia. Omnis sit quisquam provident ipsa adipisci. Vel aut magni aut facere voluptatem assumenda et esse. Iste consequatur sed asperiores sint quisquam. Rerum ab aut et modi aut. Quis molestiae nemo et cumque rerum. Illum suscipit fuga qui quis animi et ut. Ipsam sed suscipit voluptatibus quia.', 59, 3, '2018-01-30 09:47:15', NULL),
(89, 'Voluptate voluptas voluptatem nesciunt quia. Repudiandae animi sit sed asperiores autem. Dolorum in sunt mollitia explicabo rerum. Possimus perspiciatis veniam et asperiores qui culpa. Illo dolorem autem consequatur ex. Qui sint aut enim quia nam nisi. Architecto omnis impedit qui numquam perferendis dolorum sed. Incidunt occaecati fugiat impedit eligendi ut excepturi id. Nam quidem minus mollitia neque beatae reprehenderit similique minima. Ea alias quis nihil sint.', 38, 9, '2018-01-30 09:47:15', NULL),
(90, 'Molestiae in architecto rem. Qui deserunt odio facilis architecto rerum sit. Sapiente vel molestiae quisquam minima ut praesentium. Quo quis aut consequatur et fugiat deleniti atque. Quaerat laudantium fuga facilis voluptate corporis omnis molestias. Sunt odio qui dolor rem. Nihil expedita ducimus necessitatibus vitae eos dolore. Voluptas earum perspiciatis alias praesentium aliquid deserunt qui ab. Quidem qui qui animi nihil in. Consectetur rem ut et sunt itaque dolores voluptatibus. Quia incidunt beatae accusamus dolore qui.', 21, 10, '2018-01-30 09:47:15', NULL),
(91, 'Maxime vel dolores velit nostrum. Ipsum et culpa libero asperiores. Quia dicta reiciendis aperiam voluptate iure. Est corrupti rerum possimus qui consequuntur. Quis modi dolor fuga id omnis autem corrupti. Voluptas voluptas dolore aut eos tempora unde. Repellendus suscipit et adipisci maxime non qui. Inventore atque sed sit possimus aperiam ea. Perferendis consequatur laboriosam et alias cumque asperiores rerum voluptatum. Sunt in placeat corporis deleniti omnis est. Modi dicta provident ut aliquam asperiores vitae magnam sit. Et repellat porro eveniet dolor.', 5, 9, '2018-01-30 09:47:15', NULL),
(92, 'Expedita placeat iste minus sint fuga quisquam sunt. Suscipit ut voluptate est nihil. Quae non inventore voluptatum totam ut dolores. Quas iure et officia. Perferendis provident consectetur quasi cupiditate. Enim delectus non temporibus ut sunt ducimus perferendis. Aut sunt sit in modi. Et non asperiores ut veritatis quae repudiandae maiores quia. Qui animi deleniti assumenda nihil optio. Et voluptas harum occaecati sequi reprehenderit. Id eos nisi nulla vel. Vel non et nihil magnam eos assumenda.', 28, 8, '2018-01-30 09:47:15', NULL),
(93, 'Nobis qui autem temporibus autem et ut est. Ea qui voluptas voluptas facilis. Quas cupiditate sed cum dolores. Explicabo recusandae qui quibusdam doloremque et reprehenderit nobis quas. Consequatur rem dolores quibusdam voluptatem et provident. Itaque aut qui sed laudantium ex assumenda id. Qui culpa dolorum eius. Dicta velit asperiores possimus. Iusto ex non soluta. Et repellendus ullam autem ipsa ut. Corrupti deserunt voluptatibus similique voluptatem aspernatur aut. Rerum porro voluptatibus assumenda vitae doloremque. Non voluptas perferendis eos tempore ut neque neque. Placeat ullam molestiae ut doloribus nihil.', 37, 1, '2018-01-30 09:47:15', NULL),
(94, 'Fuga consequatur numquam voluptas quia consequatur. Repudiandae expedita praesentium ullam voluptatem. Similique voluptas voluptatem soluta iure reprehenderit quaerat omnis aut. Voluptatem voluptates autem molestias est nemo possimus eos. Autem praesentium nostrum laudantium consequatur odio quaerat quod consequatur. Hic velit rem voluptatum nobis. Libero aliquam in dolorem. Non amet cumque qui voluptas aut id. Sequi commodi eos est dolor tempora velit modi.', 44, 1, '2018-01-30 09:47:15', NULL),
(95, 'Fugit qui magni ipsum error quasi soluta numquam. Error id consectetur quo sunt quo earum. Magni dolorem asperiores natus reiciendis non accusantium. Molestiae neque labore beatae. Odio odio ipsam officiis sit. Ad ut cum quia quo suscipit. Animi non qui est nobis et. Provident est atque delectus ut et aut at. Voluptatum quisquam ipsam expedita. Dolore ipsum suscipit consequatur quo. Blanditiis saepe sunt eaque molestiae corrupti. Ut eveniet qui consequuntur voluptate ut. Sunt incidunt qui quidem voluptates quibusdam cupiditate. Delectus et repellendus quia.', 52, 8, '2018-01-30 09:47:15', NULL),
(96, 'Tenetur temporibus consequatur id repudiandae vitae. Iure laudantium quasi officiis porro. Totam voluptatem distinctio et at fuga doloribus autem. Incidunt et rerum nulla eum veritatis. Optio repellat qui delectus sit aut quo. Porro numquam numquam quidem ex qui quia soluta sint. Mollitia qui ut enim est et. Dignissimos molestiae quia est saepe. Enim sequi sit omnis maiores laudantium molestias. Est nobis quam nam harum ipsum. Rerum fugiat consequatur voluptates et.', 39, 8, '2018-01-30 09:47:15', NULL),
(97, 'Nisi consequatur facilis cum iste officia eum. Aliquam non tempora aspernatur aut voluptas temporibus expedita. Est molestias quisquam modi voluptatum nisi. Facilis ut cupiditate voluptatem ipsam. Qui culpa et eligendi eum velit fugit quasi. Nam non eius culpa dolor quos. Ullam qui voluptatem non voluptatem. Magnam provident quo quia velit itaque incidunt.', 7, 4, '2018-01-30 09:47:15', NULL),
(98, 'Et in quasi eum. Tempore nulla illum alias in labore deserunt. Ab illum fuga consequatur hic quod provident voluptatum. Aut unde veniam officia. Nesciunt voluptatem adipisci et vel in qui sit. Tenetur rem est ad odio explicabo. Maiores similique aliquid quod qui assumenda dolores aut. Aspernatur sint assumenda quisquam molestiae rerum accusamus commodi. Iusto maxime quia aut magni quo dolores quisquam aut.', 12, 6, '2018-01-30 09:47:15', NULL);
INSERT INTO `replies` (`id`, `content`, `topic_id`, `user_id`, `created_at`, `updated_at`) VALUES
(99, 'Dignissimos accusantium vel vel velit quas sit eum. Pariatur non modi rerum laboriosam fuga est. Aliquid aut quibusdam non molestiae ut eos omnis. Suscipit autem est doloremque et molestiae quae ad. Excepturi impedit harum cum doloribus voluptatem. Sed ratione debitis sunt ipsum qui. Atque officiis iure et excepturi. Libero autem odit labore est recusandae consequatur. Incidunt qui expedita quas. Voluptates minima qui est est inventore. Necessitatibus omnis corporis tempora ducimus ea. Corrupti et nihil iusto alias praesentium ad aut in.', 47, 8, '2018-01-30 09:47:15', NULL),
(100, 'Natus ea at ab beatae. Quaerat quasi sed quo velit. Dolorum molestiae nostrum quod cum odio. Unde cumque corrupti vel illo. Ut accusamus natus sed animi autem. Praesentium autem numquam nobis nihil voluptas explicabo aut ut. Voluptas saepe pariatur non temporibus rerum eligendi dignissimos aut. Autem similique inventore ut iste aliquam. Ipsam quos qui et est maiores eos corporis. Est eos distinctio rerum veniam sint ducimus omnis. Autem reprehenderit qui odio itaque ad. Rerum laboriosam quo unde amet sit. Sit incidunt delectus quae qui qui iure dolorem. Rerum porro distinctio vitae cumque.', 13, 6, '2018-01-30 09:47:15', NULL),
(101, 'Dit is leuk om te doen. Beheer is zwaar frikking k&^#%#^%@^#%T', 16, 1, '2018-02-07 13:27:31', NULL),
(102, 'kdsgfkhsdkjfgdsjfgdsjfghdsfgdsgdsfgdsjfgdsjgdsjgdsjhfg', 10, 1, '2018-02-09 14:22:07', NULL),
(103, '<pre>\r\n<code class=\"language-javascript\">var naam = \"Johan\";\r\n\r\ndocument.write(\'Naam: \' + naam);</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n', 10, 1, '2018-02-13 06:58:41', NULL),
(104, '<p><img alt=\"\\frac{1}{2}\" src=\"http://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B2%7D\" /></p>\r\n\r\n<pre>\r\n<code class=\"language-php\">&lt;?php\r\n\r\necho \'Test\';\r\n</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n', 16, 1, '2018-02-15 12:26:19', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Gegevens worden geëxporteerd voor tabel `threads`
--

INSERT INTO `threads` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Eum omnis unde quaerat et.', 'Iusto quibusdam voluptates et assumenda enim ut. Quis autem fugiat autem explicabo autem occaecati illum et. Eum repudiandae quos sed et. Aut et quia sint deserunt ducimus et ipsam dignissimos. Dolorem ut qui et. Nesciunt aut nesciunt totam autem iusto sunt. Quaerat temporibus nisi saepe quam illum veritatis nostrum. Exercitationem ut sapiente ea optio. Deserunt molestiae ut expedita labore. Asperiores voluptatem ut sit voluptates labore.', 11, '2018-01-30 09:47:15', NULL),
(2, 'Et est reiciendis corporis.', 'Eveniet repudiandae numquam perspiciatis aliquam. Dolore consectetur architecto maiores ut praesentium sit neque. Nulla ducimus omnis sequi et. Corporis eos optio impedit. Reiciendis laudantium necessitatibus dignissimos commodi explicabo eos voluptatem fugiat. Velit officiis odit illo quaerat. Enim et non enim animi facilis. Error sed quam dolor qui corporis illo nulla. Omnis quaerat optio asperiores perferendis quia cumque similique. Fugit vitae amet enim molestiae eum non rem.', 2, '2018-01-30 09:47:15', NULL),
(3, 'Architecto eaque facere facilis.', 'Facere officia voluptatem nisi ea. Sunt magnam sequi aut provident accusantium quis porro repellat. Sint praesentium incidunt rerum cupiditate omnis. Quibusdam officia unde aut doloremque. Culpa non quas tempora in in. Veniam autem sit quos veniam consequuntur quos sunt. Quia omnis ea et voluptatem aut atque eaque. Dolores dolorem tenetur eveniet reprehenderit. Optio expedita rerum fuga. Repellat omnis aut temporibus commodi. Omnis maxime enim rerum aut. Omnis non aliquam quibusdam esse. Rem perspiciatis ullam rerum aut et vel error. Accusamus velit voluptatem autem laudantium.', 3, '2018-01-30 09:47:15', NULL),
(4, 'Nihil error est et.', 'Aspernatur quisquam maiores ut cumque corporis et. Magni consequatur et vitae quisquam. Ut assumenda aspernatur et laborum debitis blanditiis. Minus amet nobis sed soluta numquam aliquid vel. Eos et praesentium maiores totam beatae quos. Est soluta quisquam ut aut sequi tempora repellendus iure. Inventore dolor aliquid doloremque doloremque voluptas.', 9, '2018-01-30 09:47:15', NULL),
(5, 'Autem asperiores et.', 'Quidem est laborum adipisci aspernatur asperiores. Dicta unde odit eligendi tempora numquam. Est maiores est eaque aut error eos. Qui qui quasi suscipit. Quia sit eligendi consequatur qui et ea. Dolore eligendi dolor nostrum pariatur non fuga ea. Dignissimos adipisci qui quam accusamus laboriosam recusandae. Facere aut sed quasi nihil.', 4, '2018-01-30 09:47:15', NULL),
(6, 'Molestias molestias ad nesciunt necessitatibus.', 'Qui repellendus libero debitis. Dolores aliquid at sunt atque. Adipisci repellendus odit provident mollitia quas qui. Blanditiis officia quas est eaque corporis quia expedita. Tenetur officiis quisquam nostrum earum eaque. In aut tenetur aut possimus adipisci quaerat quidem error. Ut sed error ea odio alias atque. Perferendis quia nam quia eum. Minima neque reiciendis cupiditate ducimus. Ea velit a placeat voluptatibus. Neque minima dolor sint sequi similique dicta a. Est ut perferendis quibusdam vel voluptatum aut porro. Suscipit a nesciunt quidem molestiae.', 8, '2018-01-30 09:47:15', NULL),
(7, 'Asperiores eaque nihil.', 'Sed esse est saepe cumque saepe. Aut optio consectetur ut est. Totam impedit consequatur eum minus sit eum rem commodi. Ea recusandae eligendi similique et et earum est ut. Eos aut dolor et repudiandae aliquam. Omnis nihil qui rerum vel quisquam quo. Quam omnis voluptates quod accusantium amet deleniti qui. Enim id excepturi veniam asperiores impedit facilis. Repellat placeat iusto et assumenda perspiciatis. Repudiandae tempore voluptas molestiae ut. Fugiat incidunt dolor omnis voluptatem molestiae.', 4, '2018-01-30 09:47:15', NULL),
(8, 'Nihil rerum perspiciatis quas minima odit.', 'Repellat debitis omnis et facilis sint atque perferendis. Possimus unde omnis reprehenderit earum accusantium enim aut. Laudantium minima molestiae dolore eius assumenda beatae ut. Sit quisquam eum et assumenda reiciendis ut veritatis. Ab assumenda officia sed provident exercitationem voluptatum voluptatem. Odit nisi suscipit quo tempore in unde dicta. Cupiditate fugit nam quaerat laborum sunt incidunt pariatur. Distinctio aliquam minus corporis magni hic eveniet. Aperiam recusandae magni voluptatem perspiciatis beatae enim et est. Iste nihil vel suscipit quae nobis qui ducimus. Doloribus eaque rem esse quos commodi laborum. Minus laborum sequi quia incidunt aut.', 4, '2018-01-30 09:47:15', NULL),
(9, 'Non suscipit nihil.', 'Et veniam modi nobis possimus omnis ex. Totam deleniti debitis harum quasi qui. Ea ad aut repellat iste. Rem fugiat odio pariatur aut est. Nam occaecati nobis repellendus eveniet nobis. Sapiente aut quibusdam rem aut quaerat. Accusamus voluptas expedita eum rerum similique. Qui sint quidem quia sunt eum et suscipit.', 7, '2018-01-30 09:47:15', NULL),
(10, 'Iusto ut eum aut.', 'Et eius enim aut. Qui molestias quos eos sit. Sunt perspiciatis eveniet eius atque. Sequi aliquam ut quo nulla quia est nisi. Rerum architecto qui commodi dolorum ut corrupti minima. Beatae odio autem ipsam quia reiciendis asperiores. In ullam harum et sunt. Fuga totam voluptatum inventore unde illum eum autem molestias. Ea voluptatem tenetur excepturi. Quam consequatur incidunt quidem odit blanditiis sit. Repudiandae a autem laboriosam iusto a qui. Temporibus facere et repudiandae quaerat.', 4, '2018-01-30 09:47:15', NULL),
(11, 'Reiciendis nostrum soluta voluptate.', 'Et dolor harum eos autem. Veniam consequatur optio possimus qui. Consequatur totam ut saepe dolores quos quas. Quo praesentium officiis nemo est et et. Officia vero non quam cupiditate dicta officiis accusantium atque. Rerum quia sit beatae labore. Rerum a at quam corrupti. Voluptatem deserunt non eum natus in exercitationem alias.', 8, '2018-01-30 09:47:15', NULL),
(12, 'Eveniet qui quia sequi mollitia nobis.', 'Maiores provident amet quidem modi corporis autem. Eos maiores atque cupiditate voluptatem neque et. Qui et reiciendis maxime ducimus id dolore consequatur qui. Deserunt facilis sit sed dolores. Quas voluptas facilis corrupti reiciendis corporis. Officia ex tenetur aspernatur nemo quod ut vitae minus. Vero tenetur nam provident molestias quis ut non quas. Omnis quia in ut aperiam iusto odit aut cum. Qui sunt repellendus vel blanditiis. Aspernatur possimus voluptatem consequuntur eos accusantium repudiandae molestiae. Reiciendis ex qui repudiandae assumenda beatae occaecati. Nisi hic eligendi dolores aut aut sit occaecati. Mollitia sunt dolorem aut aut. Dolore odio atque quas alias.', 4, '2018-01-30 09:47:15', NULL),
(13, 'Tempora aut facere facilis.', 'Quia distinctio sit aut. Quasi quis voluptatum aut ipsum ut esse distinctio. Ut iusto temporibus sed qui. Nobis aut eum amet sed. In rerum molestiae ab aut est ad sunt. Odio et quibusdam quae et dolor sit corporis. Ipsum quae aut temporibus quo aliquid quidem. Est fuga et inventore voluptate iusto ipsam. Labore et consequuntur occaecati sunt. Officia consequatur quidem consequuntur iste magni sed expedita et. Aperiam iusto repudiandae ab omnis est eveniet. Impedit enim ducimus architecto nostrum incidunt voluptas. Et vel omnis nihil dolorem vel ex quis. Nobis quas cum animi iste nulla.', 8, '2018-01-30 09:47:15', NULL),
(14, 'Error nisi assumenda.', 'Explicabo qui et qui est. Fugit nemo ut ea voluptatum consectetur ut. Nobis perferendis provident amet aut maxime ratione aliquid. Est minus eos numquam assumenda. Blanditiis expedita natus maiores et et quia in natus. Fugit soluta est asperiores est incidunt consequatur fugiat. Soluta et ut tempora dolores saepe laborum. Minus numquam aut assumenda dicta dolor rerum esse ducimus. Placeat vel consequatur nesciunt aut aliquam dolore. Et eos expedita omnis enim sunt.', 3, '2018-01-30 09:47:15', NULL),
(15, 'Incidunt vel omnis ex labore.', 'Molestiae harum adipisci error quia distinctio. Adipisci voluptatibus optio dolor sed. Sit fugit quia et quaerat quo voluptatem quod. Cupiditate omnis at et fugiat velit inventore. Autem magnam et fugiat. Ex repellat perspiciatis amet qui quod repudiandae id architecto. A architecto mollitia voluptates saepe. Voluptas aspernatur esse ratione quam molestias id placeat qui.', 5, '2018-01-30 09:47:15', NULL),
(16, 'Quasi placeat veritatis.', 'Ut maiores assumenda facere fuga aut eum rerum. Quo vel optio eos. Maiores omnis molestiae molestiae sapiente quod. Enim nostrum aut voluptatibus qui adipisci. Velit sapiente pariatur quia animi animi. Qui alias eius mollitia consequuntur. Rerum dolores quae libero sunt quo. Necessitatibus commodi dicta et vel ut. A vel saepe vero hic. Doloremque dolores dolor et expedita porro ut. Quas quis et architecto esse in harum ut doloremque. Natus enim error ab accusantium.', 3, '2018-01-30 09:47:15', NULL),
(17, 'Dolorum corrupti possimus veritatis ut.', 'Iste ut eos animi dolores possimus quo. Repellat facere asperiores esse et accusamus quod saepe. Explicabo qui et sed et amet voluptatem eius. Iure omnis labore dicta architecto iste. Aspernatur reprehenderit molestias aut sit ipsam nihil voluptatem eligendi. Optio ut voluptatem dolores neque perferendis ut voluptatem voluptatem. Et dolores eum amet praesentium molestiae doloremque. Reprehenderit tenetur dolores odit ut necessitatibus molestias. Beatae qui dolor aut culpa doloribus natus quo ut. Perferendis cumque iure dolores numquam unde.', 10, '2018-01-30 09:47:15', NULL),
(18, 'Illum ipsam tempore aut.', 'Saepe quos qui nobis eaque. Officia ratione assumenda et esse laudantium. Aut minus cumque aut. Est nihil eum id qui accusantium eos. Qui voluptatem impedit est laboriosam sequi. Accusantium occaecati minima quidem minus vitae id aut. Molestias et voluptatem illum molestiae reprehenderit. Perferendis sapiente et nihil aspernatur sunt repudiandae. Consectetur fugiat iusto consequuntur omnis quaerat repellat. Animi quia voluptas labore in esse dolorem. Odit consectetur quasi natus necessitatibus expedita.', 9, '2018-01-30 09:47:15', NULL),
(19, 'Vitae distinctio qui deserunt.', 'A ut ad nulla eius dolor. Quia quis veniam error deleniti veniam voluptates aut. Eos aspernatur aliquam qui dicta quaerat. Id ipsam quasi id. Enim deleniti autem nesciunt aut rerum libero nihil. Tenetur voluptatibus quam repudiandae sed quia eligendi facilis. Nobis et enim sequi earum non. Aut molestiae deleniti voluptatem et. Consequatur ea non sed ipsum eveniet minus. Earum officiis nostrum eligendi velit deleniti sed delectus.', 6, '2018-01-30 09:47:15', NULL),
(20, 'Itaque omnis dolor.', 'Eos quaerat sed ipsum voluptatem aliquam sunt. Facere optio omnis vel expedita eum sed id error. Vero quos sunt animi impedit fuga et. Et unde dicta qui sint. Voluptatem et a dicta qui quod recusandae. Error assumenda similique optio. Quibusdam dolorem ut ipsum voluptatum autem ad earum magni. Asperiores voluptatem dolore veniam et quasi vel. Ea maiores rem quasi nisi excepturi facilis corporis. Velit necessitatibus recusandae porro et nisi. A odio ipsam eius omnis.', 7, '2018-01-30 09:47:15', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Gegevens worden geëxporteerd voor tabel `topics`
--

INSERT INTO `topics` (`id`, `title`, `content`, `thread_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ipsum quo et accusamus.', 'Illum neque id itaque dolore non. Quia fugit maiores et rem distinctio reprehenderit suscipit. Minima in ea et reprehenderit saepe est. Aut aut odit minus repudiandae neque ut. Est animi repellat ut porro. Aut debitis voluptatem voluptatibus illo numquam voluptas. Consequatur fugit quia nisi voluptas necessitatibus libero. Repellat voluptas ea veritatis nihil non alias voluptate. Quis blanditiis veniam ut repellendus et. Iste expedita earum tenetur nobis corrupti molestias non.', 11, 4, '2018-01-30 09:47:15', NULL),
(2, 'Cum et aperiam necessitatibus.', 'Sit dolorum velit ut illo est. Rem sapiente inventore sapiente et. Omnis dolorum et repellat. Et quo consequatur omnis ea labore quia iure. Ea aliquam autem rerum sint est. Rerum inventore omnis deleniti reiciendis laboriosam laboriosam voluptatem aut. Aut deserunt dolore temporibus qui accusamus quia sequi. Atque vel ut suscipit accusamus praesentium doloremque molestiae. Rem et doloremque aut autem ipsum illum non hic. Ut aut quia voluptas exercitationem voluptatem quis et est.', 9, 6, '2018-01-30 09:47:15', NULL),
(3, 'Consectetur quisquam temporibus error.', 'Dicta est et quos suscipit laborum quas nulla. Iure totam blanditiis harum iusto reprehenderit. Necessitatibus animi sequi voluptas totam reprehenderit voluptatem. At consequatur eligendi nihil non. Ex suscipit libero adipisci tempore est aut animi. Eum et voluptates nihil eaque. Veniam et recusandae nulla natus nam ducimus fugiat. Cumque ratione tempora ratione deleniti ullam quia rerum vel.', 12, 6, '2018-01-30 09:47:15', NULL),
(4, 'Velit aut id rerum doloremque.', 'Voluptatibus quos similique sapiente odio et. Impedit adipisci doloribus adipisci. Voluptas quia recusandae consequatur eos necessitatibus rem. Vero perferendis optio facilis aspernatur. Impedit corporis nam at occaecati dolorem eum animi omnis. Voluptate et dolorem accusamus provident suscipit. Asperiores voluptas sed eum sequi laudantium earum dolores.', 16, 11, '2018-01-30 09:47:15', NULL),
(5, 'Et vel non qui vero.', 'Nemo maxime ipsum optio soluta omnis aperiam illum eos. Corrupti quia repudiandae laborum iste quo quisquam aliquid. Laborum facilis sunt sint et vero veritatis. Natus quisquam reprehenderit et amet. Aut voluptatem dolores voluptas ea aspernatur ipsam laudantium aliquam. Sapiente ratione odio modi voluptatibus. Accusamus cumque nihil sed quaerat.', 6, 8, '2018-01-30 09:47:15', NULL),
(6, 'Aperiam quis doloremque qui tempore.', 'Aut quo pariatur temporibus vero dolor libero rem. Quam quo totam officia sunt numquam aut. Consequatur aut molestiae vero et consequatur et. Doloribus alias consequatur dolores quam. Incidunt molestiae autem accusantium eaque expedita dolores. Deleniti qui quia corrupti est eius aut. Rerum et fuga dolores ex enim sint. Pariatur aut qui et assumenda velit exercitationem. Maiores nam similique ut nostrum accusamus. Doloribus rem dolor dicta iusto est fugiat eum aut. Cumque velit est nulla eos hic impedit magni. Recusandae odit occaecati minus qui aut rerum molestiae. Suscipit reprehenderit nobis natus distinctio dolor. Consectetur amet eaque qui illum dignissimos.', 3, 8, '2018-01-30 09:47:15', NULL),
(7, 'Est minus sit quisquam unde.', 'Et qui consectetur inventore et incidunt porro officia. Odio doloribus vitae nesciunt accusantium deserunt iste. Vel soluta consequatur qui vel error. Quia molestiae excepturi sit magni ullam et minus. Distinctio cum sapiente natus reiciendis consequuntur ipsa. Et et nam reprehenderit facilis voluptatem quisquam. Ex corporis ut id quo ab molestiae. Dolore suscipit illo sed voluptatem velit quia. Esse nam voluptatem tempora necessitatibus.', 9, 3, '2018-01-30 09:47:15', NULL),
(8, 'Perspiciatis dolores totam.', 'Aut earum omnis qui modi numquam nesciunt. Quidem et qui praesentium vitae sint quia dolorem ut. Cumque nam reiciendis debitis accusamus laudantium deserunt ut. Autem voluptas repellat quas quo sed. Consequatur totam omnis fuga nesciunt quod. Dicta quos distinctio nostrum ab ducimus. Suscipit molestiae et recusandae labore ipsa. Voluptatem ex ea dolores. Tempora exercitationem nostrum in totam aut nisi temporibus. Accusantium mollitia sapiente non quas doloremque excepturi. Magnam numquam est consequuntur sunt cumque. Qui doloremque est sed accusamus. Laborum doloremque consequatur dolorem distinctio sit dolorem numquam nisi. Nihil quia eligendi maiores incidunt nemo et consequatur.', 19, 11, '2018-01-30 09:47:15', NULL),
(9, 'Totam at animi.', 'Voluptas laudantium eos et possimus quos omnis atque. Fugiat id delectus aut corrupti. Omnis iste non eveniet ut est. Fuga fugiat aut magni officiis doloremque consectetur voluptatem. Iste non ipsum qui reiciendis hic est. Architecto harum sapiente in. Enim rerum voluptatem sed porro. Vel recusandae labore aut laborum. Nisi tempore sed nisi est est cum. Et harum repellat animi. Et rerum dolores in est.', 17, 4, '2018-01-30 09:47:15', NULL),
(10, 'Ducimus qui quas.', 'Harum dolorem et illo omnis eveniet soluta. Praesentium quod eligendi occaecati est. Et minus quas laborum assumenda. Et suscipit nesciunt asperiores. Minus eveniet sapiente qui et. Eos sunt labore ut omnis dolor eum quidem. Ullam consequatur dignissimos quam dolores. Consequatur ea ea est molestiae. Reiciendis sed est deserunt tempore perferendis.', 1, 1, '2018-01-30 09:47:15', NULL),
(11, 'Natus fugiat voluptas ut.', 'Provident sunt debitis voluptates suscipit sapiente eos hic. Quia voluptas ducimus ut dicta dolores aperiam. Similique dignissimos id doloremque pariatur voluptas ut. Et illum dolor odit quis quod. Necessitatibus illum dolorem consectetur quasi hic. Sit voluptate eveniet doloribus omnis et. Et ducimus nisi corporis corporis quae perferendis possimus reprehenderit. Excepturi in sit nihil veniam rerum a in consequatur. Et est quam enim explicabo eligendi harum aliquam. Aliquam sunt modi ullam excepturi assumenda. Sed et sint perferendis quis quia quia consequatur. Non ea magni quos unde. Corrupti et consequuntur sunt quia.', 2, 7, '2018-01-30 09:47:15', NULL),
(12, 'Quae ut harum qui temporibus sed.', 'Modi ut ut laudantium magnam nam temporibus. Aperiam eveniet laborum reprehenderit unde ut. Dolorem corporis dignissimos debitis rem quae labore est. Aut ipsum soluta ad nam molestias aut. Quae quidem voluptatem excepturi voluptatem sunt animi architecto. Temporibus excepturi iste officiis dolorem voluptas quis. Dolor qui ducimus earum expedita rerum amet dolores.', 7, 2, '2018-01-30 09:47:15', NULL),
(13, 'Ut aut nihil.', 'Voluptas in inventore aut modi facere ipsa beatae. Est ut et similique impedit non facilis. Nostrum aliquam cum error. Consequuntur saepe omnis omnis. Eum quo maxime et facere. Voluptatem modi eum molestiae voluptatibus earum. Veniam voluptatem quos veniam aperiam nemo. Deserunt veniam dignissimos voluptatum id. Accusamus et maiores explicabo ipsa voluptatibus earum et. Et incidunt officiis at error rerum. Est atque suscipit odio. Placeat labore molestiae itaque quia iure neque debitis. Ut accusamus esse praesentium veniam quisquam.', 8, 2, '2018-01-30 09:47:15', NULL),
(14, 'Qui in cupiditate alias.', 'Praesentium alias doloribus laborum corporis nihil. Aut quos quidem non et voluptate quaerat necessitatibus. Ad eum ipsam incidunt libero nihil voluptates iure aut. Adipisci minus et temporibus sit. Debitis est non illo dolores. Doloribus quidem reprehenderit nemo sed et. Itaque corporis sed repellat quo. Sunt aut quae adipisci quas quis ex.', 10, 5, '2018-01-30 09:47:15', NULL),
(15, 'Et qui occaecati odio est.', 'Et est nihil occaecati eius dolor voluptas accusamus eum. Assumenda odio sint cupiditate sunt maxime. A unde delectus aut facilis dolor amet adipisci architecto. Suscipit commodi consequatur mollitia. Error molestiae aliquam et voluptas. Ea doloremque dolor placeat harum velit nulla. Animi reprehenderit velit consequatur id ea aperiam. Dolor aut quos saepe unde consequatur.', 6, 3, '2018-01-30 09:47:15', NULL),
(16, 'Quas saepe minus nemo.', 'Facere cupiditate perferendis laboriosam autem soluta quia. Officia exercitationem ut vitae ut totam rem. Velit blanditiis illum rem in dicta veniam. Veritatis nesciunt omnis labore labore est. Veniam dolor hic voluptatem doloribus. Magnam cupiditate omnis impedit et veniam voluptatem. Autem ut ut nulla unde praesentium quia enim. A possimus dolorem vitae at earum id aut. Et est aut sit. Magnam qui fugit eos ut voluptas. Laborum qui quam praesentium quae amet autem nostrum. Nihil quas consequatur quisquam voluptas mollitia. Quis aut sunt qui est dolor dolorum id impedit.', 1, 6, '2018-01-30 09:47:15', NULL),
(17, 'Aspernatur id tempore facere totam perspiciatis.', 'Qui qui aperiam omnis consequuntur consequatur qui. Officia sint itaque maiores porro delectus necessitatibus aut. Optio qui rerum consequatur explicabo officiis a nam qui. Sed debitis quo modi perspiciatis impedit quia unde. Aut voluptatum et eum provident. Iste aut et exercitationem delectus. Deserunt fugit aut optio sit reprehenderit enim dicta.', 6, 4, '2018-01-30 09:47:15', NULL),
(18, 'Molestias expedita et consectetur.', 'Dolorem voluptatum molestiae nihil earum est. Quasi aperiam porro consequatur et. Provident tempore dolorem qui vitae accusamus quos. Omnis qui accusantium maiores hic ipsam molestiae. Quia repudiandae fuga repudiandae repudiandae exercitationem veritatis vel. Illum saepe eius qui quas sit maiores. Reiciendis sit quibusdam delectus odit hic. Illum hic tempora molestias mollitia debitis. Aut optio excepturi rerum facere. Numquam error enim veniam facere et nostrum quos. Et et natus quae molestiae at ipsum voluptates. Consequuntur qui ratione dolorum quaerat possimus sit odit.', 19, 11, '2018-01-30 09:47:15', NULL),
(19, 'Quam non quisquam.', 'Unde repellat ut eaque. Beatae natus quo suscipit facere ad. Et quae ratione eum non corporis in. Molestiae nemo sit quis voluptatem iure. Vitae magnam blanditiis tenetur dolores consequatur officia. Labore sunt quae accusamus qui sit. Eaque nisi ut ipsam molestias corporis. Vitae aut expedita dolorem facere. Totam et aperiam et id voluptatem. In qui dolores odio voluptates qui. Non nobis ut aut facere consequatur aperiam. Recusandae dolor ullam veniam non.', 10, 8, '2018-01-30 09:47:15', NULL),
(20, 'Culpa perspiciatis doloribus.', 'Facilis repellendus magnam in aut impedit. Ut et hic saepe esse qui. At quia voluptates nemo sit ea. Aperiam corporis fugiat eos eligendi. Commodi nostrum tempora voluptate ab et in voluptates. Eos repudiandae suscipit rerum. Facere et deleniti nesciunt quo dolore corrupti.', 7, 3, '2018-01-30 09:47:15', NULL),
(21, 'Est tenetur placeat animi commodi.', 'Odit consequatur qui voluptas rerum pariatur sed. Laborum ut dolorum voluptates. Consequuntur quo et minus quam labore suscipit. Doloremque dolorem eius tempora ut nemo tenetur iure aperiam. Dolor et quidem deleniti beatae repellat laborum suscipit qui. Eos ut perferendis est possimus quo quod veritatis ut. Earum omnis non ut delectus aut dignissimos recusandae. Odio corporis omnis quo sit aut. Et cum odit laudantium aut. Pariatur unde qui tenetur. Consequatur exercitationem ducimus autem blanditiis ipsa explicabo quam. Modi provident id voluptates laborum. Placeat placeat exercitationem architecto sed qui.', 9, 1, '2018-01-30 09:47:15', NULL),
(22, 'Minus reiciendis non.', 'Odio harum tenetur consequatur molestiae rem suscipit. Molestiae officiis aut quasi. Aut fugit voluptates eaque quia non. Ipsam at nihil et amet quo. Non architecto nisi rerum nihil. Cum exercitationem quia fugit et beatae. Omnis perspiciatis consequatur ut tenetur est deleniti rerum. Molestias omnis aut repellendus omnis. Et doloremque aut repellat labore iure. Deleniti cumque autem accusamus ut molestias dolor at. Quod qui possimus nostrum nam. Harum ut quaerat rerum. Itaque dolorem nulla architecto.', 5, 11, '2018-01-30 09:47:15', NULL),
(23, 'Eos eaque magni.', 'Natus sapiente nesciunt non ipsum deleniti est unde quia. Facere fugiat quas nesciunt tempora sint debitis. Voluptatem laborum officia omnis quis qui ut saepe. Ab praesentium blanditiis quae et. Ut doloremque voluptas voluptatem quos delectus qui sint. Et labore culpa temporibus et laborum laborum eligendi sed. Facilis tenetur fugiat vel ad aut voluptatum molestiae. Quasi iure est placeat recusandae aut. Cupiditate voluptatem nihil aut delectus. Aut esse error est. Et dolore qui animi rerum. Assumenda quia vitae necessitatibus aliquid fuga nihil asperiores. Voluptatem eaque explicabo error vel asperiores. Quisquam molestias minus delectus sit consequatur nihil.', 16, 9, '2018-01-30 09:47:15', NULL),
(24, 'Deserunt velit tempora voluptas.', 'Ratione blanditiis ipsam culpa. Perferendis ea possimus quaerat eveniet earum vel vero totam. Iste ad eius necessitatibus quasi. A rem ut cumque doloribus rerum. Ullam et qui nisi. Accusamus fugiat aut molestias totam. Quae aut rerum delectus rerum. Perspiciatis ea eos libero molestiae quidem assumenda temporibus. Error aut consequatur repellendus perspiciatis voluptatum eius. Mollitia fugiat quia consequatur voluptatibus vitae enim et cupiditate.', 13, 4, '2018-01-30 09:47:15', NULL),
(25, 'Provident velit natus sapiente fugiat.', 'At veritatis rerum omnis est eum hic. Quia culpa quo non eveniet autem cum. Molestiae eos quibusdam nemo eos fugit mollitia est. Maiores dicta repellendus ut qui. Assumenda consequuntur sint aliquid. Sequi adipisci quis voluptate accusantium ut labore. Eius et voluptates velit omnis ea quaerat ea. Porro exercitationem et itaque reprehenderit perspiciatis et. Eveniet impedit doloribus voluptatibus. Et recusandae quia dolores. Impedit in libero nemo est quasi. Fuga voluptas aspernatur numquam.', 13, 2, '2018-01-30 09:47:15', NULL),
(26, 'Deleniti eos aspernatur consequuntur laudantium.', 'Esse recusandae nesciunt consequatur nemo ipsam quo corrupti. Sit voluptates non dolorem quae qui perspiciatis perferendis. Perferendis vel eos a suscipit accusantium iste cum. Hic laboriosam aut aut. Doloribus nisi temporibus quidem et aut dolor. Iste debitis velit dignissimos occaecati quo et. Vitae sunt veritatis quo unde facilis. Assumenda velit in facere omnis eligendi. Et numquam impedit culpa odio. Voluptatem qui dolorem eos qui rerum totam. Repellendus et cum asperiores voluptatum error nobis. Quibusdam dolores et nisi dolorem rerum magnam reprehenderit.', 19, 2, '2018-01-30 09:47:15', NULL),
(27, 'Eligendi adipisci cum expedita.', 'Doloremque sapiente non praesentium autem. Et accusantium qui soluta sapiente facilis voluptatem. Eos cupiditate excepturi saepe rerum vero nisi totam. Quia id neque id voluptas et. Eum laborum esse sit aut rerum ducimus nemo. Sit quasi explicabo reiciendis ipsum facilis. Doloremque qui inventore debitis eligendi nam animi. Tenetur pariatur aut nesciunt est necessitatibus et voluptatem.', 15, 4, '2018-01-30 09:47:15', NULL),
(28, 'Ea porro modi.', 'Temporibus omnis eum distinctio. Qui odit aut modi vel facere. Error voluptatem dolorem quas enim ullam et. Id eveniet distinctio qui tempora sed. Nam quas voluptas sit occaecati minus placeat eum. Rerum accusamus nam odio consequatur ut accusamus expedita. Laboriosam et facere amet et est consequatur occaecati. Incidunt corrupti sint et quibusdam temporibus. Cum molestias veniam molestiae eum sit quia. Hic non enim corporis porro et. Nulla saepe soluta et aspernatur architecto sit voluptatibus optio.', 2, 8, '2018-01-30 09:47:15', NULL),
(29, 'Aut sapiente omnis voluptate.', 'Necessitatibus enim est dolor quasi voluptate eaque. Culpa numquam hic ut omnis perferendis doloribus sint. Nisi dignissimos modi tenetur. Beatae cum tempora et consequatur quo dolores aut officiis. Totam perferendis voluptas mollitia quos ut repellendus. Sapiente ullam mollitia dolorem dolore numquam sed est. Laboriosam quia laudantium omnis.', 16, 10, '2018-01-30 09:47:15', NULL),
(30, 'Quidem odit deleniti laudantium et debitis.', 'Tenetur ratione sapiente odio deleniti sit. Exercitationem veritatis autem reprehenderit. Iste officia fugit rerum magnam. Ab molestiae distinctio tempore quis. Nihil eum cum omnis fugiat illum. Veniam eligendi nesciunt aut neque exercitationem. Voluptatem asperiores est vel pariatur praesentium. Rem corrupti necessitatibus voluptas maiores.', 11, 4, '2018-01-30 09:47:15', NULL),
(31, 'Fuga esse autem accusamus.', 'Architecto voluptatem qui perferendis sit dignissimos debitis. Ad animi sed quia perferendis minus temporibus. Molestiae accusantium ab adipisci aliquam expedita veniam hic. Numquam facere molestiae quod ut odio. Repudiandae voluptatem expedita sed rem. Facere sed rerum consequatur corporis consectetur. Delectus vel quos deserunt quo laboriosam nulla consequatur. Quia incidunt iste eligendi nulla ut et quos dolore. Cumque esse delectus perferendis ipsa ut. Quod id tempore cumque sit.', 7, 4, '2018-01-30 09:47:15', NULL),
(32, 'Asperiores provident soluta.', 'Omnis mollitia quo est. Dolorum voluptatem deleniti rerum corporis est. Veniam eum id illum dolores. Voluptatem eos soluta aspernatur enim adipisci. Ab id enim doloribus libero. Velit adipisci doloribus autem excepturi saepe. Dolor est blanditiis fuga accusamus.', 19, 7, '2018-01-30 09:47:15', NULL),
(33, 'Et distinctio aut autem sed atque.', 'Asperiores et eos qui. Nam rerum ea ullam odit. Laborum eveniet ab sint tempora deleniti qui modi. Voluptates sed explicabo consequatur tempora quas. Quas libero illo dolorem corporis repudiandae et. Cum in deleniti fuga eveniet eveniet. Cumque magni possimus accusantium omnis in rerum. Tempora non labore quia odio ipsam mollitia. Et perferendis aut atque aliquid voluptatem similique atque deleniti. Eum necessitatibus rerum eos et consequatur. Cum maxime dolor autem voluptas recusandae accusantium. Molestiae accusamus temporibus maiores iure. Et ipsa tempore necessitatibus ut id.', 11, 1, '2018-01-30 09:47:15', NULL),
(34, 'Nihil neque veniam id.', 'Voluptas qui id ipsam consequuntur error ex. Quia aut distinctio consequatur unde dignissimos. Mollitia laboriosam et qui fugit aperiam. Quia odit quae quo. Facere quo asperiores enim quia perspiciatis sunt. Ipsum voluptate dignissimos nemo nihil. Mollitia ut magnam vitae cumque asperiores voluptas.', 13, 10, '2018-01-30 09:47:15', NULL),
(35, 'Quasi voluptatibus cupiditate laborum consequatur qui.', 'Ea repellendus quaerat aperiam veritatis tenetur et. Voluptas hic sit vel aspernatur itaque voluptate architecto. Itaque sunt autem neque. Nulla est tempore quia qui aut voluptas. Molestiae temporibus aut a ipsam. Voluptatem et debitis quia atque. Est similique fugit iusto voluptas debitis officiis. Ea tempora quas sit qui a deleniti provident ea. Dolor officia velit ut similique facilis ut ea. Ea et qui at amet esse repudiandae veniam.', 12, 5, '2018-01-30 09:47:15', NULL),
(36, 'Error explicabo dolores ut enim.', 'Et voluptatibus dolore et necessitatibus eos impedit. Aut rerum sunt soluta sit voluptatem nulla qui. Ea sed velit rerum aliquam nostrum. Quo nesciunt quaerat aut possimus inventore possimus. Commodi officia non ratione qui. Sint corporis molestiae voluptatum impedit repellat excepturi eum voluptas. Vitae pariatur eligendi iure deleniti. Nulla natus consequuntur earum voluptatem quibusdam dicta laboriosam. Nobis et earum ut molestiae fugiat distinctio. Aperiam hic omnis aperiam facere sit quos.', 10, 3, '2018-01-30 09:47:15', NULL),
(37, 'Saepe praesentium perspiciatis ut placeat laboriosam.', 'Esse repellat fugit itaque incidunt omnis ex in. Nobis deserunt qui et est maxime sunt. Aliquid ut enim ea et deserunt nihil. Soluta eligendi provident saepe. Ad illo quae sed nisi esse consequuntur molestiae reprehenderit. Cupiditate voluptates quis est. Aut dolores rem placeat sunt.', 9, 3, '2018-01-30 09:47:15', NULL),
(38, 'Non culpa culpa.', 'Rerum qui dolore iure ullam. Aut ex in sequi unde ut sit ut. Numquam est molestiae minima molestiae voluptatem. Commodi qui dolores modi architecto vel aperiam. Exercitationem corrupti provident quia perferendis. Ex autem quos qui possimus est nesciunt modi. Ipsa suscipit voluptatem perferendis deleniti cupiditate. Mollitia error voluptas autem impedit harum ducimus. Necessitatibus aut consequatur odio. Et fugit optio fugiat tenetur nemo. Quasi accusantium illum omnis illum aut non atque harum. Est temporibus possimus omnis illo. Molestias veritatis incidunt non aliquam exercitationem.', 4, 3, '2018-01-30 09:47:15', NULL),
(39, 'Quasi nesciunt ducimus sit.', 'Quibusdam architecto eum sint architecto nihil reiciendis. Pariatur quia tempore dolor fugit est similique excepturi. Molestias voluptas sit nesciunt incidunt. Qui voluptatem similique non ut. Aspernatur ut autem qui quisquam autem. Rerum sed velit sit aut. Veritatis tenetur nemo aliquam voluptate a veritatis. Deleniti voluptatem est ut exercitationem dolorem omnis at. Adipisci natus ipsum iusto et. Voluptatem nostrum voluptas alias earum. Est repudiandae qui sit sunt quia. Non ea est laboriosam.', 13, 4, '2018-01-30 09:47:15', NULL),
(40, 'Quia similique minima temporibus ut at.', 'Praesentium id et beatae a. Sapiente maiores assumenda est. Voluptas deserunt sit tempore numquam non vitae voluptatem repudiandae. Fugit quia eligendi ea hic sit occaecati cupiditate facilis. Quas nesciunt autem ut laborum aliquid quo tempora. Ipsum hic quia eligendi. Culpa non ipsa voluptatem consectetur dolorum. Architecto quibusdam quos voluptatem quasi expedita. Possimus quam delectus corrupti nobis deleniti laboriosam aut incidunt. Est eum ut assumenda odio nihil. Occaecati quisquam quasi doloremque voluptatem eum. Eum quae commodi quos. Ea est vero quam voluptatem porro aut ex aperiam. Dolor perferendis quam maxime recusandae accusantium. A est ut adipisci et minima.', 20, 11, '2018-01-30 09:47:15', NULL),
(41, 'Quia esse incidunt eligendi nihil.', 'Veritatis voluptatibus ipsum eum soluta et sint. Reprehenderit hic molestiae debitis soluta aut. Libero similique officia consectetur aliquam tenetur ipsum reiciendis atque. Molestiae quis porro pariatur libero quidem molestiae. Labore impedit non ab sapiente reiciendis. Aut accusamus ut maxime veritatis. Nam eum provident non voluptates nostrum quam eos. In et qui qui. Iste cum autem rem doloremque vitae laborum architecto. Officia est vero eos eos est eius. Ipsum nisi velit minima. Ipsum eum non odio ut neque voluptates voluptas. Id aliquam velit labore nisi impedit nihil. Et corporis provident nulla quasi nostrum fugiat. Aut incidunt maiores ipsum animi sint nam.', 7, 5, '2018-01-30 09:47:15', NULL),
(42, 'Et a tempora dolore velit.', 'Illum repellat tenetur quasi est omnis possimus eius. Vel dolorem eligendi omnis sit molestias debitis. Modi nulla exercitationem voluptatum dolorem. Quibusdam dolore tenetur quis tempora. Aliquam aliquam tempore praesentium non delectus. Quidem dolor soluta atque voluptas qui cum impedit. Voluptatem ullam delectus molestiae non delectus. Qui molestiae cumque similique autem ut dolorum laudantium. Aut eligendi vel quia beatae ipsam illum eum rerum. Magnam voluptatem aut ducimus voluptas perferendis.', 15, 7, '2018-01-30 09:47:15', NULL),
(43, 'Alias ut aut veritatis.', 'Animi cumque et sunt minus vitae quis incidunt. Numquam vero ut ea id assumenda voluptatem voluptatum. Quis magnam aperiam ducimus. Dolores molestiae ea nam velit. Et qui laudantium est excepturi quos eveniet enim. Ut unde alias commodi sit distinctio totam sunt. Sint optio rerum soluta omnis aliquam. Similique est explicabo eius sit.', 1, 3, '2018-01-30 09:47:15', NULL),
(44, 'Veritatis at aspernatur non.', 'Ipsum voluptas numquam minima provident iusto qui architecto sit. Nostrum qui illum dolor pariatur. Dolorem molestiae corrupti debitis qui nihil. Officiis perspiciatis doloremque voluptatem possimus. Repudiandae fugit dolor doloremque dolores. Quia nam eligendi at quae ut eveniet voluptatem. Aut id ab alias quas consectetur. Totam ut libero qui et dolore ut. Laborum optio doloribus sint voluptatum quo quibusdam accusamus. Tempore aut rerum tempore placeat consequatur qui. Nemo debitis corporis qui nobis dicta dolorem rem suscipit. Et at expedita totam officiis est quo doloribus. Ipsum quis minus pariatur minus nulla. Officia vitae id enim a. Est soluta in consequatur ipsa commodi.', 18, 4, '2018-01-30 09:47:15', NULL),
(45, 'Provident est atque aspernatur earum inventore.', 'Veritatis error maiores dolores quas neque. Placeat sed aut qui aut et totam rerum amet. Et debitis quia possimus illo quod. Porro ea qui cum facilis. Aut expedita incidunt pariatur nam voluptas tempore aut fuga. Eum nisi quia eos quos voluptates tempora error. Quam aliquam quas exercitationem dolore ipsum autem inventore. Quisquam et impedit nisi consequatur perspiciatis asperiores alias.', 16, 3, '2018-01-30 09:47:15', NULL),
(46, 'Voluptatum modi labore ullam voluptatem.', 'Rerum sed facere doloribus exercitationem nemo omnis est. Neque autem voluptas dolorem vel excepturi exercitationem neque. Est assumenda iusto delectus recusandae. Cumque quis totam aspernatur et repellendus consequatur. Officiis eaque provident eos quia cum. Sapiente laudantium illo voluptatem voluptate. Soluta est exercitationem dicta. Libero ipsam quo nihil quae voluptatem reprehenderit dolore eveniet. Nihil consequatur libero voluptate rerum est voluptas ut. Ut aspernatur quidem distinctio. Debitis omnis quia non.', 17, 2, '2018-01-30 09:47:15', NULL),
(47, 'Ipsum animi quis earum et debitis.', 'Ab laborum illo voluptas cumque et voluptas expedita praesentium. Ex numquam accusantium qui quia. Exercitationem cum odit facere sit. Sequi sint itaque rerum voluptatem tempora sed. Quia alias ut aut aut eos quis. Harum laborum fugiat cum ad. Voluptatum id est nostrum ut. Praesentium ipsam eum ad nemo ipsa.', 15, 4, '2018-01-30 09:47:15', NULL),
(48, 'Aperiam atque libero omnis nesciunt.', 'Dolore repudiandae voluptas quo incidunt. Repellat et quidem ipsum sed magnam architecto vero officiis. Voluptatibus atque voluptatibus eum commodi. Eos aut tenetur sit voluptatem. Et sunt qui ipsum officia repellendus ut. Sed a et rerum. Voluptatibus voluptates eius illum aut illum non sit recusandae. Quisquam et dolor in sed ut. Deserunt temporibus molestiae et corporis. Dolores laudantium aut aperiam quas quo deserunt. Maxime sunt explicabo totam eius nesciunt. Voluptatem sint quo ut sed. Consequatur et dolores cum quia voluptatibus.', 20, 5, '2018-01-30 09:47:15', NULL),
(49, 'Natus similique reprehenderit consequatur enim.', 'Aut hic provident consequatur nulla in. Et sunt quo quaerat. Inventore quibusdam odit facilis possimus et quos. Placeat nihil ea eius iure laboriosam dolorem. Provident ullam sint esse architecto quisquam nostrum accusamus. Aut velit ab eum rerum et ipsa saepe. Quos atque maiores iste est facilis voluptatem eveniet. Sequi et autem error reiciendis est eaque sunt. Rerum dolorem nihil dolor neque repudiandae. Sed dolorem sed est sunt quos harum assumenda.', 19, 8, '2018-01-30 09:47:15', NULL),
(50, 'Iste autem omnis in voluptas.', 'Maiores eligendi laboriosam veritatis tenetur quibusdam magni. Sit eos est laborum exercitationem laudantium iste magni. Et aspernatur repellendus soluta voluptatem. Voluptatum omnis suscipit iusto quam architecto aut aliquam architecto. Reprehenderit ea laudantium voluptatem aut. Ab et a quam perferendis dolorem ab. Aspernatur eum eum enim quam consequatur tempore.', 19, 1, '2018-01-30 09:47:15', NULL),
(51, 'Voluptatem aliquid qui nihil quis saepe.', 'Deleniti aut nihil atque nulla qui enim natus maxime. Accusantium similique itaque id reiciendis dicta. Et consequatur cum possimus odio facere voluptatem laudantium. Voluptatem illo alias natus id. Consequuntur consequatur laboriosam quam et. Recusandae at et quam culpa eveniet. Minus accusantium voluptas libero voluptatem aut dignissimos ea. In qui harum est est quasi iste. Autem suscipit cum repellendus voluptas. Qui voluptatibus eum molestiae autem quas quidem et. Hic sequi magnam qui et suscipit accusantium autem. Sit qui laudantium qui suscipit ut. Assumenda corporis explicabo et officiis dolor. Quod quae provident voluptatum veritatis laborum explicabo dolores. Non ea aperiam fugit.', 20, 7, '2018-01-30 09:47:15', NULL),
(52, 'Eum explicabo aut.', 'Rem consequatur et sit. Dolor eligendi possimus deleniti harum labore amet molestias. Eum quia et est quaerat omnis odit reiciendis. Doloribus harum perspiciatis alias rerum est fugiat ipsa. Nulla sint dignissimos asperiores. Temporibus ducimus quidem praesentium minus autem tenetur. Illo voluptatum qui ex.', 15, 1, '2018-01-30 09:47:15', NULL),
(53, 'Voluptatem magnam earum.', 'Commodi voluptatem consectetur ex occaecati inventore quam. Voluptatem odit officiis ducimus necessitatibus quos. Consequuntur dignissimos delectus tempore amet. Dolores fugit possimus voluptas ipsam doloribus explicabo. Voluptatem vel quia dolorem laboriosam consequatur. Asperiores quis sed iusto perspiciatis. Sunt et voluptatem architecto vel dolorem. Est consectetur eum commodi atque sint.', 15, 11, '2018-01-30 09:47:15', NULL),
(54, 'Perferendis fuga repudiandae et.', 'Nemo cumque eveniet sapiente illum excepturi sit cum. Quisquam quas facilis enim dolor. Omnis sit eveniet accusantium omnis. Sequi earum autem saepe ut soluta. A voluptatem provident sit ratione reprehenderit et. Laboriosam repellat repellendus sit. Repudiandae quis fugit omnis voluptas occaecati iste aut. Pariatur omnis voluptatem et sunt deserunt aut.', 17, 7, '2018-01-30 09:47:15', NULL),
(55, 'Voluptate sit quam excepturi aut ut.', 'Aliquam vitae non id voluptas et quia aliquam. Et sed ipsa qui nisi non dolores. Ut aliquid dolores qui magni similique iure. Repellat unde est totam recusandae dolores dolor magni. Eveniet consequatur eos provident in modi quos ut. Qui ut qui numquam. Corrupti et dolor eveniet delectus. Corrupti accusamus et iusto nesciunt. Quas non ratione minus sed nemo. Beatae harum aliquam voluptate dolores ut. Unde ducimus debitis voluptas voluptatibus. At quas neque autem quos sed hic ipsum fugit. Nemo consequatur aliquam quia alias omnis.', 2, 5, '2018-01-30 09:47:15', NULL),
(56, 'Ad a animi deserunt ut voluptatem.', 'Reiciendis atque inventore id eaque ut eius. Fugiat totam beatae esse ut molestias voluptatem aut. Hic aliquam occaecati ducimus corrupti numquam. Laudantium dolorum consequatur dolorem id autem. Sunt soluta aut maxime aut dignissimos. Mollitia illum ipsum ut quas. At tempore maiores voluptatem illo sint perferendis est. Ut vel tempore sit culpa dolores nemo quidem. Vel odit odit inventore et.', 14, 4, '2018-01-30 09:47:15', NULL),
(57, 'Ratione reprehenderit amet fuga et.', 'Minima voluptas amet aut maiores. Corrupti alias veniam tenetur tempora porro ab. Unde deleniti dicta omnis itaque molestiae vitae minima hic. Illo possimus ab impedit doloribus quam. Sed quam et a voluptas eos est odit. Harum voluptas et eum nihil ut architecto illum. Nihil laboriosam nemo enim laudantium et nemo. Atque enim et esse animi non. Mollitia et dolore voluptatem error.', 12, 1, '2018-01-30 09:47:15', NULL),
(58, 'Veniam dolores at exercitationem.', 'Inventore iste et iusto exercitationem. Aut earum tenetur neque laborum quia laborum. Quas et non rerum. Quam nesciunt et est iste aliquid eius nulla. Inventore fuga dolorem natus tenetur. Asperiores asperiores est enim. Ea et voluptatem labore id. Qui libero laboriosam omnis aliquam molestiae qui. Harum vel eos similique et accusamus assumenda tempore repellat. Ducimus quaerat quo error commodi non.', 3, 6, '2018-01-30 09:47:15', NULL),
(59, 'Labore amet repellendus exercitationem incidunt maiores.', 'Dolorem dicta ab in quo expedita. Perferendis maxime sed ut provident molestiae. Odio voluptatibus quis rerum et voluptas quo aspernatur. Impedit perferendis est nesciunt. Tempora provident et neque ea sint assumenda quo. Ipsum ab alias vel deleniti cumque accusantium. Non dolorem perferendis aliquid minus facilis. Rem blanditiis sequi sit atque dolores quis. Et perferendis modi ut consequatur nulla dolores iusto. Suscipit quia et dolor et sed qui quam. Sint aut pariatur aut sed perspiciatis pariatur omnis ab. Earum eos asperiores nam et numquam quasi. Itaque ratione nulla iure accusamus qui. Omnis aliquam debitis ut ducimus qui vel.', 8, 10, '2018-01-30 09:47:15', NULL),
(60, 'Accusamus ea totam eaque quasi dignissimos.', 'Quo voluptas dolores atque sit. Aliquid repellat accusantium reprehenderit sit voluptas voluptate molestiae vel. Doloribus necessitatibus ex voluptas quas error. Dolorem alias molestiae ut exercitationem et. Voluptate excepturi dolorum eius at. Nam consequatur beatae quam labore et. Voluptas amet minus voluptas autem consectetur dolorum. Consectetur vel et laudantium assumenda sed totam maiores sit. Non minus at neque. Corporis aliquid reprehenderit eligendi voluptatem saepe.', 5, 6, '2018-01-30 09:47:15', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@test.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(2, 'berge.aidan', 'treutel.nona@marvin.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(3, 'dwuckert', 'moises.boyle@hotmail.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(4, 'dax.anderson', 'raynor.antonia@gmail.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(5, 'runte.chad', 'graham04@yahoo.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(6, 'albina13', 'georgiana66@grant.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(7, 'virgil06', 'funk.julia@beatty.info', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(8, 'gunnar.abbott', 'block.paolo@oberbrunner.info', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(9, 'hherzog', 'julia.lowe@schamberger.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(10, 'murphy.neha', 'alanna.feil@bashirian.net', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(11, 'jwalter', 'ortiz.zachery@hotmail.com', '371620aa75830b1388b63305b0d42f06', NULL, '2018-01-30 09:47:15', NULL),
(12, 'OberonNL', 'oberon@avalon.nl', '371620aa75830b1388b63305b0d42f06', NULL, '2018-02-01 10:34:24', NULL),
(13, 'KoosKlaproos', 'koosklaproos@friemel.nl', '371620aa75830b1388b63305b0d42f06', NULL, '2018-02-12 09:39:12', NULL);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT voor een tabel `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

--
-- Gegevens worden geëxporteerd voor tabel `pma__bookmark`
--

INSERT INTO `pma__bookmark` (`id`, `dbase`, `user`, `label`, `query`) VALUES
(4, 'webshop', 'root', 'opgave10', 'SELECT* FROM weborder'),
(5, 'webshop', 'root', 'opgave4', 'SELECT artiest, titel, genre\r\nFROM album'),
(6, 'webshop', 'root', 'opgave 5', 'SELECT voornaam, achternaam, straat\r\nFrom klant'),
(7, 'webshop', 'root', 'opgave6', 'SELECT artiest, titel, genre, prijs\r\nFROM album\r\nORDER BY artiest'),
(8, 'webshop', 'root', 'opgave7', 'SELECT*\r\nFROM album\r\nORDER BY titel'),
(9, 'webshop', 'root', '            opgave6        ', '\n            SELECT artiest, titel, genre, prijs\nFROM album\nORDER BY artiest DESC\n        '),
(10, 'webshop', 'root', '            opgave7        ', '\n            SELECT*\nFROM album\nORDER BY titel DESC\n        '),
(11, 'webshop', 'root', 'opgave8', 'SELECT *\r\nFROM album\r\nORDER BY titel DESC '),
(12, 'webshop', 'root', 'opgave9', 'SELECT*\r\nFROM klant\r\nWHERE woonplaats=\"amsterdam\"'),
(13, 'webshop', 'root', 'opgave 10 deze is goed', 'SELECT*\r\nFROM album\r\nWHERE genre=\"latin\"'),
(14, 'webshop', 'root', 'opgave 11', 'SELECT*\r\nFROM album\r\nWHERE prijs\r\nBETWEEN 3.00 AND 4.00'),
(15, 'webshop', 'root', 'opgave 12', 'SELECT*\r\nFROM weborder\r\nWHERE datum\r\nBETWEEN 2015-01-01 AND 2015-03-01'),
(16, 'webshop', 'root', 'opgave 13', 'SELECT*\r\nFROM album\r\nWHERE prijs \r\nBETWEEN 3.00 AND 4.00\r\nLIMIT 5'),
(17, 'webshop', 'root', 'opgave14', 'SELECT*\r\nFROM weborder\r\nWhere datum\r\nLIMIT 3'),
(18, 'webshop', 'root', 'opgave 15', 'SELECT DISTINCT weborder\r\nFROM item'),
(19, 'webshop', 'root', 'opgave 16', 'SELECT DISTINCT album_ID\r\nFROM item '),
(20, 'webshop', 'root', 'opgave 17', 'SELECT*\r\nFROM album\r\nWHERE artiest LIKE \"%to%\"'),
(21, 'webshop', 'root', 'opgave 18', 'SELECT*\r\nFROM album\r\nWHERE titel LIKE \"%Girl\";'),
(22, 'webshop', 'root', 'opgave 19', 'UPDATE klant\r\nSET straat = \"Gaileiplantsoen 111\", postcode = \"1010RR\"\r\nWHERE klant.ID = 5;'),
(23, 'webshop', 'root', 'opgave 20', 'INSERT INTO klant\r\n(voornaam,achternaam,straat,postcode,woonplaats,email)\r\nVALUES (\"lex\", \"Camilla\", \"Hagabakka 24\", \"4656RR\", \"Utrecht\", \"lecam@wanadoo.nl\")'),
(24, 'webshop', 'root', 'opgave 21', 'DELETE FROM klant\r\nWHERE klant.voornaam = \"lex\"'),
(29, 'webshop', 'root', 'opgave 22', 'SELECT COUNT(album_id)\r\nFROM item\r\nGROUP BY album_id\r\n'),
(30, 'webshop', 'root', 'opgave 23', 'SELECT MIN(prijs)\r\nFROM album'),
(31, 'webshop', 'root', 'opgave 24', 'SELECT MAX(prijs)\r\nFROM album'),
(32, 'webshop', 'root', 'opgave 25', 'SELECT SUM(aantal)\r\nFROM item'),
(33, 'webshop', 'root', 'opgave 26', 'SELECT SUM(voorraad)\r\nFROM album'),
(34, 'webshop', 'root', 'opgave 27', 'SELECT AVG(prijs)\r\nFROM album'),
(36, 'webshop', 'root', 'opgave 28', 'SELECT AVG(voorraad)\r\nFROM album'),
(37, 'webshop', 'root', 'opgave 29', 'SELECT voornaam\r\nFROM klant\r\nWHERE ID IN (SELECT klant_ID\r\nFROM weborder\r\nWHERE datum= \"2015-01-01\");'),
(38, 'webshop', 'root', 'opgave 30', 'SELECT\r\ntitel, artiest, genre, prijs\r\nFrom album\r\nWHERE prijs > (SELECT AVG(prijs)\r\n               FROM album);'),
(39, 'webshop', 'root', '            opgave 9        ', '\n            SELECT*\nFROM klant\nWHERE woonplaats=\"amsterdam\"\n        '),
(40, 'webshop', 'root', 'opgave 6                ', '\n            \n            SELECT artiest, titel, genre, prijs\nFROM album\nORDER BY artiest DESC\n        \n        '),
(41, 'webshop', 'root', '                        opgave 6                ', '\n            \n            SELECT artiest, titel, genre, prijs\nFROM album\nORDER BY artiest DESC\n        \n        '),
(42, 'webshop', 'root', '                        opgave 6                ', '\n            \n            SELECT artiest, titel, genre, prijs\nFROM album\nORDER BY artiest DESC\n        \n        '),
(43, 'webshop', 'root', 'opgave 31', 'SELECT\r\nweborder_ID, SUM(aantal * prijs_eenheid) AS Totaal\r\nFROM item\r\nGROUP BY weborder_ID'),
(44, 'webshop', 'root', 'opgave 32', 'SELECT\r\nweborder_ID, SUM(aantal) AS Totaal_items\r\nFROM item\r\nGROUP BY weborder_ID;'),
(45, 'webshop', 'root', 'opgave 33', 'SELECT\r\nweborder_ID, album_ID, SUM(aantal) AS Totaal_items\r\nFROM item\r\nGROUP BY weborder_ID\r\nHAVING album_ID = 1;');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Gegevens worden geëxporteerd voor tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"forum_gila\",\"table\":\"categories\"},{\"db\":\"forum_gila\",\"table\":\"users\"},{\"db\":\"forum_gila\",\"table\":\"topics\"},{\"db\":\"forum_gila\",\"table\":\"subcategories\"},{\"db\":\"forum_gila\",\"table\":\"replies\"},{\"db\":\"forum gila\",\"table\":\"subcategories\"},{\"db\":\"forum gila\",\"table\":\"categories\"},{\"db\":\"forum gila\",\"table\":\"topics\"},{\"db\":\"forum gila\",\"table\":\"replies\"},{\"db\":\"forum gila\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Gegevens worden geëxporteerd voor tabel `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('forum_gila', 'replies', 'author'),
('forum_gila', 'subcategories', 'subcategory_title'),
('forum_gila', 'topics', 'title');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Gegevens worden geëxporteerd voor tabel `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'forum_gila', 'categories', '{\"sorted_col\":\"`categories`.`category_title`  ASC\"}', '2019-06-24 20:20:51'),
('root', 'webshop', 'weborder', '[]', '2018-09-18 10:56:39');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Gegevens worden geëxporteerd voor tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2018-09-23 18:53:55', '{\"lang\":\"nl\"}'),
('root', '2019-06-28 21:33:14', '{\"lang\":\"nl\",\"Console\\/Mode\":\"show\",\"Console\\/Height\":95,\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexen voor tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexen voor tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexen voor tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexen voor tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexen voor tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexen voor tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexen voor tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexen voor tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexen voor tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexen voor tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT voor een tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `schiphol`
--
CREATE DATABASE IF NOT EXISTS `schiphol` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `schiphol`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker`
--

CREATE TABLE `gebruiker` (
  `ID` smallint(8) NOT NULL,
  `naam` varchar(42) NOT NULL,
  `postcode` varchar(7) NOT NULL,
  `geslacht` varchar(1) NOT NULL,
  `geboortedatum` date NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker`
--

INSERT INTO `gebruiker` (`ID`, `naam`, `postcode`, `geslacht`, `geboortedatum`, `email`) VALUES
(1, 'John ven den Berg', '1098LV', 'M', '1984-10-07', 'jvdb@live.nl'),
(2, 'Celia Hayna', '1999 BB', 'V', '1986-05-24', 'ch@nail.com'),
(3, 'Justin Boom', '2000AA', 'M', '1991-05-03', 'jv@live.nl'),
(4, 'Roemer Gallo', '1999BB', 'M', '1085-05-31', 'rg@hotmail.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klacht`
--

CREATE TABLE `klacht` (
  `ID` smallint(6) NOT NULL,
  `ID_gebruiker` varchar(43) NOT NULL,
  `ID_klachtsoort` varchar(32) NOT NULL,
  `postcode` varchar(45) NOT NULL,
  `datum` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klacht`
--

INSERT INTO `klacht` (`ID`, `ID_gebruiker`, `ID_klachtsoort`, `postcode`, `datum`) VALUES
(1, '1', '1', '1098 LV', '2016-05-01 18:00:00'),
(2, '2', '2', '1999 BB', '2016-05-11 19:30:00'),
(3, '3', '3', '2000 AA', '2016-05-10 09:30:00'),
(4, '4', '4', '1999 BB', '2016-05-10 11:45:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klachtsoort`
--

CREATE TABLE `klachtsoort` (
  `ID` int(11) NOT NULL,
  `klachtsoort` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klachtsoort`
--

INSERT INTO `klachtsoort` (`ID`, `klachtsoort`) VALUES
(1, 'milieu'),
(2, 'veiligheid'),
(3, 'geluid');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `postcode`
--

CREATE TABLE `postcode` (
  `postcode` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `postcode`
--

INSERT INTO `postcode` (`postcode`) VALUES
('1098 LV'),
('1098 LX'),
('1098 XX'),
('1099 TT'),
('1999 BB'),
('2000 AA');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `klacht`
--
ALTER TABLE `klacht`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `klachtsoort`
--
ALTER TABLE `klachtsoort`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `postcode`
--
ALTER TABLE `postcode`
  ADD PRIMARY KEY (`postcode`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  MODIFY `ID` smallint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `klacht`
--
ALTER TABLE `klacht`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `klachtsoort`
--
ALTER TABLE `klachtsoort`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `webshop`
--
CREATE DATABASE IF NOT EXISTS `webshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `webshop`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `album`
--

CREATE TABLE `album` (
  `ID` smallint(6) NOT NULL,
  `titel` varchar(45) NOT NULL,
  `artiest` varchar(45) NOT NULL,
  `genre` varchar(15) NOT NULL,
  `prijs` decimal(4,2) NOT NULL,
  `voorraad` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `album`
--

INSERT INTO `album` (`ID`, `titel`, `artiest`, `genre`, `prijs`, `voorraad`) VALUES
(1, 'cafe Atlantico', 'Cesaris Evora', 'World', '3.00', 100),
(3, 'Rumba Azul', 'Caetano Veloso', 'Latin', '4.90', 50),
(4, 'Survivor', 'Destiny\'s child', 'R&B', '3.00', 789),
(5, 'Oh Girl', 'The Chi-lites', 'Pop', '3.00', 2),
(6, 'Der herr ist mein getre', 'Ton Koopman', 'Klassiek', '5.50', 30),
(7, 'Closing Time', 'Tom Waits', 'Rock', '3.00', 0),
(8, 'Irresistible', 'Celia Cruz', 'Latin', '3.50', 23),
(9, 'Marvin Gaye II', 'Marvin Gaye', 'R&B', '4.00', 154),
(10, 'Mi Sangre', 'Juanes', 'Latin', '3.90', 123),
(11, 'Greatest hits 2', 'Queen', 'Rock', '3.00', 0),
(12, '3121 ', 'Prince', 'Rock', '3.45', 0),
(13, 'Antologia I', 'Paco de Lucia', 'world', '3.00', 320);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `item`
--

CREATE TABLE `item` (
  `ID` int(11) NOT NULL,
  `weborder_ID` varchar(100) NOT NULL,
  `klant_ID` varchar(100) NOT NULL,
  `album_ID` varchar(100) NOT NULL,
  `aantal` varchar(100) NOT NULL,
  `prijs_eenheid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `item`
--

INSERT INTO `item` (`ID`, `weborder_ID`, `klant_ID`, `album_ID`, `aantal`, `prijs_eenheid`) VALUES
(1, '1', '1', '1', '1', '3.00'),
(2, '1', '1', '5', '2', '5.50'),
(3, '2', '5', '8', '1', '4.00'),
(4, '2', '5', '10', '2', '3.00'),
(5, '3', '3', '1', '1', '3.00'),
(6, '4', '2', '5', '1', '5.50'),
(7, '4', '2', '8', '1', '4.00'),
(9, '4', '2', '6', '1', '3.00'),
(10, '5', '6', '4', '2', '3.00'),
(11, '5', '6', '6', '1', '3.00'),
(12, '5', '6', '1', '1', '3.00'),
(13, '5', '6', '9', '1', '3.90'),
(14, '5', '6', '10', '3', '3.00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `ID` int(11) NOT NULL,
  `voornaam` varchar(100) NOT NULL,
  `achternaam` varchar(100) NOT NULL,
  `straat` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `woonplaats` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`ID`, `voornaam`, `achternaam`, `straat`, `postcode`, `woonplaats`, `email`) VALUES
(1, 'Dylan', 'Huisden', 'MIddenweg 11', '1088 VV', 'Amsterdam', 'dhuisen@roc.nl'),
(2, 'Nitin', 'Bosman', 'Leidseweg 22', '9900 BB', 'Amsterdam', 'nbosman@roc.nl'),
(3, 'Joseph', 'Demirel', 'Leidseplein 33', '9988 BB', 'Utrecht', 'josdem@hotmail.com'),
(4, 'Franco', 'Tasiyan', 'Kruislaan 44', '3300 VV', 'Utrecht', 'frantas@wanadoo.nl'),
(5, 'Akash', 'kabli', 'Gaileiplantsoen 111', '1010RR', 'amstelveen', 'aka@hetnet.nl'),
(6, 'Tamra', 'kabli', 'Mozarstraat 22', '3388 xx', 'Amsterdam', 'Tamka@hotmail.com'),
(7, 'Arnold', 'Shaw', 'Kruislaan 1', '9876 FF', 'Rotterdam', 'asha@roc.nl');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `weborder`
--

CREATE TABLE `weborder` (
  `ID` int(11) NOT NULL,
  `klant_ID` varchar(100) NOT NULL,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `weborder`
--

INSERT INTO `weborder` (`ID`, `klant_ID`, `datum`) VALUES
(0, '1', '2015-01-01 00:00:00'),
(0, '1', '2015-01-01 00:00:00'),
(0, '2', '2015-02-15 00:00:00'),
(0, '3', '2015-02-20 00:00:00'),
(0, '3', '2015-03-13 00:00:00');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `album`
--
ALTER TABLE `album`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `item`
--
ALTER TABLE `item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
