import psycopg2
from psycopg2 import pool

# TODO: Move to config file
sql_connection_pool = psycopg2.pool.SimpleConnectionPool(
    minconn=1,
    maxconn=10,
    host='localhost',
    database='dwh',
    user='backend_admin',
    password='123789',
    # port='5432' # double check if this can be edited later
)


def get_sql_connection():
    return sql_connection_pool.getconn()


def release_sql_connection(conn):
    sql_connection_pool.putconn(conn)


def apply_sql_connection_with_commit(func):
    def wrapper(*args, **kwargs):
        conn = get_sql_connection()
        cursor = conn.cursor()

        results = func(cursor, *args, **kwargs)

        conn.commit()
        cursor.close()
        release_sql_connection(conn)

        return results

    return wrapper

def apply_sql_connection(func):
    def wrapper(*args, **kwargs):
        conn = get_sql_connection()
        cursor = conn.cursor()

        results = func(cursor, *args, **kwargs)

        cursor.close()
        release_sql_connection(conn)

        return results

    return wrapper