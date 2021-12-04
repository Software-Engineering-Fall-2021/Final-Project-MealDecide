from re import search
import webbrowser
from math import ceil
from random import sample
import _go_out
import _dine_in
from flask import Flask, request, render_template
from flaskext.mysql import MySQL
from pymysql.cursors import DictCursor

app = Flask(__name__)
mysql = MySQL(cursorclass=DictCursor)
app.config['MYSQL_DATABASE_USER'] = 'mealadmin@mealdecide'
app.config['MYSQL_DATABASE_PASSWORD'] = 'SoftwareEngineering2021!'
app.config['MYSQL_DATABASE_HOST'] = 'mealdecide.mysql.database.azure.com'
mysql.init_app(app)

survey_core_questions = {
    'price_max': '',
    'price_min': '',
    'zip_code': ''
}

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/proposal_btn", methods=["GET", "POST"])
def proposal_btn():
    return render_template('proposal.html')


@app.route("/credit_btn", methods=["GET", "POST"])
def credits_btn():
    return render_template('credits.html')


@app.route("/go_out", methods=["GET", "POST"])
def go_out():
    return render_template('go_out.html')


@app.route("/go_out_contact", methods=["GET", "POST"])
def go_out_contact():
    warnings = []

    # Retrieve the request form information and load them into respective variables.
    restaurant_id = request.form.get("rest_id")
    name = request.form.get("name")

    curs = mysql.connect().cursor()
    curs.execute("USE mealdecide;")

    contact = _go_out.contact_info(restaurant_id, curs)

    survey_core_questions['contact'] = contact
    survey_core_questions['name'] = name

    return render_template('go_out_contact.html',
                           contact=contact,
                           name=name)


@app.route("/go_out_location", methods=["GET", "POST"])
def go_out_location():
    # Initialize potential warnings to pass and set price range to none.
    warnings = []
    price_range = None

    # Retrieve the request form information and load them into respective variables.
    price_max = request.form.get("maxprice")
    price_min = request.form.get("minprice")
    meal = request.form.get("meal")
    context = request.form.get("context")
    speed = request.form.get("speed")
    cuisine = request.form.getlist("cuisine")
    restrict = request.form.getlist("restrictions")

    # Print to check output.
    print(str(f"Meal: {meal}") + " " + str(f"|| Context: {context}") + " " + str(f"|| Speed {speed}") + " " + str(
        f"|| Cuisine {str(cuisine)}") + " " + str(f"|| Restrictions {str(restrict)}") + " " + str(
        f"Price max {price_max}") + " " + str(f"Price min {price_min}"))

    # Check the price input and set the range, append a warning if the max and min price input are not valid.
    price_result = _go_out.check_price(price_max, price_min)
    if price_result[0]:
        price_range = price_result[1]
    else:
        warnings.append(price_result)
        return render_template('go_out_warning.html',
                               warnings=warnings)

    # Set survey core questions for price-related info.
    survey_core_questions['price_max'] = (int(price_max) * "$")
    survey_core_questions['price_min'] = (int(price_min) * "$")
    survey_core_questions['price_range'] = price_range

    # Craft and return search fields to be passed in to queries.
    search = _go_out.craft_search(cuisine, meal, context, speed, restrict)
    cuisine_search = search[0]
    subcategory_search = search[1]
    restriction_search = search[2]

    # Open connection
    curs = mysql.connect().cursor()
    curs.execute("USE mealdecide;")

    # Execute search queries based on user-given criteria.
    results = _go_out.execute_search(cuisine_search, subcategory_search, restriction_search, price_min, price_max, curs)
    cuisine_results = results[0]
    top_results = results[1]
    restriction_results = results[2]
    price_results = results[3]
    cuisine_names = ",".join(results[4])
    cuisine_names = cuisine_names.replace(" ", "-")
    print(cuisine_names)
    top_names = ",".join(results[5])
    top_names = top_names.replace(" ", "-")
    print(top_names)
    restriction_names = ",".join(results[6])
    restriction_names = restriction_names.replace(" ", "-")
    print(restriction_names)
    price_names = ",".join(results[7])
    price_names = price_names.replace(" ", "-")
    print(price_names)

    # Check if restriction_results exists.
    if not restriction_results:
        restriction_results = []
        survey_core_questions['restriction_results'] = restriction_results
    else:
        survey_core_questions['restriction_results'] = restriction_results
    
    survey_core_questions['cuisine_results'] = cuisine_results
    survey_core_questions['top_results'] = top_results
    survey_core_questions['price_results'] = price_results    
    curs.close()

    # Generate name list for each output table to pass to random wheel.
    survey_core_questions['price_names'] = price_names
    survey_core_questions['restriction_names'] = restriction_names
    survey_core_questions['cuisine_names'] = cuisine_names
    survey_core_questions['top_names'] = top_names


    return render_template('go_out_results.html',
                           cuisine_results = cuisine_results,
                           price_results = price_results,
                           top_results = top_results,
                           restriction_results = restriction_results,
                           restriction_names = restriction_names,
                           cuisine_names = cuisine_names,
                           price_names = price_names,
                           top_names = top_names)

@app.route("/go_out_random", methods=["GET", "POST"])
def go_out_random():
    warnings = []

    # Retrieve the request form information and load them into respective variables.
    restaurants = request.form.get("restaurants")
    print(restaurants)
    for r in restaurants:
        r.replace(",", "-")
        r.replace("'", "-")
    choices = restaurants.split(",")
    print(str(choices))
    url_base = "https://pickerwheel.com/emb?choices="

    randset = sample(choices, ceil(len(choices)/2))
    print("HERE IS RANDSET:" + str(randset))
    choices = ",".join(randset)
    random_reference = url_base + choices

    survey_core_questions['random_reference'] = random_reference
    return render_template('go_out_random.html',
                           random_reference = random_reference)

@app.route("/dine_in", methods=["GET", "POST"])
def dine_in():
    return render_template('dine_in.html')

@app.route("/dine_in_recipe", methods=["GET", "POST"])
def dine_in_recipe():
    # Initialize potential warnings to pass and set price range to none.
    warnings = []

    # Retrieve the request form information and load them into respective variables.
    meal = request.form.get("meal")
    dish = request.form.getlist("dish")
    cuisine = request.form.getlist("cuisine")
    restrict = request.form.getlist("restrictions")

    # Craft and return search fields to be passed in to queries.
    search = _dine_in.craft_search(meal, dish, cuisine, restrict)
    meal_search = search[0]
    dish_search = search[1]
    cuisine_search = search[2]
    restriction_search = search[3]

    # Open connection
    curs = mysql.connect().cursor()
    curs.execute("USE mealdecide;")

    # Execute search queries based on user-given criteria.
    results = _dine_in.execute_search(meal_search, dish_search, cuisine_search, restriction_search, curs)
    top_results = results[0]
    meal_results = results[1]
    dish_results = results[2]
    cuisine_results = results[3]
    restriction_results = results[4]
    top_names = ",".join(results[5])
    top_names = top_names.replace(" ", "-")
    meal_names = ",".join(results[6])
    meal_names = meal_names.replace(" ", "-")
    dish_names = ",".join(results[7])
    dish_names = dish_names.replace(" ", "-")
    cuisine_names = ",".join(results[8])
    cuisine_names = cuisine_names.replace(" ", "-")
    restriction_names = ",".join(results[9])
    restriction_names = restriction_names.replace(" ", "-")
    
    survey_core_questions['top_results'] = top_results
    survey_core_questions['dish_results'] = dish_results
    survey_core_questions['cuisine_results'] = cuisine_results

    # Check if restriction_results exists.
    if not restriction_results:
        restriction_results = []
        survey_core_questions['restriction_results'] = restriction_results
    else:
        survey_core_questions['restriction_results'] = restriction_results
    
    curs.close()

    # Generate name list for each output table to pass to random wheel.
    survey_core_questions['dish_names'] = dish_names
    survey_core_questions['restriction_names'] = restriction_names
    survey_core_questions['cuisine_names'] = cuisine_names
    survey_core_questions['top_names'] = top_names


    return render_template('dine_in_results.html',
                           cuisine_results = cuisine_results,
                           dish_results = dish_results,
                           top_results = top_results,
                           restriction_results = restriction_results,
                           restriction_names = restriction_names,
                           cuisine_names = cuisine_names,
                           dish_names = dish_names,
                           top_names = top_names)



@app.route("/return_home_btn", methods=["GET", "POST"])
def return_home_btn():
    return render_template("index.html")


@app.route("/server_app", methods=["GET", "POST"])
def server_app():
    # right now there aren't any back end functions so this will be empty
    return render_template('index.html')


if __name__ == '__main__':
    webbrowser.open("http://127.0.0.1:5001")
    app.run(host="127.0.0.1", port=5001)
