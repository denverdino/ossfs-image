FROM alpine:3.10 AS builder
ENV OSSFS_VERSION v1.80.6
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev
RUN wget -qO- https://github.com/aliyun/ossfs/archive/$OSSFS_VERSION.tar.gz |tar xz
RUN cd ossfs-1.80.6 \
  && ./autogen.sh \
  && ./configure --prefix=/usr \
  && make \
  && make install

FROM alpine:3.10
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk --update add fuse curl libxml2 openssl libstdc++ libgcc && rm -rf /var/cache/apk/* 
ENV OSSFS_VERSION v1.80.6
COPY --from=builder /usr/bin/ossfs /usr/bin/ossfs
COPY mount.sh .
ENV OSS_URL http://oss-cn-beijing-internal.aliyuncs.com
ENV OSS_BUCKET bucket-name
ENV OSSFS_OPTIONS -o noxattr
ENV MNT_POINT /data/ossfs
ENV ACCESS_KEY changeme
ENV ACCESS_SECRET changeme
CMD ["/mount.sh"]