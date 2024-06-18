#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2....$R Failed $N"
        exit 1
    else
        echo -e "$2....$G suceed $N"
    fi
}

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 #manually exit if error comes.
else
    echo "You are Super user"
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed...$Y Now it is skipping $N"
    else
        echo -e "$i not installed...$G Need to install $N"
    fi
done