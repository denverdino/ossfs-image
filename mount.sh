#!/bin/sh
echo ${OSS_BUCKET}:${ACCESS_KEY}:${ACCESS_SECRET} > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
mkdir -p ${MNT_POINT}
exec ossfs -f ${OSS_BUCKET} ${MNT_POINT} -ourl=${OSS_URL} ${OSSFS_OPTIONS}
