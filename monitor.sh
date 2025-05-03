#!/bin/bash

echo "--------------------------------------------------------"
echo " System Monitoring Script"
echo "--------------------------------------------------------"
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "--------------------------------------------------------"

# CPU Usage
echo "CPU Usage:"
cpu_usage=$(top -bn 1 | grep "Cpu(s)" | awk '{printf " User: %.2f%%,
System: %.2f%%, Idle: %.2f%%\n", $2, $4, $5}')
if [ -n "$cpu_usage" ]; then
    echo "$cpu_usage"
else
    echo " Error: Unable to retrieve CPU usage."
fi
echo

# Memory Usage
echo "Memory Utilization:"
memory_info=$(free -h | awk '/Mem/ {printf " Total: %s, Used: %s, Free:
%s, Percent Used: %.2f%%\n", $2, $3, $4, ($3/$2)*100}')
if [ -n "$memory_info" ]; then
    echo "$memory_info"
else
    echo " Error: Unable to retrieve memory stats."
fi
echo

# Disk Usage
echo "Disk Management:"
disk_info=$(df -h --total | awk '/total/ {printf " Total: %s, Used: %s,
Free: %s, Percent Used: %.2f%%\n", $2, $3, $4, ($3/$2)*100}')
if [ -n "$disk_info" ]; then
    echo "$disk_info"
else
    echo " Error: Unable to retrieve disk usage."
fi
echo

# System Load (Load Average)
echo "System Load (Load Average):"
load_avg=$(uptime | awk '{print " 1-min Avg: " $10 ", 5-min Avg: " $11 ",
15-min Avg: " $12}')
if [ -n "$load_avg" ]; then
    echo "$load_avg"
else
    echo " Error: Unable to retrieve system load."
fi
echo