#!/bin/bash

source /home/ubuntu/project/venv/bin/activate
cd /home/ubuntu/project/webserver/
python3 manage.py migrate
python3 manage.py runserver 127.0.0.1:5000  --insecure &

# I remove the variable user since I could not find a way to run the local veriables inside a script 
cd /home/ubuntu/project/webserver1/
python3 manage.py migrate
python3 manage.py runserver 127.0.0.1:4999 --insecure &


