#!/bin/bash
DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../../util.sh


BEGIN_STEPS 2

STEP "Setup 1.19.2 Runtime"
RUN $DIR/1.19.2/setup-runtime.sh

STEP "Setup 1.19.2 Server"
RUN $DIR/1.19.2/setup-server.sh

DONE "Server Setup"
