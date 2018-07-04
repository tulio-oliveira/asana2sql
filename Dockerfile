FROM python:3.6.6-slim

WORKDIR /usr/src/app

COPY drivers/mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit.tar.gz .
COPY app/ .

RUN apt-get update
RUN apt-get install -y gcc python3-dev python3-pip libxml2-dev libxslt1-dev zlib1g-dev unixodbc-dev unixodbc-bin unixodbc

RUN tar xvzf mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit.tar.gz \
    && ./mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit/bin/myodbc-installer -d -a -n "MySQL ODBC 8.0.11 Ansi Driver" \
        -t "DRIVER=/usr/src/app/mysql-connector-odbc-8.0.11-linux-ubuntu18.04-x86-64bit/lib/libmyodbc8a.so"

RUN apt-get clean -y

RUN pip install pyodbc pytz asana

ENTRYPOINT ["python", "asana2sql.py"]
