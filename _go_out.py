import json
import _field_parsing
import _scoring

# HOW APP.py USES THIS FILE
# 1. craft_search CALLED TO PROVIDE restriction criteria (xxxxx_search(es)) BASED ON user input (parsed in app.py from form)
# 2. execute_search CALLED TO PROVIDE restaurant results and name lists (xxxx_results, xxxx_tracked) BASED ON restriction criteria FROM craft_search
# 2(a). search CALLED multiple times in execute_search TO PROVIDE restaurant results based on query input.

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
    if meal == "DESRT":
        cuisine_search.append(meal)
    if meal == "ALCOH":
        cuisine_search.append(meal)
    
    # Configure context and add it to cuisine search.
    if context == "FORMA":
        cuisine_search.append(context)
    
    # Configure speed and add it to subcategory search.
    if speed == "sit_down":
        subcategory_search.append("sit_down")
        subcategory_search.append("cafe")
    if speed == "fast_foo":
        subcategory_search.append("fast_foo")
        subcategory_search.append("cafe")
    if speed == "either":
        subcategory_search.append("fast_foo")
        subcategory_search.append("sit_down")
        subcategory_search.append("cafe")
    
    # Configure any given restrictions based on survey-taken list
    for y in restrict:
        restriction_search.append(y)

    print("RESTRICTION SEARCH: " + str(restriction_search))
    print("CUISINE SEARCH: " + str(cuisine_search))
    print("SUBCATEGORY SEARCH: " + str(subcategory_search))

    return [cuisine_search, subcategory_search, restriction_search]

# Function to execute individual queries based on search input/type and provides results and names.
# ACCEPTS: LIST (s, xxxxx_search criteria list), STR (stype, search type like restriciton, price, cuisine, or subcategory), CURSOR (cur), LIST (sparams, search parameters)
# RETURNS: LIST ==> [LIST (category_result), LIST (tracked_names of restaurants)]
def search(s, stype, cur, sparams=None):

    # Initialize empty dictionaries for results and tracked names.
    results = []
    tracked = []

    # Execute restriction search query for each restriction type given.
    if s and (stype == "restriction"):
        for restr in s:
            cur.execute("SELECT DISTINCT * FROM restaurant WHERE restaurant_id IN (SELECT restaurant_id FROM restaurant_by_restriction WHERE restriction_id IN (SELECT restriction_id FROM Restriction WHERE label=\"" + str(restr) + "\"));")
            result = cur.fetchall()

            #  Append result to results and tracked if it isn't a repeat.
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["name"] not in tracked:
                            results.append(r)
                            tracked.append(r["name"])
    
    # Execute subcategory search query for each restriction type given.
    if s and (stype == "subcategory"):
        for categ in s:
            cur.execute("SELECT DISTINCT * FROM restaurant WHERE subcategory=\"" + str(categ) + "\";")
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
                cur.execute("SELECT DISTINCT * FROM restaurant WHERE restaurant_id IN (SELECT DISTINCT restaurant_id FROM restaurant_by_cuisine WHERE cuisine_id IN (SELECT cuisine_id FROM Cuisine WHERE category=\"" + str(cuisine) + "\"));")
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
        cur.execute("SELECT DISTINCT * FROM restaurant WHERE price_level=\"" + str((int(sparams[0]) * "$")) + "\";")
        result = cur.fetchall()
        #  Append result to results and tracked if it isn't a repeat.
        if result is not None:
            for r in result:
                if type(r) is dict:
                    if r["name"] not in tracked:
                        results.append(r)
                        tracked.append(r["name"])
        # Searches based off of maximum bound.
        cur.execute("SELECT DISTINCT * FROM restaurant WHERE price_level LIKE \"% - " + str((int(sparams[1]) * "$")) + "\";")
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
            cur.execute("SELECT DISTINCT * FROM restaurant WHERE name=\"" + t + "\";")
            top = cur.fetchall()
            for tt in top:
                results.append(tt)

        # Set tracked to return as the initial search
        tracked = s
        
    return [results, tracked]

# Function used to do full search based off user survey input.
# ACCEPTS: LIST (cuisine_search), LIST (subcategory_search), LIST (restriction_search), STR
#     (price_min), STR (price_max), CURSOR (cur)
# RETURNS: LIST ==> [ LIST (cuisine_results), LIST (top_results), LIST (cuisines_tracked), LIST (top_tracked)]
def execute_search(cuisine_search, subcategory_search, restriction_search, price_min, price_max, cur):
    
    # Obtain Price Criteria
    pmin, pmax = _field_parsing.convert_price_to_int(price_min + price_max)

    # Obtain and score cuisine results.
    cuisine = search(cuisine_search, "cuisine", cur)
    cuisine_untracked = cuisine[0]
    ccuisine_scored = _scoring.score_cuisine(cuisine_untracked, cuisine_search)
    cprice_scored = _scoring.score_price(ccuisine_scored, pmin, pmax)
    crestriction_scored = _scoring.score_restriction(cprice_scored, restriction_search)
    cuisine_results = _scoring.score_subcategory(crestriction_scored, subcategory_search)    
    cuisines_tracked = cuisine[1] # List of restaurant names, not full result entries.

    # Obtain subcategory name list.
    subcategory = search(subcategory_search, "subcategory", cur)
    subcategory_tracked = subcategory[1] # List of restaurant names, not full result entries.

    # Obtain restriction name list.
    restriction = search(restriction_search, "restriction", cur)
    restrictions_tracked = restriction[1] # List of restaurant names, not full result entries.
    
    # Obtain price name list.
    price = search(cuisine_search, "price", cur, [price_min, price_max])
    prices_tracked = price[1] # List of restaurant names, not full result entries.
    
    # Find top recommendations based on all combined name lists.
    top_tracked = _scoring.find_top_recommendation(cuisines_tracked, subcategory_tracked, prices_tracked, restrictions_tracked)
    if top_tracked != "NONE": # If results are found, execute query and store results.
        top = search(top_tracked, "top", cur)
        top_untracked = top[0]
        cuisine_scored = _scoring.score_cuisine(top_untracked, cuisine_search)
        price_scored = _scoring.score_price(cuisine_scored, pmin, pmax)
        restriction_scored = _scoring.score_restriction(price_scored, restriction_search)
        top_results = _scoring.score_subcategory(restriction_scored, subcategory_search)

    results = [cuisine_results, top_results, cuisines_tracked, top_tracked]
    return results

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
