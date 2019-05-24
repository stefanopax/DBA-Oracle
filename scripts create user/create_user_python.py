#!/bin/python

# Create user python program

name = raw_input("Enter username: ")
bool = raw_input("Quota unlimited on USERS and INDX?(y/n) ")

print("");
print "CREATE USER " + name + " IDENTIFIED BY " + name;
print("");
print "GRANT CONNECT, RESOURCE TO " + name;
print "GRANT CREATE VIEW TO " + name;
print "GRANT CREATE SYNONYM TO " + name;
print("");

if bool=="y" :
	print "ALTER USER " + name + " QUOTA UNLIMITED ON INDX";
	print "ALTER USER " + name + " QUOTA UNLIMITED ON USERS";