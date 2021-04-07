#!/bin/bash
./server/gnatsd -DV &
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:./plugins
gazebo manipulator.world --verbose &
go run control/commands.go