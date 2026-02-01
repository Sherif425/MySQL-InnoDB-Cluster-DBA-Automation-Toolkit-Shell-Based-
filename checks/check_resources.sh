#!/bin/bash

echo "CPU:"
mpstat 1 3

echo "Memory:"
free -h

echo "Disk:"
df -h

echo "Top MySQL Memory Consumers:"
ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head
