#!/usr/bin/bash

set -e  # エラーがあったらスクリプトを即終了

# リポジトリを追加
cp fx.repo /etc/yum.repos.d/

# キャッシュを更新
yum makecache

# RPMパッケージと依存パッケージをインストール
yum install -y python3-pip fx_autotrade-system

# systemd サービスの登録
cp fx-autotrade.service /etc/systemd/system/
systemctl daemon-reload

# Python依存パッケージをインストール
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

# セットアップスクリプトの実行
python3 /opt/Innovations/System/Setup.py
