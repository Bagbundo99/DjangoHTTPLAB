#!/bin/bash

#Modifies file 
echo "server {
    listen        80;
    server_name error.nachosite.com;
    location / {
        proxy_pass         http://localhost:4999;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade \$http_upgrade;
        proxy_set_header   Connection keep-alive;
        proxy_set_header   Host \$host;
        proxy_cache_bypass \$http_upgrade;
        proxy_set_header   X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto \$scheme;
    }
}" > /etc/nginx/sites-enabled/error

echo "server {
    listen        80;
    server_name principal.nachosite.com;
    location / {
        proxy_pass         http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade \$http_upgrade;
        proxy_set_header   Connection keep-alive;
        proxy_set_header   Host \$host;
        proxy_cache_bypass \$http_upgrade;
        proxy_set_header   X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto \$scheme;
    }
}" > /etc/nginx/sites-enabled/principal



#Creates server 
python3 -m venv venv
source /app/venv/bin/activate
pip install Django django-cors-headers




#run reload
nginx -s reload





