#!/bin/bash

# Generate SSH key
echo "Generating a new SSH key..."
ssh-keygen -t ed25519 -C "Macbook-Github" -f ~/.ssh/id_ed25519 -N ""

# Check if key generation was successful
if [ $? -ne 0 ]; then
    echo "SSH key generation failed. Please check for errors and try again."
    exit 1
fi

echo "SSH key generated successfully."

# Get the contents of the public key
public_key=$(cat ~/.ssh/id_ed25519.pub)

# Print instructions and the public key
echo "Please follow these steps:"
echo "1. Copy the following line into GitHub:"
echo
echo "$public_key"
echo
echo "2. Press Enter when you're done."

# Wait for user input
read -p ""

echo "Thank you! Your SSH key should now be set up on GitHub."
echo "Let's test the connection..."

# Test SSH connection to GitHub
ssh -T git@github.com

# Check the exit status of the SSH command
if [ $? -eq 1 ]; then
    echo "Success! Your SSH key is working with GitHub."
elif [ $? -eq 255 ]; then
    echo "The SSH key test failed. Please check your key and try again."
else
    echo "An unexpected error occurred. Please check your SSH setup and GitHub account."
fi
