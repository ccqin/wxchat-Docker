# MoviePilot 微信转发代理 Docker

[![Build](https://github.com/ccqin/wxchat-Docker/actions/workflows/main.yml/badge.svg)](https://github.com/ccqin/wxchat-Docker/actions/workflows/main.yml)
```bash
docker run -d \
    --name wxchat \
    --restart=always \
    -p 80:80 \
    ccqin/wxchat:latest
    后面自己写一下。。
```

```yaml
version: "3.8"
services:
  wxchat:
    container_name: wxchat
    restart: always
    ports:
      - 7777:80
    environment:
      - WECOM_TOKEN=微信token
      - WECOM_ENCODING_AES_KEY=微信key
      - WECOM_CORP_ID=企业id
    image: ccqin/wxchat:latest
networks: {}
```