#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# if [ $USERID -ne 0 ]
# then
#      echo -e "$R Please run this script with root access." $N"
#      exit 1 # manually exit if error comes.
#     else
#         echo -e "$G You are super user $N"
# fi

#check whether root user or not

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
echo -e "$R Logout and Login again $N "
