from flask import Flask


app = Flask(__name__)


@app.route('/')
def index():
    return "Hello World!"

@app.route('/dojo')
def dojo():
    return "Dojo!"

@app.route('/say/<name>')
def say_name(name):
    test = isinstance(name, str)
    if test == True:
        return f"Hi {name.capitalize()}!" 
    else:
        return  "needs to be a string"

@app.route('/repeat/<int:num>/<string:word>')
def repeat_word(num, word):
    output = ''
    for i in range(0,num):
        output += f"<p>{word}</p>"
    return output

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return "Sorry! No response. Try again."


if __name__=="__main__":
    app.run(debug=True)