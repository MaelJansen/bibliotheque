from flask import Flask, request
import subprocess
import json

app = Flask(__name__)

@app.route('/deploy', methods=['GET'])
def run_command():
    token = request.args.get('token', default = "invalid", type = str)

    if token == json.load(open('token.json')):
        print("Launching deploy script...")

        output = subprocess.check_output("./deploy.sh", shell=True)

        print("Deploy script finished.")

        return output

    return 'Invalid token'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8002)
