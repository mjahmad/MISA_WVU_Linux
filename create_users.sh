#!/bin/bash

# Path to the file with user information
USER_FILE="./kali_users.txt"

# Check if the group MISA_USERS exists, if not, create it
if ! getent group MISA_USERS > /dev/null; then
    sudo groupadd MISA_USERS
    echo "Group MISA_USERS created."
fi

# Read the file and create users
while IFS=: read -r username password; do
    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists."
    else
        # Create a new user with the specified password
        sudo useradd -m -s /bin/bash -G MISA_USERS "$username"
        echo "$username:$password" | sudo chpasswd
        echo "User $username created and added to MISA_USERS."
    fi
done < "$USER_FILE"

echo "All users processed."
