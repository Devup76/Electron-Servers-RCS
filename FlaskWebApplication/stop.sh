#!/bin/bash

#####################################################
#                                                   #
# -- Connect to the screens and execute commands -- #
#                                                   #
#####################################################

check_screen_session() {
    if screen -ls | grep -q "$1"; then
        return 0 # screen session exists
    else
        return 1 # screen session does not exist
    fi
}

# Server2
# Forgive me father for I have sinned.. for loop coming soon.
if check_screen_session "Server2"; then
    screen -d -r "Server2" -X stuff "say Server is shutting down.
    "
    sleep 5
    screen -d -r "Server2" -X stuff "say Shutdown in 10
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 9
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 8
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 7
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 6
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 5
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 4
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 3
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 2
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Shutdown in 1
    "
    sleep 1
    screen -d -r "Server2" -X stuff "say Server shutting down.
    "
    sleep 5
    screen -d -r "Server2" -X stuff "save-all
    "
    screen -d -r "Server2" -X stuff "stop
    "
    sleep 3
    screen -X -S "Server2" quit
fi

# Server3
if check_screen_session "Server3"; then
    screen -d -r "Server3" -X stuff "say Server is shutting down.
    "
    sleep 5
    screen -d -r "Server3" -X stuff "save-all
    "
    screen -d -r "Server3" -X stuff "stop
    "
    screen -X -S "Server3" quit
fi

# Lobby
if check_screen_session "Lobby"; then
    screen -d -r "Lobby" -X stuff "say Server is shutting down.
    "
    screen -d -r "Lobby" -X stuff "save-all
    "
    screen -d -r "Lobby" -X stuff "stop
    "
    screen -X -S "Lobby" quit
fi

# BungeeCord
if check_screen_session "BungeeCord"; then
    screen -d -r "BungeeCord" -X stuff "end
    "
    screen -X -S "BungeeCord" quit
fi