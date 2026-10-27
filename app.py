from flask import Flask, render_template
import sqlite3

app = Flask(__name__)
def get_db():
    conn = sqlite3.connect("lifeos.db")
    conn.row_factory = sqlite3.Row
    return conn
def init_db():
            with open("schema.sql") as f:
                conn = get_db()
                conn.executescript(f.read())
                conn.commit()
                conn.close()
            


@app.route("/")
def home():
    return render_template("index.html")

@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")


@app.route("/goals")
def goals():
    return render_template("goals.html")

@app.route("/Task")
def tasks():
          conn = get_db()
          tasks = conn.execute( "SELECT * FROM Task_Table").fetchall()
          print("Tasks retrieved:", len(tasks))
          print("Task records:", tasks)
          conn.close()
          return render_template("Task.html", tasks=tasks)

   

if __name__ == "__main__":
    init_db()
    app.run(debug=True)

    