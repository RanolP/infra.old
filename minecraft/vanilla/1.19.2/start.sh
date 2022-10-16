#!/bin/bash

DIR=`dirname ${BASH_SOURCE[0]}`

(cd $DIR; java -jar server.jar -nogui)
