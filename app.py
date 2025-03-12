from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def index():
    remote_user = request.environ.get('REMOTE_USER', 'Unknown')
    return f"Hello {remote_user}!\n" \
           f"User: {remote_user}\n" \
           f"Auth Type: {request.environ.get('AUTH_TYPE', 'Unknown')}\n"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)