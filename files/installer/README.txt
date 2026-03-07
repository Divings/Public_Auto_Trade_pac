# Copyright (c) 2025 Innovation Craft Inc. All Rights Reserved.
# 本ソフトウェアは Innovation Craft Inc. のプロプライエタリライセンスに基づいて提供されています。
# 本ソフトウェアの使用、複製、改変、再配布には Innovation Craft Inc. の事前の書面による許可が必要です。

FX AutoTrade System
====================

FX自動売買システムのRPMパッケージとインストールスクリプト一式です。

構成
----
RPM/
├── fx.repo                     # YUM/DNFリポジトリ設定ファイル
├── fx-autotrade.service        # systemdサービス定義
├── get_log.py                  # ログ取得スクリプト
├── install.sh                  # インストールスクリプト
├── Start.sh                    # サービス起動スクリプト
├── Update.sh                   # アップデートスクリプト
├── README.txt                  # 説明書（このファイル）
├── Package/
│   ├── fx_autotrade-system-*.rpm # バージョンごとのRPMパッケージ群

インストール手順
----------------

1. インストールスクリプトの実行

以下を実行することで、必要な設定とインストールが自動的に行われます：

    cd RPM
    sudo bash install.sh

このスクリプトでは以下の処理が実行されます：

- `fx.repo` を `/etc/yum.repos.d/` にコピー
- YUMキャッシュの更新:
      yum makecache
- `fx_autotrade-system` パッケージのインストール:
      yum install fx_autotrade-system -y
- `fx-autotrade.service` を `/etc/systemd/system/` にコピー
- systemdのデーモンをリロード:
      systemctl daemon-reload

2. サービス起動

    sudo bash Start.sh

または直接systemdで起動する場合：

    sudo systemctl start fx-autotrade.service
    sudo systemctl enable fx-autotrade.service

3. アップデート

アップデートスクリプトで自動更新できます：

    sudo bash Update.sh

または、新しいRPMを手動で指定してアップグレード：

    sudo yum upgrade -y RPM/Package/fx_autotrade-system-<new_version>.rpm

ログ確認
--------

ログを確認するには：

    sudo python3 RPM/get_log.py

または：

    sudo journalctl -u fx-autotrade.service

バージョン
----------

`RPM/Package/` 以下に複数のバージョンのRPMが同梱されています。必要に応じてお好きなバージョンをインストールしてください。
なお、同梱されているパッケージ以降のバージョンをインストールする場合は、/opt/Innovations/SystemにあるUpdate.shを
sudo権限で実行してください

