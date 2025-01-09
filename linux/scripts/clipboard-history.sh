#!/usr/bin/sh

cliphist list | fuzzel -d -w 60 | cliphist decode | wl-copy

