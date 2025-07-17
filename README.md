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
curl -O https://raw.githubusercontent.com/06ergin06/sysusg/main/script.sh

# Using wget
wget https://raw.githubusercontent.com/06ergin06/sysusg/main/script.sh

# Or clone the entire repository
git clone https://github.com/06ergin06/sysusg.git
cd sysusg
```

## Usage

Make the script executable and run it:

```bash
chmod +x script.sh
./script.sh
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
