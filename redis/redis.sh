#!/bin/bash

REDIS_TMP_DIR=$HOME/redis
REDIS_STABLE_URL="http://download.redis.io/redis-stable.tar.gz"
REDIS_CLI=${REDIS_TMP_DIR}/redis-stable/src/redis-cli
REDIS_SERVER=${REDIS_TMP_DIR}/redis-stable/src/redis-server
REDIS_CONFIG=${REDIS_TMP_DIR}/redis-stable/redis.conf
REDIS_NEW_CONFIG=${REDIS_TMP_DIR}/redis.conf

function getPid()
{
    echo $(pgrep -f "redis-server")
}

function isEmpty
{
    local var="$1"

    # Return true if:
    # 1.    var is a null string ("" as empty string)
    # 2.    a non set variable is passed
    # 3.    a declared variable or array but without a value is passed
    # 4.    an empty array is passed
    if test -z "$var"
    then
        [[ $( echo "1" ) ]]
        return

    # Return true if var is zero (0 as an integer or "0" as a string)
    elif [ "$var" == 0 2> /dev/null ]
    then
        [[ $( echo "1" ) ]]
        return

    # Return true if var is 0.0 (0 as a float)
    elif [ "$var" == 0.0 2> /dev/null ]
    then
        [[ $( echo "1" ) ]]
        return
    fi

    [[ $( echo "" ) ]]
}

function downloadFile()
{
    echo "Downloading Redis..."
    echo ""
    mkdir ${REDIS_TMP_DIR}
    wget -qO- ${REDIS_STABLE_URL} | tar xvz -C ${REDIS_TMP_DIR} && cd ${REDIS_TMP_DIR}/redis-stable && make
}

function startServer()
{
    if [ ! -f "$REDIS_SERVER" ]
    then
        echo "Redis Server \"$REDIS_SERVER\" not found."
        downloadFile
    fi

    if [ -f "$REDIS_SERVER" ]
    then
        if [ ! -f "$REDIS_NEW_CONFIG" ]
        then
            cat ${REDIS_CONFIG} | sed "s#dir .\/#dir $REDIS_TMP_DIR#g" >> ${REDIS_NEW_CONFIG}
        fi

        pid=$(getPid)
        if isEmpty ${pid}
        then
            echo "Starting Redis Server..."
            ${REDIS_SERVER} ${REDIS_TMP_DIR} > /dev/null 2>&1 &
            exit 0
        else
            echo "Redis Server is running... pid: $pid"
        fi
    else
        echo "Redis Server \"$REDIS_SERVER\" not found."
    fi
}

function stopServer()
{
    pid=$(getPid)
    if isEmpty ${pid}
    then
        echo "Redis Server is not running..."
    else
        echo "Stopping Redis Server... pid: $pid"
        kill -9 ${pid}
    fi
}

function statusServer()
{
    pid=$(getPid)
    if isEmpty ${pid}
    then
        echo "Server is not running..."
    else
        echo "Server is running... pid: $pid"
    fi
}

function startCli()
{
    if [ ! -f "$REDIS_CLI" ]
    then
        echo "Redis Cli \"$REDIS_CLI\" not found."
        downloadFile
    fi

    if [ -f "$REDIS_CLI" ]
    then
        ${REDIS_CLI}
    else
        echo "Redis Cli \"$REDIS_SERVER\" not found."
    fi
}

function help_func()
{
    echo "Help info:"
    echo "$0 start                                    - Start redis server."
    echo "$0 stop                                     - Stop redis server."
    echo "$0 status                                   - Status redis server."
    echo "$0 cli                                      - Start redis cli."
    echo "$0 help                                     - Help"
}


if [ "$1" == "start" ]
then
    startServer
elif [ "$1" == "stop" ]
then
    stopServer
elif [ "$1" == "status" ]
then
    statusServer
elif [ "$1" == "cli" ]
then
    startServer
    sleep 3
    startCli
elif [ "$1" == "help" ]
then
    help_func
else
    help_func
fi
