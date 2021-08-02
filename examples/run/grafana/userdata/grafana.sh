#!/bin/bash
# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

yum install https://dl.grafana.com/oss/release/grafana-6.2.5-1.x86_64.rpm -y
systemctl stop firewalld
firewall-offline-cmd --zone=public --add-port=3000/tcp
systemctl start firewalld
chmod 777 -R /var/lib/grafana/
grafana-cli plugins install oci-datasource
systemctl start grafana-server
systemctl enable grafana-server
