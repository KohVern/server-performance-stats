# Name and Version of OS
cat /etc/*-release | grep "PRETTY_NAME" | awk -F '=' '{print "Name: "$2}'

# Total CPU usage in percentage
top -bn1 | grep "Cpu(s)" | awk -F ',' '{print $4}' | awk '{print "Total CPU usage: " 100 - $1 "%"}'

# Memory usage (Used) mb
free -m | grep "Mem" | awk '{print "Memory Used: " $3 "MB" " / " $2 "MB" " (" $3/$2 * 100 "%)"}'

# Memory usage (Free) mb
free -m | grep "Mem" | awk '{print "Memory Free: " $4 "MB" " / " $2 "MB" " (" $4/$2 * 100 "%)"}'

#Disk usage (Used) gb
df | grep "C:" | awk '{print "Disk Used: " $3/1000000 "GB" " / " $2/1000000 "GB" " (" $3/$2 * 100 "%)"}'

#Disk usage (Free) gb
df | grep "C:" | awk '{print "Disk Free: " $4/1000000 "GB" " / " $2/1000000 "GB" " (" $4/$2 * 100 "%)"}'

# Top 5 processes by Cpu usage
printf "Top 5 Processes by CPU Usage (%%)\n"
ps -eo comm,%cpu | sort -nrk 2 | head -n 5

# Top 5 processes by memory usage
printf "Top 5 Processes by memory Usage (%%)\n"
ps -eo comm,%mem | sort -nrk 2 | head -n 5