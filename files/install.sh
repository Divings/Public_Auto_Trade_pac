#!/usr/bin/env bash

set -e  # エラーがあったらスクリプトを即終了
cd "$(dirname "$0")"

# rootユーザーでの実行を確認
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# リポジトリを追加
cp fx.repo /etc/yum.repos.d/

# キャッシュを更新
yum makecache

# RPMパッケージと依存パッケージをインストール
yum install -y python3-pip fx_autotrade-system

# GPGのインストール
yum install -y gpg 

# systemd サービスの登録
cp fx-autotrade.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable fx-autotrade.service

# Python依存パッケージをインストール
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

# スクリプトを所定のディレクトリにコピー
mkdir -p /opt/tools/
cp get_logs.py /opt/tools/ # ログ取得スクリプトのコピー
cp Start.sh /opt/tools # 起動スクリプトのコピー
chmod +x /opt/tools/Start.sh

# ディレクトリ移動
cd /opt/Innovations/System/
# セットアップスクリプトの実行
python3 /opt/Innovations/System/Setup.py

