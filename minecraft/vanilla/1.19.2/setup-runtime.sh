#!/bin/bash
DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../../../util.sh

RUN asdf plugin-add java https://github.com/halcyon/asdf-java.git
RUN asdf install java graalvm-22.2.0+java17
FAKERUN "(cd $DIR; asdf local java graalvm-22.2.0+java17)"
(cd $DIR; asdf local java graalvm-22.2.0+java17)
