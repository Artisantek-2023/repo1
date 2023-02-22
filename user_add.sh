#!/bin/bash

echo "Enter username"
read username

grep "^$username" /etc/passwd > /dev/null

if [ $? -eq 0 ]; then
echo "Username already exists"
else
sudo useradd $username
sudo passwd $username
if [ $? -ne 0 ]; then
sudo userdel -r $username
echo "unable to update password hence deleted user"
else
echo "user added successfully"
fi
fi
