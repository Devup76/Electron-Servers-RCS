from flask import Flask, render_template, jsonify
import subprocess
import os

app = Flask(__name__)
app.secret_key = 'REDACTED FOR SECURITY REASONS'

STATUS_FILE = '/home/user/FlaskWebApplication/server_status.txt'

def read_server_status():
    if os.path.exists(STATUS_FILE):
        with open(STATUS_FILE, 'r') as file:
            return file.read().strip() == 'True'
    return False

def write_server_status(status):
    with open(STATUS_FILE, 'w') as file:
        file.write(str(status))

server_running = read_server_status()

@app.route('/')
def index():
    server_status = 'Server is running' if server_running else 'Server not started'
    return render_template('index.html', server_status=server_status)

@app.route('/run-server', methods=['POST'])
def run_server():
    global server_running
    if not server_running:
        subprocess.run(['/home/user/run.sh'])
        server_running = True
        write_server_status(True)
        return jsonify({'message': 'Server is running', 'notification': 'Server started successfully.'})
    else:
        return jsonify({'message': 'Server is already running', 'notification': 'Server is already running.'})

@app.route('/stop-server', methods=['POST'])
def stop_server():
    global server_running
    if server_running:
        subprocess.run(['/home/user/stop.sh'])
        server_running = False
        write_server_status(False)
        return jsonify({'message': 'Server stopped', 'notification': 'Server stopped successfully.'})
    else:
        return jsonify({'message': 'Server is not running', 'notification': 'Server is not currently running.'})

@app.route('/check-server-status', methods=['GET'])
def check_server_status():
    return jsonify({'server_running': server_running})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True, threaded=False)
