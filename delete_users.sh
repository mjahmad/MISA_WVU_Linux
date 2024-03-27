#!/bin/bash

# Path to the file with user information
USER_FILE="./kali_users.txt"

# Read the file and delete users
while IFS=: read -r username _; do
    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Delete the user and their home directory
        sudo userdel -r "$username"
        echo "User $username deleted along with their home directory."
    else
        echo "User $username does not exist."
    fi
done < "$USER_FILE"

echo "All listed users processed."
