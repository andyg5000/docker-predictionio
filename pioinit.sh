#!/bin/sh

supervisorctl start elasticsearch
supervisorctl start hbase
sleep 10
supervisorctl start eventserver
