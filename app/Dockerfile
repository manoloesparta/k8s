FROM python:3.9-slim

WORKDIR /usr/src

COPY ./requirements.txt /usr/src/requirements.txt

RUN pip install -r requirements.txt

COPY . /usr/src/

CMD [ "python", "app.py" ]
