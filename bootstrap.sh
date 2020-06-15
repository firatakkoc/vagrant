
cd flask_apps/app01_env/

source bin/activate

gunicorn app:app -b localhost:8000 & python app01.py
