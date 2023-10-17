FROM python:3.10.4-alpine3.15

ENV PYTHONUNBUFFERED=1

RUN apk update \
    && apk add --no-cache gcc musl-dev postgresql-dev python3-dev libffi-dev \
    && pip install --upgrade pip

RUN mkdir /project

WORKDIR /project

COPY . /project/

RUN python -m pip install -r /project/requirements/development.txt

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

