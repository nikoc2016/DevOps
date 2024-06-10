#!/bin/bash
sudo apt update && sudo apt install wget apache2 unzip -y
sudo systemctl enable apache2 --now
wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
unzip -o 2117_infinite_loop.zip
cp -r 2117_infinite_loop/* /var/www/html
sudo systemctl restart apache2
