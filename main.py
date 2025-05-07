from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

def about(query):
    rocq = subprocess.run(
        ['coqtop'],
        input='From mathcomp Require Import all_ssreflect.\nAbout {query}.\n',
        text=True,
        capture_output=True,
        check=True
    )
    return rocq

@app.route('/query', methods=['POST'])
def query():
    query = request.form['query']
    try:
        result = about(query)
        return jsonify({'result': result.stdout})
    except subprocess.CalledProcessError as e:
        return jsonify({'error': str(e)}), 500

@app.route('/')
def index():
    return '''
    <h1>Welcome to the Rocq Query API</h1>
    <p>Use the /query endpoint to send queries.</p>
    <form method="POST" action="/query">
        <input type="text" name="query" placeholder="Enter your query">
        <input type="submit" value="Submit">
    </form>
    '''

if __name__ == '__main__':
    app.run(debug=True)