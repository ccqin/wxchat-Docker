FROM alpine:3.21

ENV TZ=Asia/Shanghai

RUN apk add --no-cache tzdata nginx python3 py3-pip

COPY rootfs/app/requirements.txt /app/requirements.txt

RUN apk add --no-cache --virtual .build-deps build-base python3-dev && \
    pip3 install --no-cache-dir -r /app/requirements.txt && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* /tmp/*

COPY --chmod=755 ./rootfs /

RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]