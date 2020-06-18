#!bin/bash

source flask_apps/app01_env/bin/activate
cd flask_apps
cd app01_env
gunicorn app:app -b localhost:8000 & python app01.py