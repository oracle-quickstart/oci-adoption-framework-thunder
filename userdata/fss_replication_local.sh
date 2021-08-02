#!/bin/bash

# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

src_mount_path='${src_mount_path}'
dst_mount_path='${dst_mount_path}'
src_export_path='${src_export_path}'
dst_export_path='${dst_export_path}'
src_mount_target_private_ip='${src_mount_target_private_ip}'
dst_mount_target_private_ip='${dst_mount_target_private_ip}'
data_sync_frequency='${data_sync_frequency}'

mkdir -p ${src_mount_path}
mkdir -p ${dst_mount_path}
mount ${src_mount_target_private_ip}:${src_export_path} ${src_mount_path}
mount ${dst_mount_target_private_ip}:${dst_export_path} ${dst_mount_path}
echo "${data_sync_frequency} /usr/bin/flock -n /var/run/fss-sync-up-file-system.lck rsync -aHAXxv --numeric-ids --delete ${src_mount_path}/ ${dst_mount_path}/ " >> /etc/cron.d/fss-sync-up-snapshot
chmod 644 /etc/cron.d/fss-sync-up-snapshot
crontab /etc/cron.d/fss-sync-up-snapshot
