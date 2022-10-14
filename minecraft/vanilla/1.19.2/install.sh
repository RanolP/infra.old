#!/bin/bash

DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../../../util.sh


BEGIN_STEPS 2

STEP "Make systemd service from base config"
FAKERUN "\
exec=`which bash` -c source /opt/asdf-vm/asdf.sh && `realpath $DIR/start.sh` \\ \n\
      working_dir=`realpath $DIR` \\ \n\
      envsubst < $DIR/minecraft-vanilla.base.service > $DIR/minecraft-vanilla.service
"
\
    exec=`realpath $DIR/start.sh` \
    working_dir=`realpath $DIR` \
    envsubst < $DIR/minecraft-vanilla.base.service > $DIR/minecraft-vanilla.service

STEP "Copy systemd service into /etc/systemd/user/minecraft-vanilla.service"
RUN "sudo cp $DIR/minecraft-vanilla.service /etc/systemd/user/minecraft-vanilla.service"

DONE "Minecraft Vanilla Service Installiation"