#!/bin/bash

DIR=`dirname ${BASH_SOURCE[0]}`

RESET='\033[0m'
BOLD='\033[1m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

labeled-echo() {
    echo -e "      \033[4$1m$BOLD $2 $RESET ${@:3}"
}

GLOBAL_STEP_COUNTER=0
GLOBAL_STEP_COUNT=0
BEGIN_STEPS() {
    GLOBAL_STEP_COUNTER=0
    GLOBAL_STEP_COUNT=$1
}
STEP() {
    GLOBAL_STEP_COUNTER=$((GLOBAL_STEP_COUNTER+1))
    echo -e "$YELLOW[$GLOBAL_STEP_COUNTER/$GLOBAL_STEP_COUNT]$RESET ${@:1}"
}
DONE() {
    echo
    echo -e "\033[42m$BOLD OK! $RESET Server Installation Complete"
}

GLOBAL_SUBSTEP_COUNTER=0
GLOBAL_SUBSTEP_COUNT=0
BEGIN_SUBSTEP() {
    STEP ${@:2}

    GLOBAL_SUBSTEP_COUNT=$1
}
SUBSTEP() {
    GLOBAL_SUBSTEP_COUNTER=$((GLOBAL_SUBSTEP_COUNTER+1))
    echo -e "  $CYAN▶$RESET  $@ - $YELLOW$GLOBAL_SUBSTEP_COUNTER$RESET of $YELLOW$GLOBAL_SUBSTEP_COUNT$RESET"
}

WORKING() {
    labeled-echo 3 WORKING $@
}
SUCCESS() {
    labeled-echo 2 SUCCESS $@
}
SKIPPED() {
    labeled-echo 4 SKIPPED $@
}

RUN() {
    echo -e "  $YELLOW\$$RESET $@"
    $@
}
DOWNLOAD() {
    if [[ ! -e "$DIR/$3" ]]; then
        labeled-echo 3 LOADING "Download $3 from"
        echo "                ▷  $1"
        curl "$1" --output "$DIR/$3" -L
        SUCCESS "Done!"
    else
        SKIPPED "Already downloaded $CYAN$3$RESET"
    fi
}
DOWNLOAD_PLUGIN() {
    labeled-echo 3 LOADING "Download plugin ID $YELLOW$1$RESET version $CYAN$3$RESET into $GREEN$5$RESET"
    curl "https://www.spigotmc.org/resources/$1/download?version=$3" \
        -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0' \
        -H 'Cookie: cf_clearance=B.L6wFqaXOyI9zGCQ0BRo8x8N9G2X.814uQf2obVePI-1665293769-0-150;' \
        -L \
        --output "$DIR/$5"
    SUCCESS "Done!"
}

BEGIN_STEPS 3

STEP "Install Paper 1.19.2-201"
DOWNLOAD "https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/201/downloads/paper-1.19.2-201.jar" INTO "server.jar"

BEGIN_SUBSTEP 2 "Install Plugins"
RUN mkdir -p $DIR/plugins

SUBSTEP "BlueMap"
DOWNLOAD "https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v3.4/BlueMap-3.4-spigot.jar" INTO "plugins/BlueMap 3.4.jar"
# DOWNLOAD_PLUGIN "83557" VERSION "469275" INTO "plugins/BlueMap 3.4.jar"

SUBSTEP "CommandHelper"
DOWNLOAD "https://apps.methodscript.com/builds/commandhelperjar/build-280%2Fcommandhelper-3.3.5-SNAPSHOT-full.jar" INTO "plugins/commandhelper-3.3.5-SNAPSHOT-full-build-280.jar"
# DOWNLOAD_PLUGIN "64681" VERSION "404127" INTO "plugins/commandhelper-3.3.5-SNAPSHOT-full-build-280.jar"

STEP "Copy Base Configurations"
RUN cp $DIR/baseconfig/server.properties $DIR/server.properties
RUN cp $DIR/baseconfig/spigot.yml $DIR/spigot.yml
RUN cp $DIR/baseconfig/config/paper-global.yml $DIR/config/paper-global.yml

DONE