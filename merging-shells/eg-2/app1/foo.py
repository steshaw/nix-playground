from flask import Flask

app = Flask(__name__)

@app.route("/")
def foo():
    return "Foo!"

def main():
    app.run(host="0.0.0.0", port=8000)

if __name__ == '__main__':
    main()
