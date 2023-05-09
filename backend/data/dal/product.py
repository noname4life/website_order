from typing import List

def get_all_product_records(cursor)->List:
    cursor.execute("""
        SELECT p.name, 
        pc.category,
        pv.value::float
        FROM business.product p
        INNER JOIN business.product_category pc
        ON p.category_id  = pc.pk
        INNER JOIN business.product_value pv
        ON p.pk = pv.product_id 
        WHERE p.deleted_at IS NULL
        AND pc.deleted_at IS NULL
        AND pv.is_latest = TRUE
        AND pv.deleted_at IS NULL
        ORDER BY p.pk ASC;
    """)

    return list(cursor.fetchall())   
