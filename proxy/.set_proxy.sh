#! /bin/sh

export host_ip="192.168.31.100"
export host_port="7890"
export all_proxy="http://$host_ip:$host_port"
export http_proxy="http://$host_ip:$host_port"
export https_proxy="http://$host_ip:$host_port"
export NO_PROXY=localhost,::1,.example.com
