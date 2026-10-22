from flask import Flask, render_template
import sqlite3

app = Flask(__name__)
def get_db():
    conn = sqlite3.connnect("lifeos.db")
    conn.row_factory = sqlite3.Row
    return conn


@app.route("/")
def home():
    return render_template("index.html")

@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")


@app.route("/goals")
def goals():
    return render_template("goals.html")

@app.route("/task")
def task():
    def init_db():
        with open("schema.sql") as f:
            conn = get_db()
            conn.executescript(f.read())
            conn.commit()
            conn.close()
    return render_template("task.html")

if __name__ == "__main__":
    app.run(debug=True)

    