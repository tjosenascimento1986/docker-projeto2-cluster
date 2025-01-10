#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.10.100
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
sudo docker node update --availability drain master
sudo docker service create --name web-server --replicas 15 -p 80:80 httpd