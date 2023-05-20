from flask import render_template

from .server import server

@server.route("/", methods=["GET"])
@server.route("/home", methods=["GET"])
def index():
    return render_template("index.html")
