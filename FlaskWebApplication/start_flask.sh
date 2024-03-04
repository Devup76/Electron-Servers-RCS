#!/bin/bash

# Create the screen for flask console output.
screen -dmS "venv" bash -c '

    # Set the project directory
    cd /home/user/FlaskWebApplication/

    # Activate the venv
    source venv/bin/activate

    # Run the venv using gunicorn
    gunicorn -w 1 -b 0.0.0.0:8000 app:app

    # Keep the screen session alive after the commands finish
    exec bash
'