#!/bin/bash

echo "0 4 * * 1 root apt-get update -y >> /var/log/update_script.log" >> /etc/crontab
echo "0 4 * * 1 root apt-get upgrade -y >> /var/log/update_script.log" >> /etc/crontab
