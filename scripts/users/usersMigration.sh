#! /bin/bash 

#first we need to do less /etc/passwd and see where the regular user accounts start
#Afterwards, we can use this number(the first regular user ID number in the 3rd column) to set the limit on our command. We won't be exporting users or groups below this limit.
#We also exclude the "nobody" account that is given the user ID of "65534"


#----------------users sync file---------------------------------#

awk -v LIMIT=limit# -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd > /root/passwd.sync

#substitute limit# with the lowest regular user number discovered in /etc/paswd

#----------------group sync file---------------------------------#

awk -v LIMIT=limit# -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > /root/group.sync

#We can use the usernames within the range we're interested in from our /etc/passwd file to get the values we want from our shadow file:

awk -v LIMIT=limit# -F: '($3>=LIMIT) && ($3!=35534) {print $1}' /etc/passwd | tee - | egrep -f - /etc/shadow > /root/shadow.sync

#For the /etc/gshadow file, we'll do a similar operation:

awk -v LIMIT=limit# -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/group | tee - | egrep -f - /etc/gshadow > /root/gshadow.sync


