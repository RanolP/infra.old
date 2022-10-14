#!/bin/bash

DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../util.sh


BEGIN_STEPS 2

STEP "Make systemd service from base config"
FAKERUN "\
exec=`which caddy` \\ \n\
      working_dir=`realpath $DIR/reverse-proxy` \\ \n\
      envsubst < $DIR/reverse-proxy.base.service > $DIR/reverse-proxy.service
"
\
    exec=`which caddy` \
    working_dir=`realpath $DIR/reverse-proxy` \
    envsubst < $DIR/reverse-proxy.base.service > $DIR/reverse-proxy.service

STEP "Copy systemd service into /etc/systemd/system/reverse-proxy.service"
RUN "sudo cp $DIR/reverse-proxy.service /etc/systemd/system/reverse-proxy.service"

DONE "Reverse Proxy Service Installiation"