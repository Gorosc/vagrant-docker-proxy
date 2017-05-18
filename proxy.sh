#!/bin/bash

echo HTTP_PROXY=$1 >> /etc/environment
echo HTTPS_PROXY=$1 >> /etc/environment
echo NO_PROXY="127.0.0.1, localhost" >> /etc/environment

echo http_proxy=$1 >> /etc/environment
echo https_proxy=$1 >> /etc/environment
echo no_proxy="127.0.0.1, localhost" >> /etc/environment

echo 'Acquire::http::Proxy "'$1'" ;' > /etc/apt/apt.conf