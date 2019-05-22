#!/bin/ash

TIMES=50
SLEEP=1

help_text() {
    echo "Usage: pinginit --target=<target uri> [--times=<number of tries til timeout>] [--await=<seconds to wait between pings>]"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --times*)
            TIMES="${1#*=}"
            shift
            ;;
        --target*)
            TARGET="${1#*=}"
            shift
            ;;
        --await*)
            SLEEP="${1#*=}"
            shift
            ;;
        -h|--help)
            help_text
            exit 1;
            ;;
         *)
            break;;
    esac
done

if [[ ! ${TARGET} ]]; then
    echo "No target set."
    help_text
    exit 1
fi

echo "Pinging ${TARGET} ${TIMES} times..."

for i in `seq 1 ${TIMES}`; do
    ping -c 1 ${TARGET} &> /dev/null
    RESULT=$?

    if [[ ${RESULT} -eq 0 ]]; then
        echo "Success. Service is active.";
        exit 0
    fi
    echo "Service not active, waiting ${SLEEP} seconds."
    sleep ${SLEEP}
done

echo "No response. Exiting with error code 1."
exit 1
