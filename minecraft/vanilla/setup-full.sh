#!/bin/bash
DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../../util.sh


BEGIN_STEPS 3

STEP "Setup 1.19.2 Runtime"
RUN $DIR/1.19.2/setup-runtime.sh

STEP "Setup 1.19.2 Server"
RUN $DIR/1.19.2/setup-server.sh

STEP "Setup BlueMapVue"
RUN cp $DIR/baseconfig/BlueMapVue/vite.config.js $DIR/BlueMapVue/vite.config.js
FAKERUN "(cd $DIR/BlueMapVue; npm install)"
(cd $DIR/BlueMapVue; npm install)
FAKERUN "(cd $DIR/BlueMapVue; npm run build)"
(cd $DIR/BlueMapVue; npm run build)

DONE "Server Setup"
