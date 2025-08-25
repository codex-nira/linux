#!/bin/bash

# Check for correct argument count
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <userlist-file>"
    exit 1
fi

userlist="$1"

# Validate file existence
if [[ ! -f "$userlist" || ! -r "$userlist" ]]; then
    echo "Error: File '$userlist' does not exist or is not readable."
    exit 1
fi

while IFS=',' read -r username fullname; do
    # Trim whitespace
    username=$(echo "$username" | xargs)
    fullname=$(echo "$fullname" | xargs)

    # Skip empty or malformed lines
    [[ -z "$username" || -z "$fullname" ]] && continue

    # Check username validity (simple regex)
    if [[ ! "$username" =~ ^[a-z_][a-z0-9_-]*$ ]]; then
        echo "Invalid username: $username. Skipping."
        continue
    fi

    if id "$username" &>/dev/null; then
        echo "User $username already exists. Skipping."
    else
        useradd -m -c "$fullname" -s /bin/bash "$username"

        # Set initial password (here: "Default123")
        echo "$username:Default123" | chpasswd
        
        # Force password change on first login
        passwd --expire "$username"

        echo "Created user: $username (Full Name: $fullname, Shell: /bin/bash, Initial password set)"
    fi
done < "$userlist"

