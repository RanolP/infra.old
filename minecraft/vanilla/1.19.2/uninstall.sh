#!/bin/bash

DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../../../util.sh

RUN "sudo rm /etc/systemd/system/minecraft-vanilla.service"