#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Environment Variable Prerequisites
#
#   LEMON_HOME      Point to the lemon server home directory.
#
#   LEMON_ENV       Should be DEV/CI/SIT/UAT/STR/PRE/PRD.
#
#   JAVA_HOME       Must point at your Java Development Kit installation.
#
#   JAVA_OPTS       (Optional) Java runtime options used when any command
#                   is executed.
# -----------------------------------------------------------------------------

echo " /**                                             "
echo " | **                                            "
echo " | **  /******  /******/****   /******  /******* "
echo " | ** /**__  **| **_  **_  ** /**__  **| **__  **"
echo " | **| ********| ** \ ** \ **| **  \ **| **  \ **"
echo " | **| **_____/| ** | ** | **| **  | **| **  | **"
echo " | **|  *******| ** | ** | **|  ******/| **  | **"
echo " |__/ \_______/|__/ |__/ |__/ \______/ |__/  |__/"

# Main class of lemon server
#LEMON_MAIN="com.hisun.lemon.Application"
# Executable jar of lemon server
LEMON_JAR=""

# Check environment variables
if [ -z "${LEMON_HOME}" ]; then
  LEMON_HOME="$(cd `dirname $0`;cd ..;pwd)"
fi
if [ -z "${LEMON_JAR}" ]; then
  JARS_IN_HOME=$(ls ${LEMON_HOME}/*.jar)
  _i=0
  for JAR in $JARS_IN_HOME
  do
    _i=$((_i + 1))
    if [ ${_i} -gt 1 ]; then
      echo "Can only have one start jar file in lemon home $LEMON_HOME"
      exit 1
    fi
    LEMON_JAR=$JAR
  done
fi

# Get application ID
APPID=$(echo $LEMON_HOME|awk -F "/" '{print $NF}')
echo $APPID

# Set PID file
PID_FILE="${LEMON_HOME}/${APPID}.pid"

# Check if server is running
if [ -f "${PID_FILE}" ]; then
  EXIST_PID=`cat "${PID_FILE}"`
  num=`ps -p "${EXIST_PID}" | grep "${EXIST_PID}" | wc -l`
  if [ ${num} -ge 1 ]; then
    #echo "Can't start Lemon Server server, an existing server[${EXIST_PID}] is running."
    #exit 1
    echo "An existing server[${EXIST_PID}] is running, starting to kill it, please wait for a monent."
    kill ${EXIST_PID}
    for wi in {1..120}
    do
      num=`ps -p "${EXIST_PID}" | grep "${EXIST_PID}" | wc -l`
      if [ ${num} -ge 1 ]; then
        kill ${EXIST_PID}
        echo -n "."
        sleep 1s
        else
          echo "Server normal stop success"
          kill 1
          exit 0
      fi
    done
    if [ ${num} -ge 1 ]; then
      kill -9 ${EXIST_PID}
      else
        echo "Server force stop success"
        exit 0
    fi
    echo
  fi
fi
