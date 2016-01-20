# OSSFS
Docker Image for [OSSFS](https://github.com/aliyun/ossfs) based on Alpine Linux


## Build

```
docker build -t denverdino/ossfs:latest .
```

## Run

```
docker run --rm -t -i --cap-add SYS_ADMIN --device /dev/fuse \
  -e OSS_URL=http://oss-cn-hangzhou.aliyuncs.com \
  -e ACCESS_KEY=XXXXXX \
  -e ACCESS_SECRET=XXXXXX \
  -e OSS_BUCKET=XXXXXX \
  denverdino/ossfs
```

## Reference
[https://github.com/BWITS/s3fs](https://github.com/BWITS/s3fs)