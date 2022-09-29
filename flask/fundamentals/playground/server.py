from flask import Flask, render_template
app = Flask(__name__)

@app.route('/play')
def index():
    return render_template('index.html', num = 3, color = 'lightskyblue', pageNum = 1)

@app.route('/play/<int:num>')
def play_num(num):
    return render_template("index.html", num=num, color="lightskyblue")

@app.route('/play/<int:num>/<string:color>')
def play_color_int(num, color):
    return render_template("index.html", num=num, color=color, pageNum = 3)

if __name__=='__main__':
    app.run(debug=True)