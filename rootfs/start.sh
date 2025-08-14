#!/bin/sh

# 启动 Nginx
nginx -g 'daemon off;' &

# 启动 Flask 应用
python3 /app/app.py
