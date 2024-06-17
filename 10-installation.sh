#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 #manually exit if error comes.
else
    echo "You are Super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql...Failed"
    exit 1
else
    echo "Installation of mysql...Succesfull"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installation of git...Failed"
    exit 1
else
    echo "Installation of git...Succesfull"
fi

echo "is script proceeding?"