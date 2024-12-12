#!/bin/bash

#install reverse proxy 
apk update
apk install -y  python3 python3-pip git python3-venv
touch /etc/nginx/sites-enabled/error
touch /etc/nginx/sites-enabled/principal

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
cd app/
python3 -m venv venv
source /app/venv/bin/activate
pip install Django django-cors-headers

git clone https://github.com/Bagbundo99/DjangoHTTPLAB.git
mv DjangoHTTPLAB/* .
rm -rf DjangoHTTPLAB



#start server
nginx -s reload
.startserver.sh





