#!/bin/bash
screen -dm -S "BungeeCord" bash -c "cd /home/user/BungeeCord; sleep 10; ./run.sh; exec sh"
screen -dm -S "Lobby" bash -c "cd /home/user/Lobby; sleep 10; ./run.sh; exec sh"
screen -dm -S "Server2" bash -c "cd /home/user/Server2; sleep 10; ./run.sh; exec sh"
screen -dm -S "Server3" bash -c "cd /home/user/Server3; sleep 10; ./run.sh; exec sh"