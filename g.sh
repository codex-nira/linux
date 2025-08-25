#!/bin/bash

 read -p "Enter Your name: " name
 read -p "Enter your age: " age

 echo "Hi $name your age is $age years old"

================================================

read -p "Enter a number: " num

if [ $((num % 2)) -eq 0 ]; then
        echo "even"
else
        echo "odd"

fi

===============================================

greet(){
 echo "Hello, $1!"
}
greet "Student"

last_command_status=$?
echo "Exit status: $last_command_status"

===============================================

read -p "Enter a number: " num
if [ $num -gt 0 ]; then
 echo "Positive"
 else
 echo "Not positive"
fi 

===============================================

# A simple system information script
 echo "System Information Report"
 echo "-------------------------"

 # Current User
 echo "Current User: $(whoami)"

 # Date and Time
  echo "Date and Time: $(date)"

===============================================

for i in {1..5};do
        echo "number: $i"
done
 
read -p "Guess a number: " guess
while [ "$guess" -ne 7 ]; do
    read -p "Try again:" guess
done