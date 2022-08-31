#!/bin/bash

DATADIR=/home/ubuntu/.near
BACKUPDIR=/data/near_backup

NEWEST=$(ls -t ${BACKUPDIR}/near_data_* | head -1)

sudo systemctl stop near-shardnet.service

wait

echo "[`date "+%Y-%m-%d %H:%M:%S"`] NEAR node was stopped, Restore started" | ts
rm -rf ${DATADIR}/data

tar zxvf ${NEWEST} -C ${DATADIR}
echo "[`date "+%Y-%m-%d %H:%M:%S"`] Near backup files restored from ${NEWEST}" | ts

sudo systemctl start near-shardnet.service
echo "[`date "+%Y-%m-%d %H:%M:%S"`] NEAR node was started" | ts