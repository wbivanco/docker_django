FROM python:3.10.4-alpine3.15

# Deshabilita el chequeo de versiones en pip
ENV PIP_DISABLE_PIP_VERSION_CHECK 1 
# Evita que se generen archivos .pyc
ENV PYTHONDONTWRITEBYTECODE 1
# La salida estandard de Python se muestra de forma inmediata
ENV PYTHONUNBUFFERED 1 

#RUN apk update \
#    && apk add --no-cache gcc musl-dev postgresql-dev python3-dev libffi-dev \
#    && pip install --upgrade pip

RUN mkdir /project

WORKDIR /project

COPY . .

#COPY ./requirements/development.txt .

RUN pip install -r requirements/development.txt


#RUN python -m pip install -r /project/requirements/development.txt

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]





# Intalar dependencias

