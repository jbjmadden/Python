from flask import render_template, request, redirect, session
from flask_app import app
from flask_app.models.model_dojo import Dojo
from flask_app.models.model_ninja import Ninja

@app.route('/ninja/new')
def new_ninja():
    dojos = Dojo.get_all_dojos()
    return render_template('ninja.html', dojos=dojos)

@app.route('/ninja/create', methods=['POST'])
def create_ninja():
    data = {
        **request.form
    }
    print(data)
    Ninja.create_ninja(data)
    return redirect('/dojos')