from flask import render_template, request, redirect, session
from flask_app import app
from flask_app.models.model_dojo import Dojo

@app.route('/')
def index():
    return redirect('/dojos')


@app.route('/dojos')
def dojos():
    #render index and show all dojos
    dojos = Dojo.get_all_dojos()
    print(dojos)
    return render_template('dojo.html', dojos=dojos)

@app.route('/dojos/create', methods=['POST'])
def create_dojo():
    data = {
        **request.form
    }
    Dojo.create_dojo(data)
    return redirect('/dojos')
    
@app.route('/dojos/show/<int:id>')
def show_dojo(id):
    #show 1 dojo and its ninjas
    dojo = Dojo.get_one_dojo({'id': id})
    return render_template('dojo_show.html', dojo=dojo)