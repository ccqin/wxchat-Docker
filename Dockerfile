FROM alpine:3.21

ENV TZ=Asia/Shanghai

RUN apk add --no-cache \
      tzdata \
      nginx \
      python3 \
      py3-pip \
      py3-flask \
      py3-pycryptodome \
    && rm -rf /var/cache/apk/* /tmp/*

COPY --chmod=755 ./rootfs /

RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]