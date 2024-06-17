#!/bin/bash

USERID=$(ID -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/TMP/$0/$SCRIPT_NAME-$TIMESTAMP.log

#This all sentences are used to create a log file

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

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"

echo "All your commands was successfull."