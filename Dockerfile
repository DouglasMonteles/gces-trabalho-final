FROM python:3.8

WORKDIR /application

COPY . /application

RUN apt-get update && apt-get install -y libpq-dev gcc

RUN pip install -r requirements.txt

CMD ["python", "src/main.py"]