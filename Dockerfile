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
ENV HBASE_CONF_DIR="/root/PredictionIO/vendors/hbase-0.98.6/conf"
ENV PIO_FS_BASEDIR="$HOME/.pio_store"
ENV PIO_FS_ENGINESDIR="$PIO_FS_BASEDIR/engines"
ENV PIO_FS_TMPDIR="$PIO_FS_BASEDIR/tmp"
ENV PIO_STORAGE_REPOSITORIES_METADATA_NAME="predictionio_metadata"
ENV PIO_STORAGE_REPOSITORIES_METADATA_SOURCE="ELASTICSEARCH"
ENV PIO_STORAGE_REPOSITORIES_MODELDATA_NAME="pio_"
ENV PIO_STORAGE_REPOSITORIES_MODELDATA_SOURCE="LOCALFS"
ENV PIO_STORAGE_REPOSITORIES_EVENTDATA_NAME="predictionio_eventdata"
ENV PIO_STORAGE_REPOSITORIES_EVENTDATA_SOURCE="HBASE"
ENV PIO_STORAGE_SOURCES_ELASTICSEARCH_TYPE="elasticsearch"
ENV PIO_STORAGE_SOURCES_ELASTICSEARCH_HOSTS="localhost"
ENV PIO_STORAGE_SOURCES_ELASTICSEARCH_PORTS="9300"
ENV PIO_STORAGE_SOURCES_LOCALFS_TYPE="localfs"
ENV PIO_STORAGE_SOURCES_LOCALFS_HOSTS="$PIO_FS_BASEDIR/models"
ENV PIO_STORAGE_SOURCES_LOCALFS_PORTS="0"
ENV PIO_STORAGE_SOURCES_HBASE_TYPE="hbase"
ENV PIO_STORAGE_SOURCES_HBASE_HOSTS="0"
ENV PIO_STORAGE_SOURCES_HBASE_PORTS="0"
ENV PIO_STORAGE_SOURCES_ELASTICSEARCH_HOME="/root/PredictionIO/vendors/elasticsearch-1.4.2"
ENV PIO_STORAGE_SOURCES_HBASE_HOME="/root/PredictionIO/vendors/hbase-0.98.6"
ENV PATH="$PATH:/root/PredictionIO/bin"

EXPOSE 7070 8000 9000

CMD ["/bin/bash", "/start.sh"]
