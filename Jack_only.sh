#!/bin/bash
# Jack wiring only

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