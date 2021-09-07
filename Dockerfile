FROM python:3.8@sha256:cfc20f61c55d9bc9ace67726b202b41d1344ef63202c73c221e102eb6a7b2c46
# PYTHONUNBUFFERED=1 ensures that the python output is set straight
# to the terminal without buffering it first
ENV PYTHONUNBUFFERED 1
RUN mkdir /vulnerablecode
WORKDIR /vulnerablecode
ADD . /vulnerablecode/
RUN pip install -r requirements.txt && \
    DJANGO_DEV=1 python manage.py collectstatic

LABEL "base_image": "pkg:docker/python@sha256%3Ae9b7e3b4e9569808066c5901b8a9ad315a9f14ae8d3949ece22ae339fff2cad0"
LABEL "dockerfile_url":  "https://github.com/nexB/vulnerablecode/blob/develop/Dockerfile"
LABEL "homepage_url":  "https://github.com/nexB/vulnerablecode"
LABEL "license": "Apache-2.0"
