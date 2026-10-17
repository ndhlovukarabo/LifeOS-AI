from flask import Flask, render_template

app = Flask(__name__)

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
    return render_template("task.html")

if __name__ == "__main__":
    app.run(debug=True)

    