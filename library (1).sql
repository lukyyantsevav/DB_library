-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4:3306
-- Время создания: Апр 09 2026 г., 19:07
-- Версия сервера: 8.4.6
-- Версия PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `active_issues`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `active_issues` (
`id` int
,`reader_name` varchar(255)
,`publication_title` varchar(255)
,`author` varchar(255)
,`issue_date` date
,`planned_return_date` date
,`actual_return_date` date
,`wear_factor` decimal(3,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `available_books`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `available_books` (
`copy_id` int
,`title` varchar(255)
,`author` varchar(255)
,`wear_factor` decimal(3,2)
);

-- --------------------------------------------------------

--
-- Структура таблицы `copies`
--

CREATE TABLE `copies` (
  `id` int NOT NULL,
  `publication_id` int NOT NULL,
  `wear_factor` decimal(3,2) DEFAULT '1.00',
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Дамп данных таблицы `copies`
--

INSERT INTO `copies` (`id`, `publication_id`, `wear_factor`, `is_available`, `created_at`) VALUES
(1, 1, 0.95, 1, '2025-12-01 03:53:41'),
(2, 1, 0.80, 1, '2025-12-01 03:53:41'),
(3, 1, 1.00, 1, '2025-12-01 03:53:41'),
(4, 2, 0.90, 1, '2025-12-01 03:53:41'),
(5, 2, 0.75, 1, '2025-12-01 03:53:41'),
(6, 3, 0.85, 1, '2025-12-01 03:53:41'),
(7, 3, 0.95, 1, '2025-12-01 03:53:41'),
(8, 4, 1.00, 1, '2025-12-01 03:53:41'),
(9, 5, 0.98, 1, '2025-12-01 03:53:41'),
(10, 5, 0.92, 1, '2025-12-01 03:53:41'),
(11, 1, 0.88, 1, '2026-04-09 13:55:28'),
(12, 1, 0.72, 1, '2026-04-09 13:55:28'),
(13, 2, 0.98, 1, '2026-04-09 13:55:28'),
(14, 2, 0.85, 1, '2026-04-09 13:55:28'),
(15, 2, 0.60, 1, '2026-04-09 13:55:28'),
(16, 3, 0.90, 1, '2026-04-09 13:55:28'),
(17, 3, 0.78, 1, '2026-04-09 13:55:28'),
(18, 3, 0.65, 1, '2026-04-09 13:55:28'),
(19, 4, 0.95, 1, '2026-04-09 13:55:28'),
(20, 4, 0.82, 1, '2026-04-09 13:55:28'),
(21, 5, 0.99, 1, '2026-04-09 13:55:28'),
(22, 5, 0.94, 1, '2026-04-09 13:55:28'),
(23, 5, 0.89, 1, '2026-04-09 13:55:28'),
(24, 1, 0.88, 1, '2026-04-09 13:56:56'),
(25, 1, 0.72, 1, '2026-04-09 13:56:56'),
(26, 2, 0.98, 1, '2026-04-09 13:56:56'),
(27, 2, 0.85, 1, '2026-04-09 13:56:56'),
(28, 2, 0.60, 1, '2026-04-09 13:56:56'),
(29, 3, 0.90, 1, '2026-04-09 13:56:56'),
(30, 3, 0.78, 1, '2026-04-09 13:56:56'),
(31, 3, 0.65, 1, '2026-04-09 13:56:56'),
(32, 4, 0.95, 1, '2026-04-09 13:56:56'),
(33, 4, 0.82, 1, '2026-04-09 13:56:56'),
(34, 5, 0.99, 1, '2026-04-09 13:56:56'),
(35, 5, 0.94, 1, '2026-04-09 13:56:56'),
(36, 5, 0.89, 1, '2026-04-09 13:56:56');

-- --------------------------------------------------------

--
-- Структура таблицы `issues`
--

CREATE TABLE `issues` (
  `id` int NOT NULL,
  `copy_id` int NOT NULL,
  `reader_id` int NOT NULL,
  `issue_date` date NOT NULL,
  `planned_return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `issues`
--

INSERT INTO `issues` (`id`, `copy_id`, `reader_id`, `issue_date`, `planned_return_date`, `actual_return_date`, `created_at`) VALUES
(1, 1, 1, '2024-01-10', '2024-02-10', '2024-02-08', '2025-12-01 03:53:41'),
(2, 2, 2, '2024-01-15', '2024-02-15', '2024-02-20', '2025-12-01 03:53:41'),
(3, 4, 3, '2024-02-01', '2024-03-01', NULL, '2025-12-01 03:53:41'),
(4, 6, 4, '2024-02-05', '2024-03-05', NULL, '2025-12-01 03:53:41'),
(5, 3, 1, '2024-02-12', '2024-03-12', '2024-03-10', '2026-04-09 13:55:28'),
(6, 5, 5, '2024-02-20', '2024-03-20', NULL, '2026-04-09 13:55:28'),
(7, 7, 2, '2024-02-25', '2024-03-25', '2024-03-22', '2026-04-09 13:55:28'),
(8, 9, 6, '2024-03-01', '2024-04-01', NULL, '2026-04-09 13:55:28'),
(9, 11, 1, '2024-03-05', '2024-04-05', '2024-04-02', '2026-04-09 13:55:28'),
(10, 13, 3, '2024-03-10', '2024-04-10', NULL, '2026-04-09 13:55:28'),
(11, 14, 4, '2024-03-15', '2024-04-15', '2024-04-10', '2026-04-09 13:55:28'),
(12, 16, 7, '2024-03-20', '2024-04-20', NULL, '2026-04-09 13:55:28'),
(13, 18, 1, '2024-03-25', '2024-04-25', '2024-04-20', '2026-04-09 13:55:28'),
(14, 19, 2, '2024-04-01', '2024-05-01', NULL, '2026-04-09 13:55:28'),
(15, 21, 5, '2024-04-05', '2024-05-05', '2024-05-01', '2026-04-09 13:55:28'),
(16, 3, 1, '2024-02-12', '2024-03-12', '2024-03-10', '2026-04-09 13:56:56'),
(17, 5, 5, '2024-02-20', '2024-03-20', NULL, '2026-04-09 13:56:56'),
(18, 7, 2, '2024-02-25', '2024-03-25', '2024-03-22', '2026-04-09 13:56:56'),
(19, 9, 6, '2024-03-01', '2024-04-01', NULL, '2026-04-09 13:56:56'),
(20, 11, 1, '2024-03-05', '2024-04-05', '2024-04-02', '2026-04-09 13:56:56'),
(21, 13, 3, '2024-03-10', '2024-04-10', NULL, '2026-04-09 13:56:56'),
(22, 14, 4, '2024-03-15', '2024-04-15', '2024-04-10', '2026-04-09 13:56:56'),
(23, 16, 7, '2024-03-20', '2024-04-20', NULL, '2026-04-09 13:56:56'),
(24, 18, 1, '2024-03-25', '2024-04-25', '2024-04-20', '2026-04-09 13:56:56'),
(25, 19, 2, '2024-04-01', '2024-05-01', NULL, '2026-04-09 13:56:56'),
(26, 21, 5, '2024-04-05', '2024-05-05', '2024-05-01', '2026-04-09 13:56:56');

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`id`, `title`, `author`, `created_at`) VALUES
(1, 'Мастер и Маргарита', 'Михаил Булгаков', '2025-12-01 03:53:40'),
(2, 'Преступление и наказание', 'Фёдор Достоевский', '2025-12-01 03:53:40'),
(3, 'Война и мир', 'Лев Толстой', '2025-12-01 03:53:40'),
(4, '1984', 'Джордж Оруэлл', '2025-12-01 03:53:40'),
(5, 'Гарри Поттер и философский камень', 'Джоан Роулинг', '2025-12-01 03:53:40');

-- --------------------------------------------------------

--
-- Структура таблицы `readers`
--

CREATE TABLE `readers` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `readers`
--

INSERT INTO `readers` (`id`, `full_name`, `created_at`) VALUES
(1, 'Иванов Иван Иванович', '2025-12-01 03:53:41'),
(2, 'Петрова Анна Сергеевна', '2025-12-01 03:53:41'),
(3, 'Сидоров Алексей Владимирович', '2025-12-01 03:53:41'),
(4, 'Козлова Мария Дмитриевна', '2025-12-01 03:53:41'),
(5, 'Соколов Дмитрий Петрович', '2026-04-09 13:55:28'),
(6, 'Волкова Елена Александровна', '2026-04-09 13:55:28'),
(7, 'Морозов Андрей Викторович', '2026-04-09 13:55:28'),
(8, 'Соколов Дмитрий Петрович', '2026-04-09 13:56:56'),
(9, 'Волкова Елена Александровна', '2026-04-09 13:56:56'),
(10, 'Морозов Андрей Викторович', '2026-04-09 13:56:56');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_copies_publication_id` (`publication_id`),
  ADD KEY `idx_copies_available` (`is_available`);

--
-- Индексы таблицы `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_issues_copy_id` (`copy_id`),
  ADD KEY `idx_issues_reader_id` (`reader_id`),
  ADD KEY `idx_issues_dates` (`issue_date`,`planned_return_date`,`actual_return_date`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `readers`
--
ALTER TABLE `readers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `copies`
--
ALTER TABLE `copies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `readers`
--
ALTER TABLE `readers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- --------------------------------------------------------

--
-- Структура для представления `active_issues`
--
DROP TABLE IF EXISTS `active_issues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `active_issues`  AS SELECT `i`.`id` AS `id`, `r`.`full_name` AS `reader_name`, `p`.`title` AS `publication_title`, `p`.`author` AS `author`, `i`.`issue_date` AS `issue_date`, `i`.`planned_return_date` AS `planned_return_date`, `i`.`actual_return_date` AS `actual_return_date`, `c`.`wear_factor` AS `wear_factor` FROM (((`issues` `i` join `readers` `r` on((`i`.`reader_id` = `r`.`id`))) join `copies` `c` on((`i`.`copy_id` = `c`.`id`))) join `publications` `p` on((`c`.`publication_id` = `p`.`id`))) WHERE (`i`.`actual_return_date` is null) ;

-- --------------------------------------------------------

--
-- Структура для представления `available_books`
--
DROP TABLE IF EXISTS `available_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `available_books`  AS SELECT `c`.`id` AS `copy_id`, `p`.`title` AS `title`, `p`.`author` AS `author`, `c`.`wear_factor` AS `wear_factor` FROM (`copies` `c` join `publications` `p` on((`c`.`publication_id` = `p`.`id`))) WHERE (`c`.`is_available` = true) ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`copy_id`) REFERENCES `copies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
