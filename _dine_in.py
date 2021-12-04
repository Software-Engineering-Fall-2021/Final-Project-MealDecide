import json

# Function to craft searches based on user input from survey which will be passed to search function.
# ACCEPTS: STR (meal), LIST (dish), LIST (cuisine), LIST (restrict)
# RETURNS: LIST ==> [LIST (meal_search), LIST (dish_search), LIST (cuisine_search), LIST (restrict_search)]
def craft_search(meal, dish, cuisine, restrict):
    # Initialize given strings and respective empty lists to load in for results.
    meal_search = meal
    dish_search = []
    cuisine_search = []
    restriction_search = []

    # Load in and return given search lists.
    for x in dish:
        dish_search.append(x)

    for x in cuisine:
        cuisine_search.append(x)
    
    for x in restrict:
        restriction_search.append(x)

    return [meal_search, dish_search, cuisine_search, restriction_search]

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
            cur.execute("SELECT * FROM recipe WHERE recipe_id IN (SELECT recip_id FROM recipe_by_restriction WHERE restr_id IN (SELECT restriction_id FROM Restriction WHERE label=\"" + str(restr) + "\"));")
            result = cur.fetchall()

            #  Append result to results and tracked if it isn't a repeat.
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["label"] not in tracked:
                            results.append(r)
                            tracked.append(r["label"])
    
    # Execute cuisine search query for each cuisine type given.
    elif s and (stype == "cuisine"):
       for cuisine in s:

            # Execute search for all/any (ALLAN) if "All" option is checked
            if cuisine == "ALLAN":
                cur.execute("SELECT * FROM recipe;")
                result = cur.fetchall()
                if result is not None:
                    
                    #  Append result to results and tracked if it isn't a repeat.
                    for r in result:
                        if type(r) is dict:
                            if r["label"] not in tracked:
                                results.append(r)
                                tracked.append(r["label"])
            else:
                # Execute search for cuisines given in search list.
                cur.execute("SELECT * FROM recipe WHERE recipe_id IN (SELECT recip_id FROM recipe_by_cuisine WHERE cuisi_id IN (SELECT cuisine_id FROM Cuisine WHERE category=\"" + str(cuisine) + "\"));")
                result = cur.fetchall()

                #  Append result to results and tracked if it isn't a repeat.
                if result is not None:
                    for r in result:
                        if type(r) is dict:
                            if r["label"] not in tracked:
                                results.append(r)
                                tracked.append(r["label"])
    
    # Execute price search query for meal specifications
    elif s and (stype == "meal"):
        cur.execute("SELECT * FROM recipe WHERE mealType=\"" + s + "\";")
        result = cur.fetchall()

        #  Append result to results and tracked if it isn't a repeat.
        if result is not None:
            for r in result:
                if type(r) is dict:
                    if r["label"] not in tracked:
                        results.append(r)
                        tracked.append(r["label"])

    # Execute price search query for dish specifications
    elif s and (stype == "dish"):
        for d in s:
            cur.execute("SELECT * FROM recipe WHERE dishType LIKE \"%" + str(d) + "%\";")
            result = cur.fetchall()

            #  Append result to results and tracked if it isn't a repeat.
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["label"] not in tracked:
                            results.append(r)
                            tracked.append(r["label"])

    # Execute top search query for top results given the top tracked names passed as search list
    elif s and (stype == "top"):
        for t in s:
            t = t.replace ("\"", "\\\"")
            print("SELECT * FROM recipe WHERE label=\"" + str(t) + "\";")
            cur.execute("SELECT * FROM recipe WHERE label=\"" + str(t) + "\";")
            top = cur.fetchall()
            for tt in top:
                results.append(tt)

        # Set tracked to return as the initial search
        tracked = s
        
    return [results, tracked]

# Function used to do full search based off user survey input.
# ACCEPTS: LIST (meal_search), LIST (dish_search), LIST (cuisine_search), LIST (restriction_search), CURSOR (cur)
# RETURNS: LIST ==> [ LIST (category_result for each search given in parameters), LIST (category_tracked for each search given in parameters)]
def execute_search(meal_search, dish_search, cuisine_search, restriction_search, cur):
    meal = search(meal_search, "meal", cur)
    meal_results = meal[0]
    meals_tracked = meal[1]

    dish = search(dish_search, "dish", cur)
    dish_results = dish[0]
    dishes_tracked = dish[1]

    cuisine = search(cuisine_search, "cuisine", cur)
    cuisine_results = cuisine[0]
    cuisines_tracked = cuisine[1]
    
    restriction = search(restriction_search, "restriction", cur)
    restriction_results = restriction[0]
    restrictions_tracked = restriction[1]
    
    top_tracked = find_top_recommendation(meals_tracked, dishes_tracked, cuisines_tracked, restrictions_tracked)
    top = search(top_tracked, "top", cur)
    top_results = top[0]

    results = [top_results, meal_results, dish_results, cuisine_results, restriction_results, top_tracked, meals_tracked, dishes_tracked, cuisines_tracked, restrictions_tracked]
    return results

# Function used to take input of four given result name lists and compare the contents to find top results.
# ACCEPTS: LIST (a, meals_tracked), LIST (b, dishes_tracked), LIST (c, cuisines_tracked), LIST (restrictions_tracked) 
# RETURNS: LIST (top_recommendations)
def find_top_recommendation(a, b, c, d):
    # Load lists into sets.
    s1 = set(a)
    s2 = set(b)
    s3 = set(c)
    s4 = set(d)

    # Find intersection.
    ab = s1.intersection(s2)
    ac = s1.intersection(s3)
    bc = s2.intersection(s3)
    abc = ab.intersection(s3)
    abd = ab.intersection(s4)
    abcd = abc.intersection(s4)

    # Return corresponding lists.
    if list(abcd):
        return list(abcd)
    elif list(abc):
        return list(abc)
    elif list(abd):
        return list(abd)
    elif list(ab):
        return list(ab)
    else:
        return "NONE"

# Function used to format names to pass as a parameter list to the wheel decide function.
# ACCEPTS: LIST (category_tracked, list of restaurant names)
# RETURNS: STR (CSV formatted list of restaurant names)
def format_names(names):
    csvformatted = ",".join(names)
    apostrophe = csvformatted.replace("'", "")
    ampersand = apostrophe.replace("&", "and")
    spaced = ampersand.replace(" ", "-")
    return spaced