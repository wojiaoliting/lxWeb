#!/bin/sh
python manage.py migrate
python manage.py collectstatic --noinput
gunicorn blogproject.wsgi:application -w 4 -k gthread -b 192.168.0.4:8000 --chdir=/app
