from flask_json import json_response

from .server import server
import data.repository as repository

@server.route("/products", methods=["GET"])
def get_product_details():
    product_details = repository.fetch_all_product_records()

    return json_response(status_=200, data = product_details)