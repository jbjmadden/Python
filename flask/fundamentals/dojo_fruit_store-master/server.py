from flask import Flask, render_template, request, redirect
app = Flask(__name__)  

@app.route('/')         
def index():
    return render_template("index.html")

@app.route('/checkout', methods=['POST'])         
def checkout():
    total_fruits = int(request.form['strawberry']) + int(request.form['raspberry']) + int(request.form['apple']) + int(request.form['blackberry'])
    print(f"Charging {request.form['first_name']}'s account for {total_fruits} fruits.")
    amount = total_fruits
    display = request.form
    return render_template("checkout.html", amount=amount, display = display)

@app.route('/fruits')         
def fruits():
    return render_template("fruits.html")

if __name__=="__main__":   
    app.run(debug=True)    