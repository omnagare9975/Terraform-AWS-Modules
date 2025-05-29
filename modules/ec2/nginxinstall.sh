#!/bin/bash

apt-get update

apt-get install nginx -y

systemctl enable nginx

systemctl start nginx

echo "<h1> Hii Im Om Nagare From Terraform </h1>" | sudo tee -a /var/www/html/index.html