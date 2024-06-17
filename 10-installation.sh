#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 #manually exit if error comes.
else
    echo "You are Super user"
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql...Failed"
    exit 1
fi

dnfinstall git -y

echo "is script proceeding?"