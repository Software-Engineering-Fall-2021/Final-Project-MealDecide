import _field_parsing

# Hey there you poor soul, if you've made it this far - you've obviously encountered a problem with scoring restaurants.
# This part was written fairly quickly and can be very fidget-y if something is passed or accepted wrong.
# I wish you the best of luck and I hope my comments help... maybe.

# Function used to score a list of restaurant results by a provided price criteria.
# ACCEPTS: LIST (cr, "current results" list of results like top_results or cuisine results), INT (pmin, this is criteria minimum provided by the user), INT (pmax, this is criteria maximum provided by the user)
# RETURNS: LIST (cr_updated, updated version of "current results" which contains scored results)
def score_price(cr, pmin, pmax):
    cr_updated = [] # This will contain the final list of scored restaurants.

    for result in cr: # For the current restaurant in the current set of results..
        p_score = 0

        # Determine the price level of the current restaurant and set that accordingly.
        cr_min, cr_max = _field_parsing.convert_price_to_int(result["price_level"])

        # Compare to see if the current restaurant minimum and maximum are within the bounds of the provided min and max.
        if (cr_min >= pmin):
            p_score = p_score + 1
        if (cr_max <= pmax):
            p_score = p_score + 1
        
        # Try to see if you can set or update score in case you run in to a key error, set score. THIS IS A FIDGET-Y PART!
        try:
            if result["score"]: # If you want to see if you can shrink this during refactoring, remove the if/else.
                current = result["score"]
                updated = current + p_score
                result["score"] = updated 
                cr_updated.append(result) # Add the result with updated score
            else:
                current = result["score"]
                updated = current + p_score
                result["score"] = updated
                cr_updated.append(result) # Add the result with updated score
        except KeyError:
            result["score"] = p_score
            cr_updated.append(result) # Add the result with updated score

    return cr_updated # Return the updated score list

# Function used to score a list of restaurant results by a provided subcategory (fast_foo, sit_down, or cafe) criteria.
# ACCEPTS: LIST (cr, "current results" list of results like top_results or cuisine results), INT (pmin, this is criteria minimum provided by the user), INT (pmax, this is criteria maximum provided by the user)
# RETURNS: LIST (cr_updated, updated version of "current results" which contains scored results)
def score_subcategory(cr, criteria):
    cr_updated = []

    for result in cr:
        sc_score = 0

        subcategory = result["subcategory"]
        if (subcategory == "sit_down") and (criteria == "sit_down"):
            sc_score = sc_score + 1
        if (subcategory == "fast_foo") and (criteria == "fast_foo"):
            sc_score = sc_score + 1
        
        try:
            if result["score"]:
                current = result["score"]
                updated = current + sc_score
                result["score"] = updated
                cr_updated.append(result)
            else:
                current = result["score"]
                updated = current + sc_score
                result["score"] = updated
                cr_updated.append(result)
        except KeyError:
            result["score"] = sc_score
            cr_updated.append(result)

    return cr_updated

def score_restriction(cr, criteria):
    cr_updated = []

    for result in cr:
        r_score = 0
        if result["restriction_description"]:
            restrictions = result["restriction_description"].split(", ")
        else:
            restrictions = []

        for r in restrictions:
            if (r == "Vegan") and ("Vegan" in criteria):
                r_score = r_score + 1
            if (r == "Vegetarian") and ("Vegetarian" in criteria):
                r_score = r_score + 1
            if (r == "Gluten-Free") and ("Gluten-Free" in criteria):
                r_score = r_score + 1
            
        try:
            if result["score"]:
                current = result["score"]
                updated = current + r_score
                result["score"] = updated
                cr_updated.append(result)
            else:
                current = result["score"]
                updated = current + r_score
                result["score"] = updated
                cr_updated.append(result)
        except KeyError:
            result["score"] = r_score
            cr_updated.append(result)

    return cr_updated

def score_cuisine(cr, criteria):
    cr_updated = []

    CASUA = ["Cafe", "Diner", "Deli", "Fast Food", "Grill", "Paninis", "Pretzel", "Sandwiches", "Soups", "Wings"]
    ITALI = ["Pizza", "Italian"]
    BREAK = ["Pancakes", "Waffles", "American", "Diner", "Cafe"]
    ALCOH = ["Bar", "Beer restaurants", "Brew Pub", "Gastropub", "Pub", "Wine Bar"]
    LATIN = ["Burrito", "Latin", "Mexican", "Spanish"]
    ASIAN = ["Asian", "Thai"]
    JAPAN = ["Japanese", "Sushi"]
    CHINA = ["Chinese"]
    FORMA = ["Sushi", "Contemporary", "Stakehouse"]
    INATL = ["African", "Arabic", "Central European", "Eastern European", "European", "International", "Scottish", "Polish"]
    SEAFO = ["Seafood"]
    AMERI = ["American", "Barbecue", "Burgers", "Cheeseburger"]
    DESRT = ["Cake", "Ice Cream"]
    FRANC = ["French"]
    MEDET = ["Greek", "Gyros", "Mediterranean"]
    POLIS = ["Polish"]

    tagged = { "CASUA": CASUA, "ITALI": ITALI, "BREAK": BREAK, "ALCOH": ALCOH, "LATIN": LATIN, "INATL": ASIAN + POLIS + INATL, "MEDET": MEDET, "JAPAN": JAPAN, "CHINA": CHINA, "FORMA": FORMA, "FRANC": FRANC, "AMERI": AMERI, "SEAFO": SEAFO, "DESRT": DESRT }

    for result in cr:
        c_score = 0
        if result["cuisine_description"]:
            cuisines = result["cuisine_description"].split(", ")
        else:
            cuisines = []

        if "ALLAN" not in cuisines:
            for c in cuisines:
                if c in CASUA and "CASUA" in criteria:
                    c_score = c_score + 1
                if c in ITALI and "ITALI" in criteria:
                    c_score = c_score + 1
                if c in BREAK and "BREAK" in criteria:
                    if ("Fast Food" not in cuisines) and ("Bar" not in cuisines) and ("Steakhouse" not in cuisines) and ("Pub" not in cuisines) and ("Contemporary" not in cuisines) and ("Barbecue" not in cuisines):
                        c_score = c_score + 1
                    elif ("Bar" in cuisines) or ("Steakhouse" in cuisines) or ("Pub" in cuisines) or ("Contemporary" in cuisines) or ("Barbecue" in cuisines):
                        c_score = c_score - 2
                if c in ALCOH and "ALCOH" in criteria:
                    c_score = c_score + 1
                if c in LATIN and "LATIN" in criteria:
                    c_score = c_score + 1
                if c in ASIAN and "ASIAN" in criteria:
                    c_score = c_score + 1
                if c in JAPAN and "JAPAN" in criteria:
                    c_score = c_score + 1
                if c in CHINA and "CHINA" in criteria:
                    c_score = c_score + 1
                if c in FORMA and "FORMA" in criteria:
                    c_score = c_score + 1
                if c in INATL and "INATL" in criteria:
                    c_score = c_score + 1
                if c in SEAFO and "SEAFO" in criteria:
                    c_score = c_score + 1
                if c in AMERI and "AMERI" in criteria:
                    c_score = c_score + 1
        else:
                c_score = c_score + 1

        
        try:
            if result["score"]:
                current = result["score"]
                updated = current + c_score
                result["score"] = updated
                cr_updated.append(result)
        except KeyError:
            result["score"] = c_score
            cr_updated.append(result)

    return cr_updated

# Function used to take input of three given result name lists and compare the contents to find top results.
# ACCEPTS: LIST (a, cuisines_tracked), LIST (b, prices_tracked), LIST (c, restrictions_tracked) 
# RETURNS: LIST (top_recommendations)
def find_top_recommendation(a, b, c, d):
    initial_lists = [a, b, c, d]
    all_lists = []
    subset_list = []

    for l in initial_lists:
        if len(l) > 5:
            all_lists.append(l)
        else:
            subset_list = subset_list + l

    if subset_list:
        total = all_lists.append(subset_list)
    else:
        total = all_lists

    # Find intersection.
    top = []
    top_alt = []

    if total:
        top = set.intersection(*map(set,total))
    else:
        top = []

    print(str(len(top)))
    if (not top) or (len(top) < 10):
        print("Made it in")
        top_alt = set.intersection(*map(set,all_lists))

    if (not top_alt) or (len(top_alt) < 10):
        print("Results are Narrow, defaulting to cuisines")
        top = a
        #for l in initial_lists:
         #   for rest in l:
          #      if (rest not in top) and (len(top) < 20):
           #         top.append(rest)

    # Return combined list of non-empty sets. Prioritized cuisine and restrictions if there are none
    # with all three. If there are no restrictions, return cuisine and price-based results.
    if top:
        return top
    elif top_alt:
        return top_alt
    else:
        return "NONE"