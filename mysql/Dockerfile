FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget gnupg lsb-release && \
    apt-get clean

RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb && \
    dpkg -i mysql-apt-config_0.8.12-1_all.deb && \
    rm -f mysql-apt-config_0.8.12-1_all.deb

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C

RUN apt-get update

RUN apt-get install -y mysql-server=5.7*

# RUN apt-get install -y supervisor

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

RUN chmod 600 /etc/mysql/my.cnf
RUN echo "[mysqld]\nbind-address = 0.0.0.0" >> /etc/mysql/my.cnf

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

RUN rm -rf /var/lib/mysql/*
COPY initdb.sql /initdb.sql
RUN mysqld --initialize-insecure --user=mysql --init-file=/initdb.sql

EXPOSE 3306
VOLUME [ "/var/lib/mysql" ]

# COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY run-docker.sh /usr/local/bin/run-docker.sh
# COPY script.sh /usr/local/bin/extra-script.sh

CMD ["run-docker.sh"]
# ENTRYPOINT ["/bin/bash", "-c"]
# CMD "mysqld && run-docker.sh"
