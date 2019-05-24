#!/bin/bash

echo "Enter username: "
read user

echo CREATE USER $user IDENTIFIED BY $user;
echo \n;
echo GRANT CONNECT, RESOURCE TO $user;
echo GRANT CREATE VIEW TO $user;
echo GRANT CREATE SYNONYM TO $user;