from flask import Flask, render_template, request, redirect, session
import random
app = Flask(__name__)
app.secret_key = 'Jasub2'

@app.route('/')
def index():
    session['number'] = random.randint(1,100)
    session['attempt'] = 0
    return render_template('index.html')

@app.route('/guess')
def guess():
    session['attempt'] += 1
    session['guess'] = request.form['guess']
    if int(session['guess']) == int(session['number']):
        return redirect('/win')
    elif int(session['attempt']) == 5:
        return redirect('lose')
    elif int(session['guess']) < int(session['number']):
        return redirect('/low')
    elif int(session['guess']) > int(session['number']):
        return redirect('/high')

@app.route('/low')
def low(state='wrong'):
    remaining = 5 - int(session['attempt'])
    content = f'Too low! {remaining} guesses remaining.'
    return render_template('guess.html', state=state, content=content)
@app.route('/high')
def high(state='wrong'):
    remaining = 5 - int(session['attempt'])
    content = f'Too high! {remaining} guesses remaining.'
    return render_template('guess.html', state=state, content=content)
@app.route('/win')
def win(state='right'):
    content = 'You guessed correctly!'
    win_guesses = session['attempt']
    return render_template('guess.html', state=state, content=content, win=win_guesses)
@app.route('/lose')
def lose(state='wrong'):
    content = 'You lost!'
    return render_template('guess.html', state=state, content=content)

@app.route('/reset', methods=['POST'])
def reset():
    session.clear()
    return redirect('/')

if __name__=="__main__":
    app.run(debug=True) 