#!/usr/bin/env bash

cliphist list | fuzzel -d -w 60 -p "History: " | cliphist decode | wl-copy
