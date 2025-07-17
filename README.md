# System Usage Analysis Script

A bash script that displays real-time system resource usage information with color-coded output.

## Features

- **Memory Usage**: Shows total and used memory in GiB format
- **Swap Usage**: Displays swap memory information
- **CPU Usage**: Shows current CPU usage percentage
- **Disk Usage**: Displays root partition disk usage

## Color Coding

The script uses colors to indicate different usage levels:

- 🟢 **Green**: Normal/Low usage
- 🟡 **Yellow**: Medium usage  
- 🔴 **Red**: High usage

### Usage Thresholds

- **Memory**: Red if ≥50%, otherwise green
- **Swap**: Red if ≥1%, otherwise green
- **CPU**: Green if ≤10%, yellow if ≤50%, red if >50%
- **Disk**: Green if ≤20%, yellow if ≤60%, red if >60%

## Installation

### Download the Script

You can download the script directly using `curl` or `wget`:

```bash
# Using curl
curl -O https://raw.githubusercontent.com/username/sysusg/main/script.sh

# Using wget
wget https://raw.githubusercontent.com/username/sysusg/main/script.sh

# Or clone the entire repository
git clone https://github.com/username/sysusg.git
cd sysusg
```

## Usage

Make the script executable and run it:

```bash
chmod +x script.sh
./script.sh
```

### Real-time Monitoring with Watch

For continuous monitoring, you can use the `watch` command to run the script at regular intervals:

```bash
# Update every 2 seconds (default)
watch ./script.sh

# Update every 1 second
watch -n 1 ./script.sh

# Update every 5 seconds
watch -n 5 ./script.sh

# Exit watch mode by pressing Ctrl+C
```

## Sample Output

```text
System Usage Analysis 

Memory: 
14Gi / 7,4Gi 
Swap: 
0B / 0B 
CPU: 
%5.2
Disk: 
%45
```
## License

This script is provided as-is for educational and personal use.
