import os
from flask import Flask


app = Flask(__name__)


id = os.popen('cat /proc/sys/kernel/random/uuid').read()


@app.route("/")
def hello_world():
    return id


if __name__ == '__main__':
    app.run(host="0.0.0.0", port="80")
