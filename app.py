import webbrowser
import _go_out
from flask import Flask, request, render_template

app = Flask(__name__)

survey_core_questions = {
    'price_max': '',
    'price_min': '',
    'zip_code': ''
}


@app.route("/proposal_btn", methods=["GET", "POST"])
def proposal_btn():
    return render_template('proposal.html')


@app.route("/credit_btn", methods=["GET", "POST"])
def credits_btn():
    return render_template('credits.html')


@app.route("/go_out", methods=["GET", "POST"])
def go_out():
    return render_template('go_out.html')


@app.route("/go_out_location", methods=["GET", "POST"])
def go_out_location():
    zip_code = request.form.get("zipcode")
    price_max = request.form.get("maxprice")
    price_min = request.form.get("minprice")

    print(str(f"Zip code {zip_code}") + " " + str(f"Price max {price_max}") + " " + str(f"Price min {price_min}"))

    latitude = None
    longitude = None
    city = None
    state = None
    price_range = None

    if zip_code is not None:
        location = _go_out.identify_entry(str(zip_code))
        print(str(location))
        if location is not None:
            latitude = location["latitude"]
            longitude = location["longitude"]
            city = location["city"]
            state = location["state"]
    else:
        latitude = "ERROR: PLEASE PROVIDE A VALID ZIPCODE"
        longitude = "ERROR: PLEASE PROVIDE A VALID ZIPCODE"
        city = "ERROR: PLEASE PROVIDE A VALID ZIPCODE"
        state = "ERROR: PLEASE PROVIDE A VALID ZIPCODE"

    if (price_max is not None) and (price_min is not None) and (price_max >= price_min):
        price_range = (int(price_min) * "$") + "-" + (int(price_max) * "$")
    elif price_min > price_max:
        price_max = price_min
        price_range = (int(price_min) * "$") + "-" + (int(price_max) * "$")
    else:
        price_range = "ERROR: PLEASE PROVIDE A VALID MAX AND MIN PRICE RANGE"

    survey_core_questions['zip_code'] = zip_code
    survey_core_questions['price_max'] = price_max
    survey_core_questions['price_min'] = price_min

    return render_template('go_out.html',
                           latitude=latitude,
                           longitude=longitude,
                           state=state,
                           city=city,
                           price_range=price_range)


@app.route("/dine_in_location", methods=["GET", "POST"])
def dine_in():
    return render_template('dine_in.html')


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/return_home_btn", methods=["GET", "POST"])
def return_home_btn():
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
