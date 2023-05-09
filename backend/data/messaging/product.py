from typing import List

def convert_product_record_to_dict(product:List):
    record = {
        "product_name": product[0],
        "product_category": product[1],
        "product_value": product[2],
    }

    return record
