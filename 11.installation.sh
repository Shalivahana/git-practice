#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi

dnf list installed git # Just checking whether installed or not

echo "$?"

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing
    if[ $? -ne 0]
    then
        echo "Git installation is not sucess ...Check it"
        exit 1
    else
        echo "Git installtion is sucess ..."
    fi
else    
    echo "Git is already installed, nothing to do.."
fi