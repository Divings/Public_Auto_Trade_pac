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
yum install -y python3-pip

sudo yum install -y ./fx_autotrade-system-524.11.0-2.el9.x86_64.rpm

systemctl enable fx-autotrade.service

# スクリプトを所定のディレクトリにコピー
mkdir -p /opt/tools/
cp Start.sh /opt/tools # 起動スクリプトのコピー
chmod +x /opt/tools/Start.sh

# ディレクトリ移動
cd /opt/Innovations/System/

# セットアップの実行
sudo ./AutoTrade --setup

chown -R autotrade:autotrade /etc/AutoTrade/aes_key.bin
chown -R autotrade:autotrade /etc/AutoTrade/api_settings.db