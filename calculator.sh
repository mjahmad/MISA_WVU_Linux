#!/bin/bash

echo "Simple Bash Calculator"
echo "Enter two numbers:"
read a
read b

echo "Enter Choice: "
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read choice

case $choice in
  "1")res=$(echo $a + $b | bc)
  ;;
  "2")res=$(echo $a - $b | bc)
  ;;
  "3")res=$(echo $a \* $b | bc)
  ;;
  "4")res=$(echo "scale=2; $a / $b" | bc)
  ;;
  *)echo "Invalid choice"
  exit 1
  ;;
esac

echo "Result : $res"
