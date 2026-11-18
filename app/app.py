import os

import pymysql
from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/api/loads")
def get_loads():
    try:
        connection = pymysql.connect(
            unix_socket="/var/run/mysqld/mysqld.sock",
            user="counter_reader",
            password=os.environ["MYSQL_PASSWORD"],
            database="click_checker",
            connect_timeout=5,
        )
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT total_loads FROM page_load_counter WHERE id = 1"
                )
                row = cursor.fetchone()
        finally:
            connection.close()

        if row is None:
            return jsonify(error="Counter not found"), 404

        response = jsonify(total_loads=int(row[0]))
        response.headers["Cache-Control"] = "no-store"
        return response

    except (pymysql.MySQLError, KeyError):
        app.logger.exception("Unable to read the counter")
        return jsonify(error="Counter unavailable"), 503
