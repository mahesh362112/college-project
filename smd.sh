#!/bin/bash

# Infinite loop for live monitoring
while true
do
    clear

    echo "==============================================="
    echo "         SYSTEM MONITORING DASHBOARD"
    echo "==============================================="
    echo "Date & Time: $(date)"
    echo ""

    # CPU Usage
    echo "----- CPU USAGE -----"
    top -bn1 | grep "Cpu(s)" | \
    awk '{print "CPU Usage: " 100 - $8 "%"}'
    echo ""

    # Memory Usage
    echo "----- MEMORY USAGE -----"
    free -m | awk 'NR==2{
        printf "Total: %s MB\nUsed: %s MB\nFree: %s MB\nUsage: %.2f%%\n",
        $2,$3,$4,$3*100/$2 }'
    echo ""

    # Disk Usage
    echo "----- DISK USAGE -----"
    df -h | awk '$NF=="/"{
        printf "Total: %s\nUsed: %s\nAvailable: %s\nUsage: %s\n",
        $2,$3,$4,$5 }'
    echo ""

    # Top 5 Processes by CPU
    echo "----- TOP 5 PROCESSES (CPU) -----"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    echo ""

    # Logged in Users
    echo "----- LOGGED IN USERS -----"
    who
    echo ""

    echo "==============================================="
    echo "Refreshing in 3 seconds..."
    
    sleep 3
done