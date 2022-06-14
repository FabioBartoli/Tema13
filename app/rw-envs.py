import os
from distutils.log import debug
from flask import Flask, render_template
app = Flask(__name__)

@app.route("/helthchecker")
def helthchecker():
    return "OK"

@app.route("/")
def hello():
    return render_template('index.html')

@app.route("/conf/env")
def read_envs():
   return (os.popen('printenv').read() + render_template('voltar.html'))

@app.route("/env/<env_name>/<env_Var>")
def write_envs(env_name, env_Var):
    var = os.environ[env_name] = str(env_Var)
    return (var + render_template('listavar.html'))

if __name__ == '__main__':
    app.run(debug=False,port=8080)