-- phpMyAdmin SQL Dump
-- version 5.2.2-1.el9
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2025 年 7 月 12 日 02:28
-- サーバのバージョン： 8.0.41
-- PHP のバージョン: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `Trade`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bot_config`
--

CREATE TABLE `bot_config` (
  `key` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  `ettc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `bot_config`
--

INSERT INTO `bot_config` (`key`, `value`, `ettc`) VALUES
('CHECK_INTERVAL', '2', 'メインループの待機秒数'),
('File_Hash', '1', 'ファイルハッシュ:未使用'),
('LOT_SIZE', '1000', '取引をするロットサイズ:使用するAPIの最低量'),
('MACD_DIFF_THRESHOLD', '0.0015', ''),
('MAINTENANCE_MARGIN_RATIO', '0.5', ''),
('MAX_LOSS', '20', ''),
('MAX_SPREAD', '0.03', '許容するスプレッド上限'),
('MAX_Stop', '180', '初動検知後の待機秒数'),
('MIN_PROFIT', '40', '最大利確額(円)'),
('SKIP_MODE', '0', ''),
('SYMBOL', 'USD_JPY', ''),
('TIME_STOP', '22', ''),
('USD_TIME', '1', '東京市場専用モードにする場合は0'),
('VOL_THRESHOLD', '0.03', '');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `bot_config`
--
ALTER TABLE `bot_config`
  ADD PRIMARY KEY (`key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
