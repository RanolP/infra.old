#!/bin/bash

DIR=`dirname ${BASH_SOURCE[0]}`

(cd $DIR; \
    java \
        -Xms6G -Xmx6G \
        -XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC \
        -jar server.jar \
        -nogui
)
