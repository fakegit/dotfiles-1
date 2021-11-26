#! /bin/sh

export host_ip="192.168.229.1"
export host_port="60000"
export all_proxy="http://$host_ip:$host_port"
export http_proxy="http://$host_ip:$host_port"
export https_proxy="http://$host_ip:$host_port"
export NO_PROXY=localhost,::1,.example.com
