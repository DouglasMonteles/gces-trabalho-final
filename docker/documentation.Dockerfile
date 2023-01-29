FROM ubuntu:20.04

EXPOSE 8080

WORKDIR /docs

COPY . /docs

# Avoid user interactions
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get install -y libpq-dev gcc curl python3.8 \
  flex bison cmake git build-essential g++ clang wget python3-sphinx \
  nodejs npm 

RUN wget -c https://www.doxygen.nl/files/doxygen-1.9.6.linux.bin.tar.gz -O - | tar -xz

RUN npm install -g http-server@13.0.2

CMD ["sh", "scripts/docs.sh"]