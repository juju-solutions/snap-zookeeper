#!/bin/bash

###############################################################################
# Wrapper for all zookeeper-related binaries and daemons
###############################################################################

# Set Bigtop envars for java/jsvc (otherwise set by hadoop's common-wrapper)
. ${SNAP}/usr/lib/bigtop-utils/bigtop-detect-javahome
export JSVC_HOME=${SNAP}/usr/lib/bigtop-utils

# Update path to find our zookeeper wrappers
export PATH=${SNAP}/wrappers:$PATH

# ZK envars
export ZOOPIDFILE=${ZOOPIDFILE:-${SNAP_COMMON}/var/run/zookeeper/zookeeper_server.pid}
export ZOOKEEPER_HOME=${ZOOKEEPER_HOME:-${SNAP}/usr/lib/zookeeper}
export ZOOKEEPER_CONF=${ZOOKEEPER_CONF:-${SNAP_DATA}/etc/zookeeper/conf}
export ZOOCFGDIR=${ZOOCFGDIR:-$ZOOKEEPER_CONF}
export CLASSPATH=$CLASSPATH:$ZOOKEEPER_CONF:$ZOOKEEPER_HOME/*:$ZOOKEEPER_HOME/lib/*
export ZOO_LOG_DIR=${ZOO_LOG_DIR:-${SNAP_DATA}/var/log/zookeeper}
export ZOO_LOG4J_PROP=${ZOO_LOG4J_PROP:-INFO,ROLLINGFILE}
export JVMFLAGS=${JVMFLAGS:--Dzookeeper.log.threshold=INFO}
export ZOO_DATADIR_AUTOCREATE_DISABLE=${ZOO_DATADIR_AUTOCREATE_DISABLE:-true}
export ZOOBINDIR=${SNAP}/usr/lib/zookeeper/bin
