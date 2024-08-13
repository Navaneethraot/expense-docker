#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"
if [ $USERID -ne 0 ]
then
     echo -e "$2 ...$R FAILED $W"
    else
        echo -e "$2 ...$G SUCCESS $W"
fi

#check whether root user or not
R="\e[31m"
N="\e[0m"
#
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
echo -e "$R Logout and Login again $N"
