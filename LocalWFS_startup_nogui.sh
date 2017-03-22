#!/bin/bash
# A simple bash script for setting up listener tracking in local sound field synthesis.
# First starting two SoundScapeRenderer (SSR) instances in their desired configuration and connecting them in Jack afterwards.
#
# Note: As of version 0.4.2f of the SSR there is a problem with the GUI that makes the SSR crash 
# if a high number of sources are changing their position as rapidly as in this case, 
# while the position changes are sent via network messages. Therefore it was necessary to start the affected instance in non-GUI-mode to avoid these crashes.
# This may not be the case in the future.
#
# Author: Felix Immohr, 2016
# Usage: bash LocalWFS_startup.sh <scene-file>

ssr-wfs --loop -c ssr_conf_files/ssr_virtual_repr.conf $1 & 

ssr-wfs --loop --no-gui -c ssr_conf_files/ssr_real_repr.conf &

# stop and rewind the playback if at least one instance is started in non-GUI-mode
sleep 2s
echo -ne "<request><state transport=\"stop\"/><state transport=\"rewind\"/></request>\0" | nc -q 0 localhost 4711

sleep 20s

# Jack wiring
LWFS_REAL=LocalWFS_real_repr
LWFS_VIRT=LocalWFS_virt_repr
SYS=system

# Channel number
LWFS_VIRT_OUTCHANNELS=64
LWFS_REAL_OUTCHANNELS=64


# connect LWFS_VIRT output to LWFS_REAL input
for ((i=1; i<=$LWFS_VIRT_OUTCHANNELS; i++));
do
    jack_disconnect $LWFS_VIRT:out_$i  $SYS:playback_$i
    jack_connect $LWFS_VIRT:out_$i  $LWFS_REAL:in_$i
done

# connect LWFS_REAL output to system playback channels
for ((i=1; i<=$LWFS_REAL_OUTCHANNELS; i++));
do
  jack_disconnect $LWFS_REAL:out_$i  $SYS:playback_$i
  jack_connect $LWFS_REAL:out_$i  $SYS:playback_$i
done
