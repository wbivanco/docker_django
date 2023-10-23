FROM python:3.10.4-alpine3.15

ENV PYTHONUNBUFFERED 1 

RUN mkdir /project

WORKDIR /project

COPY . .

RUN pip install -r requirements/production.txt

CMD ["gunicorn", "-c", "conf/gunicorn/conf.py", "--bind", ":8000", "config.wsgi:application"] 
