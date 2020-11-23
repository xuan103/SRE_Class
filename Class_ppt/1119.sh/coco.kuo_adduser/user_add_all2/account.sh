#!/bin/bash
check=$(sudo -l | head -n 1 | fmt -u | cut -d' ' -f1)
if [ $check != 'Matching' ]
then
echo 'You Do Not A Root!'
else
read -p 'Give me a name: ' ans
account=$(cat /etc/passwd | cut -d ':' -f1 | grep -x $ans)
if [ ! -n "$account" ]
then
  sudo useradd -m -s /bin/bash $ans
  echo "${ans}:${ans}" > passwd.txt
  sudo chpasswd < passwd.txt
  echo "$ans Account Create!!"
else
  echo "$ans Account already exist"
fi
fi