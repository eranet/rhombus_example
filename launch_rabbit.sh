#!/bin/bash

./server/gnatsd  &
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:./plugins

export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:./models_dir
echo $GAZEBO_MODEL_PATH
gazebo models_dir/rabbit/rabbit.world --verbose
