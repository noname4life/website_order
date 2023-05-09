import requests
from flask import render_template

from .server import server

@server.route("/products", methods=["GET"])
def get_product_details():
    response = requests.get("http://localhost:5000/products") #TODO: Move endpoint to config
    return render_template("menu.html", 
                           products=response.json()["data"])