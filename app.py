
import os
import time
from flask import Flask, send_from_directory

app = Flask(__name__)

@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

@app.route('/beep', methods=['POST'])
def beep():
    for i in range(10):
        os.system("echo -e '\a' > /dev/console")
        time.sleep(1)
    return "Bip sesi gönderildi!", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
