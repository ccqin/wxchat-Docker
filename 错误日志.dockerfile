Run docker/build-push-action@v6
GitHub Actions runtime token ACs
Docker info
Proxy configuration
Buildx version
Builder info
/usr/bin/docker buildx build --cache-from type=gha, scope=Build --cache-to type=gha, scope=Build --file Dockerfile --iidfile /home/runner/work/_temp/docker-actions-toolkit-xA000e/build-iidfile-9e798fb934.txt --label org.opencontainers.image.created=2025-08-14T05:40:31.719Z --label org.opencontainers.image.description=MoviePilot 微信转发代理 --label org.opencontainers.image.licenses=MIT --label org.opencontainers.image.revision=84c2feeb6780d087227b3600b13f38dacd416015 --label org.opencontainers.image.source=https://github.com/***/wxchat-Docker --label org.opencontainers.image.title=wxchat-Docker --label org.opencontainers.image.url=https://github.com/***/wxchat-Docker --label org.opencontainers.image.version=latest --platform linux/386,linux/amd64,linux/arm64/v8,linux/arm/v7,linux/arm/v6,linux/ppc64le,linux/s390x --attest type=provenance,mode=max,builder-id=https://github.com/***/wxchat-Docker/actions/runs/16956891536/attempts/1 --tag ***/wxchat:latest --metadata-file /home/runner/work/_temp/docker-actions-toolkit-xA000e/build-metadata-5248eb59c3.json --push .
#0 building with "builder-42eb7f04-279d-47d9-99fb-1e049de2b59a" instance using docker-container driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 333B done
#1 DONE 0.0s

#2 [linux/arm/v6 internal] load metadata for docker.io/library/alpine:3.21
#2 ...

#3 [auth] library/alpine:pull token for registry-1.docker.io
#3 DONE 0.0s

#4 [linux/ppc64le internal] load metadata for docker.io/library/alpine:3.21
#4 ...

#5 [linux/s390x internal] load metadata for docker.io/library/alpine:3.21
#5 DONE 1.2s

#6 [internal] load .dockerignore
#6 transferring context: 2B done
#6 DONE 0.0s

#7 [linux/amd64 internal] load metadata for docker.io/library/alpine:3.21
#7 DONE 1.2s

#8 [linux/arm/v7 internal] load metadata for docker.io/library/alpine:3.21
#8 DONE 1.2s

#2 [linux/arm/v6 internal] load metadata for docker.io/library/alpine:3.21
#2 DONE 1.2s

#9 [linux/386 internal] load metadata for docker.io/library/alpine:3.21
#9 DONE 1.3s

#4 [linux/ppc64le internal] load metadata for docker.io/library/alpine:3.21
#4 DONE 1.4s

#10 [linux/arm64 internal] load metadata for docker.io/library/alpine:3.21
#10 DONE 1.4s

#11 [internal] load build context
#11 DONE 0.0s

#12 [linux/ppc64le 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#12 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 done
#12 DONE 0.0s

#13 [linux/arm64 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#13 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 done
#13 DONE 0.0s

#14 importing cache manifest from gha:15759560965930872348
#14 DONE 0.3s

#11 [internal] load build context
#11 transferring context: 13.85kB done
#11 DONE 0.1s

#15 [linux/386 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#15 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 0.0s done
#15 ...

#12 [linux/ppc64le 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#12 sha256:bf93837577694839723892fa29fd11013552ac59944071e2341ac6d6d9876d29 3.57MB / 3.57MB 0.3s done
#12 extracting sha256:bf93837577694839723892fa29fd11013552ac59944071e2341ac6d6d9876d29 0.1s done
#12 DONE 0.4s

#16 [linux/s390x 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#16 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 0.0s done
#16 sha256:40ef870b733fb35d27e79770e3e1133cc7c54e14d8c251e61ecccdec69c20e32 3.46MB / 3.46MB 0.3s done
#16 extracting sha256:40ef870b733fb35d27e79770e3e1133cc7c54e14d8c251e61ecccdec69c20e32 0.1s done
#16 DONE 0.4s

#13 [linux/arm64 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#13 sha256:d06c6b665c9b4c183a2e300b290a6b4b7db03f803122fe93d91e9178f425e488 3.99MB / 3.99MB 0.3s done
#13 extracting sha256:d06c6b665c9b4c183a2e300b290a6b4b7db03f803122fe93d91e9178f425e488 0.1s done
#13 DONE 0.5s

#15 [linux/386 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#15 sha256:47ad0adcb4aa253584437783c542bfbd2276c07a7a0b7487bb26f9b2e80cba73 3.46MB / 3.46MB 0.2s done
#15 extracting sha256:47ad0adcb4aa253584437783c542bfbd2276c07a7a0b7487bb26f9b2e80cba73
#15 extracting sha256:47ad0adcb4aa253584437783c542bfbd2276c07a7a0b7487bb26f9b2e80cba73 0.2s done
#15 DONE 0.7s

#17 [linux/arm/v6 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#17 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 0.0s done
#17 sha256:ca0c331561564c536ffa9246944bb50ac21d3fb11fe66c38baad97fdd1f05719 3.36MB / 3.36MB 0.6s done
#17 extracting sha256:ca0c331561564c536ffa9246944bb50ac21d3fb11fe66c38baad97fdd1f05719
#17 ...

#18 [linux/arm/v7 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#18 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 0.0s done
#18 sha256:a96f521d793eec1dcb2b825985eb01c309edb500ebd753a2f84cb9430f05802f 3.10MB / 3.10MB 0.3s done
#18 extracting sha256:a96f521d793eec1dcb2b825985eb01c309edb500ebd753a2f84cb9430f05802f 0.2s done
#18 DONE 0.8s

#17 [linux/arm/v6 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#17 extracting sha256:ca0c331561564c536ffa9246944bb50ac21d3fb11fe66c38baad97fdd1f05719 0.3s done
#17 DONE 1.0s

#19 [linux/amd64 1/4] FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685
#19 resolve docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685 0.0s done
#19 sha256:0368fd46e3c6d237d81390ff086f93aee216df5cfa814041a491453fb0932a12 3.64MB / 3.64MB 0.3s done
#19 extracting sha256:0368fd46e3c6d237d81390ff086f93aee216df5cfa814041a491453fb0932a12 0.3s done
#19 DONE 1.0s

#20 [linux/amd64 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#20 0.115 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/APKINDEX.tar.gz
#20 0.262 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/community/x86_64/APKINDEX.tar.gz
#20 0.643 ERROR: unable to select packages:
#20 0.644   py3-cryptodome (no such package):
#20 0.644     required by: world[py3-cryptodome]
#20 ERROR: process "/bin/sh -c apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*" did not complete successfully: exit code: 1

#21 [linux/386 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#21 0.197 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/APKINDEX.tar.gz
#21 0.499 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/community/x86/APKINDEX.tar.gz
#21 1.019 ERROR: unable to select packages:
#21 1.019   py3-cryptodome (no such package):
#21 1.019     required by: world[py3-cryptodome]
#21 ERROR: process "/bin/sh -c apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*" did not complete successfully: exit code: 1

#22 [linux/arm/v6 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#22 0.298 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/APKINDEX.tar.gz
#22 CANCELED

#23 [linux/ppc64le 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#23 0.222 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/APKINDEX.tar.gz
#23 CANCELED

#24 [linux/s390x 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#24 0.194 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/APKINDEX.tar.gz
#24 CANCELED

#25 [linux/arm64 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#25 0.207 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/APKINDEX.tar.gz
#25 CANCELED

#26 [linux/arm/v7 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*
#26 0.422 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/APKINDEX.tar.gz
#26 CANCELED
------
 > [linux/386 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*:
0.197 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/APKINDEX.tar.gz
0.499 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/community/x86/APKINDEX.tar.gz
1.019 ERROR: unable to select packages:
1.019   py3-cryptodome (no such package):
1.019     required by: world[py3-cryptodome]
------
------
 > [linux/amd64 2/4] RUN apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*:
0.115 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/APKINDEX.tar.gz
0.262 fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/community/x86_64/APKINDEX.tar.gz
unable to select packages:
0.644   py3-cryptodome (no such package):
0.644     required by: world[py3-cryptodome]
------
Dockerfile:5
--------------------
   4 |     
   5 | >>> RUN apk add --no-cache \
   6 | >>>       tzdata \
   7 | >>>       nginx \
   8 | >>>       python3 \
   9 | >>>       py3-pip \
  10 | >>>       py3-flask \
  11 | >>>       py3-cryptodome \
  12 | >>>     && rm -rf /var/cache/apk/* /tmp/*
  13 |     
--------------------
ERROR: failed to build: failed to solve: process "/bin/sh -c apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*" did not complete successfully: exit code: 1
Reference
Check build summary support
Error: buildx failed with: ERROR: failed to build: failed to solve: process "/bin/sh -c apk add --no-cache       tzdata       nginx       python3       py3-pip       py3-flask       py3-cryptodome     && rm -rf /var/cache/apk/* /tmp/*" did not complete successfully: exit code: 1