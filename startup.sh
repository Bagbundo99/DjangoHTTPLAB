#!/bin/bash

#Modifies file 
echo "server {
    listen        80;
    server_name $DOMAIN2;
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
    server_name $DOMAIN1;
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


#sed for the configuration file
NGINX_CONF="/etc/nginx/nginx.conf"
INCLUDE_LINE="include /etc/nginx/sites-enabled/*;"

if ! grep -qF "$INCLUDE_LINE" "$NGINX_CONF"; then
    echo "Adding sites-enabled directory to nginx.conf..."
    # Insert the include line inside the `http` block
    sed -i "/http {/a \\    $INCLUDE_LINE" "$NGINX_CONF"
else
    echo "sites-enabled already included in nginx.conf"
fi


#Creates server 
python3 -m venv venv
source /app/venv/bin/activate
pip install Django django-cors-headers




#run reload
echo "Starting Nginx..."
nginx -g "daemon off;"
nginx -s reload

bash /app/startserver.sh



