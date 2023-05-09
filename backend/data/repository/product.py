from typing import List

from ..connections import apply_sql_connection 
from ..dal import *
from ..messaging import convert_product_record_to_dict

@apply_sql_connection
def fetch_all_product_records(cursor)->List:
    results = get_all_product_records(cursor)

    converted_results = list()
    for result in results:
        converted_result = convert_product_record_to_dict(result)
        converted_results.append(converted_result)

    return converted_results