#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "Given number $NUMBER is greater than 10"
else
    echo "Given number $NUMBER is less than 10"
fi

# -git, -lt, -eq,-ge, -le these are the expressions that we use to do inside