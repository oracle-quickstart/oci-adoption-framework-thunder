#!/bin/bash

# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

dst_mount_path_second='${dst_mount_path_second}'
dst_export_path_second='${dst_export_path_second}'
dst_mount_target_private_ip_second='${dst_mount_target_private_ip_second}'
data_sync_frequency='${data_sync_frequency}'
src_public_ip='${src_public_ip}'
src_mount_path='${src_mount_path}'
ssh_private_key='${ssh_private_key}'

mkdir -p ${dst_mount_path_second}
mount ${dst_mount_target_private_ip_second}:${dst_export_path_second} ${dst_mount_path_second}
echo "${data_sync_frequency} /usr/bin/flock -n /var/run/fss-sync-up-snapshot.lck rsync -aHAXxve --numeric-ids --delete -e 'ssh -i /home/opc/.ssh/id_rsa -o StrictHostKeyChecking=no' opc@${src_public_ip}:${src_mount_path}/ ${dst_mount_path_second}/ " >> /etc/cron.d/fss-sync-up-snapshot

chmod 644 /etc/cron.d/fss-sync-up-snapshot
crontab /etc/cron.d/fss-sync-up-snapshot

echo "${ssh_private_key}" >> ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
