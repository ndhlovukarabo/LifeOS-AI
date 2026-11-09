from flask import Flask, render_template
import sqlite3
from flask import request

app = Flask(__name__)
def get_db():
    conn = sqlite3.connect("lifeos.db")
    conn.row_factory = sqlite3.Row
    return conn
def init_db():
        conn = get_db()
        with open("schema.sql","r", encoding="utf-8") as f:
          conn.executescript(f.read())

        with open("sample_data.sql","r", encoding="utf-8") as f:
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
@app.route("/update_task", methods=["POST"])
def update_task():
     data = request.get_json()
     task_id = data["task_id"]
     is_completed = data["is_completed"]

     conn = get_db()
     conn.execute(
           "UPDATE Task_Table SET is_completed = ? WHERE id = ?",
        (is_completed, task_id)
     )
@app.route("/add_task", methods="POST")
def add_task():
     data = request.get_json()
     task_name = data["task_name"]
     description_task = data["description_task"]
     due_date = data["due_date"]
     start_date = data["start_date"]

     conn = get_db()
     conn.execute(
          ("INSERT INTO Task_Table (task_name, description_task, due_date, start_date) VALUES (?,?,?,?)", (task_name, description_task, due_date, start_date))
     ) 
     conn.commit()
     conn.close()
     return {"Success": True}

     



   

if __name__ == "__main__":
    init_db()
    
    app.run(debug=True)

    