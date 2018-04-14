from flask import jsonify
from flask import Flask, request
import os 


server_name = os.environ.get('SERVER_NAME', 'UNKNOWN')
app = Flask(server_name)

@app.route('/', methods = ['GET', 'POST'])
def api_root():
    json = request.json
    data = request.data
    data = data.decode('utf8')
    return jsonify({
        'server': server_name,
        'data': data,
        'json': json
        })


if __name__ == '__main__':
    print('Running {}'.format(server_name))
    app.run(port=8080)


