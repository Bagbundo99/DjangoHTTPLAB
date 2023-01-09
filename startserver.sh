#!/bin/bash
source /home/$USER/project/venv/bin/activate
cd /home/$USER/project/webserver/
python3 manage.py migrate
python3 manage.py runserver 127.0.0.1:5000  --insecure &

cd /home/$USER/project/webserver1/
python3 manage.py migrate
python3 manage.py runserver 127.0.0.1:4999 --insecure &


