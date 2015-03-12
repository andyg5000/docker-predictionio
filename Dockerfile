FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl python-setuptools
RUN curl http://install.prediction.io/install.sh | bash -s -- -y
RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout

ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start.sh /start.sh

RUN chmod 755 /start.sh

ENV JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64" 
ENV PIO_HOME="/root/PredictionIO"
ENV SPARK_HOME="/root/PredictionIO/vendors/spark-1.2.0"
ENV PATH="$PATH:/root/PredictionIO/bin"

EXPOSE 7070 8000 9000

CMD ["/bin/bash", "/start.sh"]
