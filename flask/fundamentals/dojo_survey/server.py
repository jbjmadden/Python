from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'Jasub2'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/results')
def results():
    return render_template('results.html')

@app.route('/submit', methods=['post'])
def submit():
    session['name'] = request.form['name']
    session['location'] = request.form['location']
    session['language'] = request.form['language']
    session['comments'] = request.form['comments']
    return redirect('/results')

if __name__=="__main__":
    app.run(debug=True) 