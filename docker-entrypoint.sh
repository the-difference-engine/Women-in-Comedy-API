#!/bin/bash

rm tmp/pids/server.pid
bundle install
rerun --background 'rails server -b 0.0.0.0 -p 9000'