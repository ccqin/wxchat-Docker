FROM alpine:3.21

ENV TZ=Asia/Shanghai

RUN apk add --no-cache tzdata nginx python3 py3-pip && \
    pip3 install --no-cache-dir -r /app/requirements.txt && \
    rm -rf /var/cache/apk/* /tmp/*

COPY --chmod=755 ./rootfs /

RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]