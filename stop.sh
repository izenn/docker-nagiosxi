#!/usr/bin/env bash
systemctl stop crond
kill $(cat /var/run/xinetd.pid)
systemctl stop ntpd
systemctl stop npcd
systemctl stop nrpe
systemctl stop nagios
systemctl stop httpd
systemctl stop mariadb
