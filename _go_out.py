import json

# DEFUNCT: Identifies latitude and longitude of zipcode entries for api-based requests.
def identify_entry(zip):
    if zip[0] == "0":
        zip = zip[1:]
    zip = int(zip)

    with open("./static/USCities.json", "r") as geoinfo:
        g = json.load(geoinfo)

    for entry in g:
        if entry['zip_code'] == zip:
            return entry
            break
# DEFUNCT: Identifies latitude and longitude of zipcode entries for api-based requests.
def get_lat_lon(entry):
    lat = entry["latitude"]
    lon = entry["longitude"]
    return {"latitude": lat, "longtiude": lon}

# Function to check if the price max is greater than price min, ensuring input is correct.
# ACCEPTS: INT (price_max), INT (price_min)
# RETURNS: LIST (price_range) ==> [BOOL (indicates success), STR (price_range)]
def check_price(price_max, price_min):
    
    # Check to ensure price max and min are set, as well as if max is greater than or equal to min.
    if (price_max is not None) and (price_min is not None) and (price_max >= price_min):

        # Convert int input to string used in query... eg 1-4 becomes $-$$$$
        price_range = (int(price_min) * "$") + " - " + (int(price_max) * "$")
        return [True, price_range]
    else:
        # Set error which will be appended to warnings and prevent invalid min-max from being passed.
        price_range = "ERROR: PLEASE PROVIDE A VALID MAX AND MIN PRICE RANGE"
        return [False, price_range]

# Function to craft searches based on user input from survey which will be passed to search function.
# ACCEPTS: LIST (cuisine), STR (meal), STR (context), STR (speed), LIST (restrict)
# RETURNS: LIST ==> [LIST (cuisine_search), LIST (subcategory_search), LIST (restriction_search)]
def craft_search(cuisine, meal, context, speed, restrict):
    
    # Initialize empty lists for search terms.
    cuisine_search = []
    subcategory_search = []
    restriction_search = []

    # Breakfast and dessert are their own categories, if those are not selected - add the given
    # cuisine selections.
    if meal != "BREAK" and meal != "DESRT":
        for x in cuisine:
            cuisine_search.append(x)

    # Configure cuisine based on meal selection.
    if meal == "BREAK":
        cuisine_search.append(meal)
    elif meal == "DESRT":
        cuisine_search.append(meal)
    elif meal == "ALCOH":
        cuisine_search.append(meal)
    
    # Configure context and add it to cuisine search.
    if context == "FORMA":
        cuisine_search.append(context)
    if context == "CASUA":
        cuisine_search.append(context)
    
    # Configure speed and add it to subcategory search.
    if speed == "SITDW":
        subcategory_search.append("sit_down")
        subcategory_search.append("cafe")
    if speed == "FSTFD":
        subcategory_search.append("fast_foo")
        subcategory_search.append("cafe")
    
    # Configure any given restrictions based on survey-taken list
    for y in restrict:
        restriction_search.append(y)

    print("RESTRICTION SEARCH: " + str(restriction_search))
    print("CUISINE SEARCH: " + str(cuisine_search))
    print("SUBCATEGORY SEARCH: " + str(subcategory_search))

    return [cuisine_search, subcategory_search, restriction_search]

# Function to execute individual queries based on search input/type and provides results and names.
# ACCEPTS: LIST (s, category_search), STR (stype, search type), CURSOR (cur), LIST (sparams, search parameters)
# RETURNS: LIST ==> [LIST (category_result), LIST (tracked_names of restaurants)]
def search(s, stype, cur, sparams=None):

    # Initialize empty dictionaries for results and tracked names.
    results = []
    tracked = []

    # Execute restriction search query for each restriction type given.
    if s and (stype == "restriction"):
        for restr in s:
            cur.execute("SELECT * FROM restaurant WHERE restaurant_id IN (SELECT resta_id FROM restaurant_by_restriction WHERE restr_id IN (SELECT restriction_id FROM Restriction WHERE label=\"" + str(restr) + "\"));")
            result = cur.fetchall()

            #  Append result to results and tracked if it isn't a repeat.
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["name"] not in tracked:
                            results.append(r)
                            tracked.append(r["name"])
    
    # Execute cuisine search query for each cuisine type given.
    elif s and (stype == "cuisine"):
        for cuisine in s:
            # Execute search for all/any (ALLAN) if "All" option is checked
            if cuisine == "ALLAN":
                cur.execute("SELECT * FROM restaurant;")
                result = cur.fetchall()
                
                #  Append result to results and tracked if it isn't a repeat.
                if result is not None:
                    for r in result:
                        if type(r) is dict:
                            if r["name"] not in tracked:
                                results.append(r)
                                tracked.append(r["name"])
            
            # Execute search for cuisines given in search list.
            else:
                cur.execute("SELECT * FROM restaurant WHERE restaurant_id IN (SELECT rest_id FROM restaurant_by_cuisine WHERE cuisi_id IN (SELECT cuisine_id FROM Cuisine WHERE category=\"" + str(cuisine) + "\"));")
                result = cur.fetchall()
                #  Append result to results and tracked if it isn't a repeat.
                if result is not None:
                    for r in result:
                        if type(r) is dict:
                            if r["name"] not in tracked:
                                results.append(r)
                                tracked.append(r["name"])
    
    # Execute price search query for price specifications given in sparams (min is index 0, max is index 1)
    elif sparams and (stype == "price"):
        
        # Searches based off of minimum bound.
        cur.execute("SELECT * FROM restaurant WHERE price_level=\"" + str((int(sparams[0]) * "$")) + "\";")
        result = cur.fetchall()
        #  Append result to results and tracked if it isn't a repeat.
        if result is not None:
            for r in result:
                if type(r) is dict:
                    if r["name"] not in tracked:
                        results.append(r)
                        tracked.append(r["name"])
        # Searches based off of maximum bound.
        cur.execute("SELECT * FROM restaurant WHERE price_level LIKE \"% - " + str((int(sparams[1]) * "$")) + "\";")
        result = cur.fetchall()

        #  Append result to results and tracked if it isn't a repeat.
        if result is not None:
            for r in result:
                if type(r) is dict:
                    if r["name"] not in tracked:
                        results.append(r)
                        tracked.append(r["name"])
    
    # Execute top search query for top results given the top tracked names passed as search list
    elif s and (stype == "top"):
        for t in s:
            cur.execute("SELECT * FROM restaurant WHERE name=\"" + t + "\";")
            top = cur.fetchall()
            for tt in top:
                results.append(tt)

        # Set tracked to return as the initial search
        tracked = s
        
    return [results, tracked]

# Function used to do full search based off user survey input.
# ACCEPTS: LIST (cuisine_search), LIST (subcategory_search), LIST (restriction_search), STR
#     (price_min), STR (price_max), CURSOR (cur)
# RETURNS: LIST ==> [ LIST (cuisine_results), LIST (top_results), LIST (restriction_results), LIST (price_results),
#     LIST (cuisines_tracked), LIST (top_tracked), LIST (restrictions_tracked), LIST (prices_tracked)]
def execute_search(cuisine_search, subcategory_search, restriction_search, price_min, price_max, cur):
    restriction = search(restriction_search, "restriction", cur)
    restriction_results = restriction[0]
    restrictions_tracked = restriction[1]

    cuisine = search(cuisine_search, "cuisine", cur)
    cuisine_results = cuisine[0]
    cuisines_tracked = cuisine[1]

    price = search(cuisine_search, "price", cur, [price_min, price_max])
    price_results = price[0]
    prices_tracked = price[1]
    
    top_tracked = find_top_recommendation(cuisines_tracked, prices_tracked, restrictions_tracked)
    top = search(top_tracked, "top", cur)
    top_results = top[0]
    
    results = [cuisine_results, top_results, restriction_results, price_results, cuisines_tracked, top_tracked, restrictions_tracked, prices_tracked]
    return results

# Function used to take input of three given result name lists and compare the contents to find top results.
# ACCEPTS: LIST (a, cuisines_tracked), LIST (b, prices_tracked), LIST (c, restrictions_tracked) 
# RETURNS: LIST (top_recommendations)
def find_top_recommendation(a, b, c):
    # Load lists into sets.
    s1 = set(a)
    s2 = set(b)
    s3 = set(c)

    # Find intersection.
    ab = s1.intersection(s2)
    ac = s1.intersection(s3)
    bc = s2.intersection(s3)
    abc = ab.intersection(s3)

    # Return combined list of non-empty sets. Prioritized cuisine and restrictions if there are none
    # with all three. If there are no restrictions, return cuisine and price-based results.
    if list(abc):
        return list(abc)
    elif list(ac):
        return list(ac)
    elif list(ab):
        return list(ab)
    elif list(bc):
        return list(bc)
    else:
        return "NONE"

# Function used to load restaurant contact information.
# ACCEPTS: INT (rest_id, restaurant identification number), CURSOR (cur)
# RETURNS: LIST (contact_results)
def contact_info(rest_id, cur):
    contact_results = []
    print("SELECT * FROM contact WHERE restaurant_id=" + str(rest_id) + ";")
    cur.execute("SELECT * FROM contact WHERE restaurant_id=" + str(rest_id) + ";")
    result = cur.fetchall()
    if result is not None:
        contact_results.append(result)
    return contact_results

# Function used to format names to pass as a parameter list to the wheel decide function.
# ACCEPTS: LIST (category_tracked, list of restaurant names)
# RETURNS: STR (CSV formatted list of restaurant names)
def format_names(names):
    csvformatted = ",".join(names)
    apostrophe = csvformatted.replace("'", "")
    ampersand = apostrophe.replace("&", "and")
    spaced = ampersand.replace(" ", "-")
    return spaced