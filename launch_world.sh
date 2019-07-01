#!/bin/bash
./server/gnatsd  &
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:./plugins
gazebo manipulator.world --verbose
