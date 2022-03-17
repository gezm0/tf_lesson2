#!/bin/bash
sudo yum -y update
sudo amazon-linux-extras install nginx1 -y
sudo service nginx start
sudo chkconfig nginx on