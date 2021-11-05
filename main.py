import webbrowser
from flask import Flask, request, render_template

app = Flask(__name__)

survery_core_questions = {
    'distance': '',
    'allergies': False,  # TODO: if allergies == True, then if allergy in food take it out
    'italian': False,
    'chinese': False,
    'american': False,
    'breakfast': False,
    'thai': False,
    'arab': False,
    'indian': False,
    'mexican': False
    # TODO: get all other kinds of food eventualy
}

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/server_app", methods=["GET", "POST"])
def server_app():
    # right now there aren't any back end functions so this will be empty
    return render_template('index.html')

def get_recipe_from_api():
    # TODO: get final list of recipes after passing in the users tendencies and likes
    pass

def send_recipe_to_html():
    # TODO: output recipe value to HTML page
    pass

def get_dine_in_from_api():
    # TODO: get final list of dine in restraunts after passing in the users tendencies and likes
    pass

def send_dine_in_to_html():
    # TODO: output dine in value to HTML page
    pass

def get_take_out_from_api():
    # TODO: get list of take out fitting for the user
    pass

def send_take_out_to_html():
    # TODO: output take out value to HTML page
    pass

def get_distance():
    # TODO: get distance from the user. this will be the first and most important guide
    # found by having the zip code
    pass

def configuration_commands():
    pass

def survery():
    pass

if __name__ == '__main__':
    webbrowser.open("http://127.0.0.1:5000")
    app.run(host="127.0.0.1", port=5000)