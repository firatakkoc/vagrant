
source flask_apps/app01_env/bin/activate

gunicorn app:app -b localhost:8000 & python flask_apps/app01_env/app01.py
