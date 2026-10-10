#!/bin/bash
LOG=/tmp/run.log
touch "$LOG"
prev=$(( $(wc -l < "$LOG") ))
date >> "$LOG"
echo "Hellow WOrld!"
echo "$prev" >&2
