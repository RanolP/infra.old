#!/bin/bash

asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java graalvm-22.2.0+java17
asdf local java graalvm-22.2.0+java17