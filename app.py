import webbrowser
import _go_out
from flask import Flask, request, render_template
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'mealadmin@mealdecide'
app.config['MYSQL_DATABASE_PASSWORD'] = 'SoftwareEngineering2021!'
app.config['MYSQL_DATABASE_HOST'] = 'mealdecide.mysql.database.azure.com'
mysql.init_app(app)
conn = mysql.connect()
cursor =conn.cursor()
cursor.execute("USE mealdecide;")


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

    price_range = None

    price_max = request.form.get("maxprice")
    price_min = request.form.get("minprice")
    meal = request.form.get("meal")
    context = request.form.get("context")
    speed = request.form.get("speed")
    cuisine = request.form.getlist("cuisine")
    restrict = request.form.getlist("restrictions")

    print(str(f"meal {meal}") + " " + str(f"context {context}") + " " + str(f"speed {speed}") + " " + str(f"cuisine {str(cuisine)}") + " " + str(f"restrictions {str(restrict)}") + " " + str(f"Price max {price_max}") + " " + str(f"Price min {price_min}"))

    if (price_max is not None) and (price_min is not None) and (price_max >= price_min):
        price_range = (int(price_min) * "$") + " - " + (int(price_max) * "$")
    elif price_min > price_max:
        price_max = price_min
        price_range = (int(price_min) * "$") + " - " + (int(price_max) * "$")
    else:
        price_range = "ERROR: PLEASE PROVIDE A VALID MAX AND MIN PRICE RANGE"

    survey_core_questions['price_max'] = (int(price_max) * "$")
    survey_core_questions['price_min'] = (int(price_min) * "$")
    survey_core_questions['price_range'] = price_range

    cuisine_search = []
    subcategory_search = []
    restriction_search = []

    
    for x in cuisine:
        cuisine_search.append(x)

    if meal == "BREAK":
        cuisine_search.append(meal)
        cuisine_search.append('AMERI')
    elif meal == "DESRT":
        cuisine_search.append(meal)
    elif meal == "ALCOH":
        cuisine_search.append(meal)
    
    if context == "FORMA":
        cuisine_search.append(context)
    if context == "CASUA":
        cuisine_search.append(context)
    
    if speed == "SITDW":
        subcategory_search.append("sit_down")
        subcategory_search.append("cafe")
    if speed == "FSTFD":
        subcategory_search.append("fast_foo")
        subcategory_search.append("cafe")
    
    for y in restrict:
        restriction_search.append(y)

    print("RESTRICTION SEARCH: " + str(restriction_search))
    print("CUISINE SEARCH: " + str(cuisine_search))
    print("SUBCATEGORY SEARCH: " + str(subcategory_search))
    

    restriction_results = []
    if restriction_search:
        for restr in restriction_search:
            cursor.execute("SELECT * FROM restaurant WHERE restaurant_id IN (SELECT resta_id FROM restaurant_by_restriction WHERE restr_id IN (SELECT restriction_id FROM Restriction WHERE label=\"" + str(restr) + "\"));")
            result = cursor.fetchall()
            if result is not None:
                restriction_results.append(result)

    cuisine_results = []
    for cuisine in cuisine_search:
        if cuisine == "ALLAN":
            cursor.execute("SELECT * FROM restaurant;")
            result = cursor.fetchall()
            print(str(result))
            if result is not None:
                cuisine_results.append(result)
                break
        else:
            cursor.execute("SELECT * FROM restaurant WHERE restaurant_id IN (SELECT rest_id FROM restaurant_by_cuisine WHERE cuisi_id IN (SELECT cuisine_id FROM Cuisine WHERE category=\"" + str(cuisine) + "\"));")
            result = cursor.fetchall()
            if result is not None:
                cuisine_results.append(result)
    
    subcategory_results = []
    for subcat in subcategory_search:
        cursor.execute("SELECT * FROM restaurant WHERE subcategory=\"" + str(subcat) + "\";")
        result = cursor.fetchall()
        if result is not None:
            subcategory_results.append(result)
    
    price_results = []
    cursor.execute("SELECT * FROM restaurant WHERE price_level LIKE \"" + str((int(price_min) * "$")) + "%\";")
    result = cursor.fetchall()
    if result is not None:
        price_results.append(result)
    print("SELECT * FROM restaurant WHERE price_level LIKE \"%" + str((int(price_max) * "$")) + "\";")
    cursor.execute("SELECT * FROM restaurant WHERE price_level LIKE \"%" + str((int(price_max) * "$")) + "\";")
    result = cursor.fetchall()
    if result is not None:
        price_results.append(result)
    
    print(str(subcategory_results))
    print(str(price_results))
    print(str(cuisine_results))
    print(str(restriction_results))

    if not restriction_results:
        restriction_results = []
        survey_core_questions['restriction_results'] = restriction_results
    else:
        survey_core_questions['restriction_results'] = restriction_results

    survey_core_questions['cuisine_results'] = cuisine_results
    survey_core_questions['subcategory_results'] = subcategory_results
    survey_core_questions['price_results'] = price_results    
    return render_template('go_out_results.html',
                           cuisine_results = cuisine_results,
                           price_results = price_results,
                           subcategory_results = subcategory_results,
                           restriction_results = restriction_results)


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
