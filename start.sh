#!/bin/bash
script="$0"
basename="$(dirname $script)"
bash vagrant up
bash vagrant ssh
bash vagrant suspend