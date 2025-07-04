#!/bin/bash

# Dark Web Style Login Interface - by lveuia & cyp3rox99

clear

# Display Anonymous Red ASCII Logo
ascii_art='
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⡿⠛⠉⣀⣀⣀⡉⠉⠛⢿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⠋⠀⣠⣶⡿⠛⠛⠛⠻⢿⣷⣄⠈⠙⣿⣿⣆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣿⣿⠁⠀⣼⣿⠃⠀⠀⠀⠀⠀⠀⠙⣿⣷⠀⠈⣿⣿⣧⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⣿⡇⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⢿⣿⣦⣄⠀⠀⠀⠀⣠⣴⣿⠿⠀⠀⢸⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠉⠛⠿⣿⣿⣿⠿⠛⠋⠁⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢿⣿⣇⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⡿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣶⣶⣶⣤⣤⣤⣤⣴⣶⣾⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀
'

echo "$ascii_art" | lolcat

# Info Box
zenity --info --title="Welcome" --text="DarkWeb Login Interface\nDeveloped by lveuia & cyp3rox99" --width=300 --height=100

# Ask for credentials
USERNAME=$(zenity --entry --title="Login" --text="Enter Username:")
PASSWORD=$(zenity --password --title="Login")

# Validation (dummy)
if [[ "$USERNAME" == "admin" && "$PASSWORD" == "1337" ]]; then
    zenity --info --text="✅ Access Granted. Welcome $USERNAME"
    exec bash
else
    zenity --error --text="❌ Access Denied. Invalid credentials."
    exit 1
fi
