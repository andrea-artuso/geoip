# geoip
A simple bash script to view the basic geographical information about a public IP address.

## Installation
> 1. Close this repository `git clone https://github.com/andrea-artuso/geoip.git`
> 2. Copy the bash script to the `/opt` directory with the command `cp geoip/geoip.sh /opt/geoip`
> 3. Add the `/opt` directory to PATH so you can just issue `geoip` to run the script

## Usage
**Default mode**
`geoip <IP_ADDRESS>` eg. `geoip 8.8.8.8`

**Raw mode**
`geoip <-R|--raw> <IP_ADDRESS>` eg. `geoip -R 8.8.8.8` or `geoip --raw 8.8.8.8`

**See all options**
`geoip --help`
