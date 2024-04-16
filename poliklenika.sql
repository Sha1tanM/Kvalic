-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 16 2024 г., 12:04
-- Версия сервера: 8.0.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `poliklenika`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bolinue`
--

CREATE TABLE `bolinue` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `rozgdenie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolinue`
--

INSERT INTO `bolinue` (`id`, `name`, `adres`, `rozgdenie`) VALUES
(1, 'Иванов Иван Иванович', 'Каширское шоссе, д104', '2014-04-02'),
(2, 'Евгений Жуков Ильич', 'Маршаво захараво, д 105', '2015-04-02'),
(11, 'Женя', 'Пушкинская', '2024-02-05');

-- --------------------------------------------------------

--
-- Структура таблицы `diagnoz`
--

CREATE TABLE `diagnoz` (
  `id` int NOT NULL,
  `osmotr` date NOT NULL,
  `zaklu4enie` varchar(30) NOT NULL,
  `id_vrach` int NOT NULL,
  `id_bolinue` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `diagnoz`
--

INSERT INTO `diagnoz` (`id`, `osmotr`, `zaklu4enie`, `id_vrach`, `id_bolinue`) VALUES
(1, '2023-04-04', 'Бранхит', 1, 1),
(2, '2020-04-08', 'Перелом', 2, 2),
(3, '2016-04-06', 'Бранхит', 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `vrach`
--

CREATE TABLE `vrach` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `specialnosti` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vrach`
--

INSERT INTO `vrach` (`id`, `name`, `specialnosti`) VALUES
(1, 'Бердичевский Илья Викторович', 'Теропевт'),
(2, 'Рассохин Игорь Дмитриевич', 'Хирург');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bolinue`
--
ALTER TABLE `bolinue`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diagnoz`
--
ALTER TABLE `diagnoz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vrach` (`id_vrach`),
  ADD KEY `id_bolinue` (`id_bolinue`);

--
-- Индексы таблицы `vrach`
--
ALTER TABLE `vrach`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bolinue`
--
ALTER TABLE `bolinue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `diagnoz`
--
ALTER TABLE `diagnoz`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `vrach`
--
ALTER TABLE `vrach`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `diagnoz`
--
ALTER TABLE `diagnoz`
  ADD CONSTRAINT `diagnoz_ibfk_1` FOREIGN KEY (`id_bolinue`) REFERENCES `bolinue` (`id`),
  ADD CONSTRAINT `diagnoz_ibfk_2` FOREIGN KEY (`id_vrach`) REFERENCES `vrach` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
