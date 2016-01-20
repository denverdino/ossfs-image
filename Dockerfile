FROM alpine:3.3
MAINTAINER Li Yi denverdino@gmail.com

ENV GIT_COMMIT 5b0fe0e
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev \
  && wget -qO- https://github.com/aliyun/ossfs/archive/master.tar.gz |tar xz \
  && cd ossfs-master \
  && ./autogen.sh \
  && ./configure --prefix=/usr \
  && make \
  && make install \
  && rm -rf /var/cache/apk/* 

CMD ["/bin/sh"]