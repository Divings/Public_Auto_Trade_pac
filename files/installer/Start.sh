#!/usr/bin/bash

sudo chown -R autotrade:autotrade /etc/AutoTrade/aes_key.bin
systemctl daemon-reload
systemctl restart fx-autotrade.service