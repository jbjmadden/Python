from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)  
app.secret_key = "JsuAd"


@app.route('/')
def display_index():
    session['count'] = 1
    session['visits'] = 1
    return render_template('index.html')

@app.route('/count')
def display():
    return render_template('count.html')


@app.route('/test', methods=['post'])
def count():
    session['count'] += 1
    session['visits'] += 1
    return redirect('/count')

@app.route('/test2', methods=['post'])
def count2():
    session['count'] += 2
    session['visits'] += 1
    return redirect('/count')

@app.route('/testInput', methods=['post'])
def countX():
    session['count'] += int(request.form['count_increase'])
    session['visits'] += 1
    return redirect('/count')


@app.route('/reset', methods=['post'])
def reset_count():
    del session['count']
    session['count'] = 1
    return redirect('/count')

@app.route('/destroy_session')
def destroy_session():
    session.clear()
    return redirect('/')


if __name__=="__main__":   
    app.run(debug=True)    