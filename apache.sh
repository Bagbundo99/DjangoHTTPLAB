#!/bin/bash

apt update 
apt-get install -y apache2
systemctl start apache2