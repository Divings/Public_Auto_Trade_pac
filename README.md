Copyright (c) 2025 合同会社Anvelk Innovations All Rights Reserved.

本ソフトウェアは合同会社Anvelk Innovationsのプロプライエタリライセンスのもとで提供されています。

学習および閲覧目的に限り、本ソフトウェアおよび関連スクリプトの内容を参照することを許可します。
また、利用者自身が私的に使用する目的に限り、本ソフトウェアを改変することを許可します。

ただし、改変の有無を問わず、本ソフトウェア（RPMパッケージ、インストールスクリプト、設定ファイル等を含みます）の全部または一部を、
第三者に対して複製、再配布、公開、販売、共有、再ライセンスすることは禁止されています。

本ソフトウェアの詳細な利用条件については、
同梱の EULA および LICENSE ファイルを参照してください。
本ソフトウェア（利用者による改変を含みます）の使用または使用不能により生じたいかなる損害についても、当社は一切の責任を負いません。


FX AutoTrade System
====================

FX自動売買システムのRPMパッケージとインストールスクリプト一式です。

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

    sudo python3 /opt/tools/get_log.py

または：

    sudo journalctl -u fx-autotrade.service

