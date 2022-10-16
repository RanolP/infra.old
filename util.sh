
RESET='\033[0m'
BOLD='\033[1m'

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

GRAY='\033[1;90m'

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
    echo -e "\033[42m$BOLD OK! $RESET $@ Complete"
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

FAKERUN() {
    echo -e "  $YELLOW\$$RESET $@"
}
RUN() {
    FAKERUN $@
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

CONFIRM() {
    while :
    do
        read -p "  $(echo -e $BLUE[?]$RESET) $@ [Y/n]: " -n 1 -r REPLY
        case "$REPLY" in 
            y|Y ) return `true`;;
            n|N ) return `false`;;
        esac
        echo
    done
}
