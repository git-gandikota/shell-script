#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2....Failed"
        exit 1
    else
        echo "$2....suceed"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 #manually exit if error comes.
else
    echo "You are Super user"
fi

dnf install mysql -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing Git"

echo "All your commands was successfull."