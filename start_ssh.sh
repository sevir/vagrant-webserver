#!/bin/bash
script="$0"
basename="$(dirname $script)"
vagrant up
vagrant ssh
vagrant halt