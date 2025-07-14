#!/usr/bin/bash

cp fx.repo /etc/yum.repos.d/
yum makecache
yum install fx_autotrade-system -y
cp fx-autotrade.service /etc/systemd/system/
systemctl daemon-reload
