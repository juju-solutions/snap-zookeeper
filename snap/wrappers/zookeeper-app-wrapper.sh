#!/bin/bash

###############################################################################
# Wrapper for zookeeper-related applications
###############################################################################

# Setup config/env
if [ -e ${SNAP}/wrappers/zookeeper-common-wrapper.sh ]; then
  . ${SNAP}/wrappers/zookeeper-common-wrapper.sh
else
  echo "ERROR: Could not find 'zookeeper-common-wrapper.sh':"
  echo "${SNAP}/wrappers/zookeeper-common-wrapper.sh"
  exit 1
fi

# All Zookeeper apps require config; check for that.
if [ ! -e ${ZOOCFGDIR} ]; then
  echo "ERROR: Expected Zookeeper configuration not found:"
  echo "${ZOOCFGDIR}"
  exit 1
else
  . ${ZOOBINDIR}/zkEnv.sh

  # Run the application
  COMMAND=`basename $0`
  case $COMMAND in
    zookeeper-client)
      env CLASSPATH=$CLASSPATH ${ZOOBINDIR}/zkCli.sh "$@"
      ;;
    zookeeper-server)
      env CLASSPATH=$CLASSPATH ${ZOOBINDIR}/zkServer.sh "$@"
      ;;
    zookeeper-server-cleanup)
      env CLASSPATH=$CLASSPATH ${ZOOBINDIR}/zkCleanup.sh "$@"
      ;;
    zookeeper-server-initialize)
      env CLASSPATH=$CLASSPATH ${ZOOBINDIR}/zkServer-initialize.sh "$@"
      ;;
    *)
      echo "ERROR: $0 is not recognized"
      exit 1
  esac
fi
