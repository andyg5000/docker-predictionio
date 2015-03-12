#!/bin/bash
JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export JAVA_HOME
PIO_HOME=/root/PredictionIO
export PIO_HOME
SPARK_HOME=/root/PredictionIO/vendors/spark-1.2.0
export SPARK_HOME
PATH=$PATH:/root/PredictionIO/bin
export PATH
/usr/local/bin/supervisord -n

