#!/bin/bash
./server/gnatsd  &
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:./plugins
echo $GAZEBO_PLUGIN_PATH
gazebo manipulator.world --verbose
