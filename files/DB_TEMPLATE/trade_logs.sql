-- データベース: `Trade`

-- テーブルの構造 `trade_logs`
CREATE TABLE `trade_logs` (
  `id` int NOT NULL,
  `timestamp` datetime NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(15,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- テーブルのインデックス
ALTER TABLE `trade_logs`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT 設定
ALTER TABLE `trade_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
