#!/bin/bash

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
bold="\e[1m"
italic="\e[2m"
reset="\e[0m"

echo -e "${bold}System Usage Analysis${reset} \n"

# Memory analysis
echo -e "${italic}Memory: ${reset}"
total_mem_gib=$(LANG=C free -h | grep Mem: | awk '{print $2}')
used_mem_gib=$(LANG=C free -h | grep Mem: | awk '{print $3}')

total_mem=$(LANG=C free | grep Mem: | awk '{print $2}')
used_mem=$(LANG=C free | grep Mem: | awk '{print $3}')
mem_perc=$(LANG=C free -b | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')


if [ $mem_perc -ge 50 ]; then
    echo -e "${red}$total_mem_gib / $used_mem_gib ${reset}"
else
    echo -e "${green}$total_mem_gib / $used_mem_gib ${reset}"
fi

# Swap analysis
echo -e "${italic}Swap: ${reset}"
total_swap_gib=$(LANG=C free -h | grep Swap: | awk '{print $2}')
used_swap_gib=$(LANG=C free -h | grep Swap: | awk '{print $3}')

total_swap=$(LANG=C free | grep Swap: | awk '{print $2}')
used_swap=$(LANG=C free | grep Swap: | awk '{print $3}')
swap_perc=$(LANG=C free -b | awk '/Swap:/ {printf "%.0f", ($3/$2)*100}')

if [ "$total_swap" -gt 0 ]; then
    swap_perc=$(LANG=C free -b | awk '/Swap:/ {printf "%.0f", ($3/$2)*100}')
else
    swap_perc=0
fi


if [ "$swap_perc" -ge 1 ]; then
    echo -e "${red}$total_swap_gib / $used_swap_gib ${reset}"
else
    echo -e "${green}$total_swap_gib / $used_swap_gib ${reset}"
fi


# CPU analysis
echo -e "${italic}CPU: ${reset}"
cpu_usage=$(top -bn1 | awk '/Cpu/ { print $2}')
cpu_usage_int=$(echo "$cpu_usage" | cut -d',' -f1)

if [ $cpu_usage_int -le 10 ]; then
    echo -e "${green}%$cpu_usage${reset}"
elif [ $cpu_usage_int -le 50 ]; then
    echo -e "${yellow}%$cpu_usage${reset}"
else
    echo -e "${red}%$cpu_usage${reset}"
fi


# Disk analysis
echo -e "${italic}Disk: ${reset}"

root_disk_usg=$(df -h | awk '$NF == "/" {print $5}' | cut -d'%' -f1)

if [ $root_disk_usg -le 20 ]; then
    echo -e "${green}%$root_disk_usg${reset}"
elif [ $root_disk_usg -le 60 ]; then
    echo -e "${yellow}%$root_disk_usg${reset}"
else
    echo -e "${red}%$root_disk_usg${reset}"
fi
