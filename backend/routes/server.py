from flask import Flask
from flask_json import FlaskJSON

server = Flask(__name__)
FlaskJSON(server)
