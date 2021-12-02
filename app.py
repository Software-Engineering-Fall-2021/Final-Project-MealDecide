from re import search
import webbrowser
import _go_out
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
    subcategory_results = results[1]
    restriction_results = results[2]
    price_results = results[3]

    if not restriction_results:
        restriction_results = []
        survey_core_questions['restriction_results'] = restriction_results
    else:
        survey_core_questions['restriction_results'] = restriction_results

    survey_core_questions['cuisine_results'] = cuisine_results
    survey_core_questions['subcategory_results'] = subcategory_results
    survey_core_questions['price_results'] = price_results
    curs.close()
    return render_template('go_out_results.html',
                           cuisine_results=cuisine_results,
                           price_results=price_results,
                           subcategory_results=subcategory_results,
                           restriction_results=restriction_results)


@app.route("/dine_in_location", methods=["GET", "POST"])
def dine_in():
    return render_template('dine_in.html')


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
