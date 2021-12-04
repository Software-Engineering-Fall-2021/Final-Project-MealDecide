import json

def craft_search(meal, dish, cuisine, restrict):
    meal_search = meal
    dish_search = []
    cuisine_search = []
    restriction_search = []

    for x in dish:
        dish_search.append(x)

    for x in cuisine:
        cuisine_search.append(x)
    
    for x in restrict:
        restriction_search.append(x)

    return [meal_search, dish_search, cuisine_search, restriction_search]

def execute_search(meal_search, dish_search, cuisine_search, restriction_search, cur):
    meal_results = []
    meals_tracked = []
    if meal_search:
        cur.execute("SELECT * FROM recipe WHERE mealType=\"" + meal_search + "\";")
        result = cur.fetchall()
        if result is not None:
            for r in result:
                if type(r) is dict:
                    if r["label"] not in meals_tracked:
                        meal_results.append(r)
                        meals_tracked.append(r["label"])
    
    dish_results = []
    dishes_tracked = []
    if dish_search:
        for d in dish_search:
            cur.execute("SELECT * FROM recipe WHERE dishType LIKE \"%" + str(d) + "%\";")
            result = cur.fetchall()
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["label"] not in dishes_tracked:
                            dish_results.append(r)
                            dishes_tracked.append(r["label"])

    cuisine_results = []
    cuisines_tracked = []
    for cuisine in cuisine_search:
        if cuisine == "ALLAN":
            cur.execute("SELECT * FROM recipe;")
            result = cur.fetchall()
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["label"] not in cuisines_tracked:
                            cuisine_results.append(r)
                            cuisines_tracked.append(r["label"])
        else:
            cur.execute("SELECT * FROM recipe WHERE recipe_id IN (SELECT recip_id FROM recipe_by_cuisine WHERE cuisi_id IN (SELECT cuisine_id FROM Cuisine WHERE category=\"" + str(cuisine) + "\"));")
            result = cur.fetchall()
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["label"] not in cuisines_tracked:
                            cuisine_results.append(r)
                            cuisines_tracked.append(r["label"])
    
    restriction_results = []
    restrictions_tracked = []
    if restriction_search:
        for restr in restriction_search:
            cur.execute("SELECT * FROM recipe WHERE recipe_id IN (SELECT recip_id FROM recipe_by_restriction WHERE restr_id IN (SELECT restriction_id FROM Restriction WHERE label=\"" + str(restr) + "\"));")
            result = cur.fetchall()
            if result is not None:
                for r in result:
                    if type(r) is dict:
                        if r["label"] not in restrictions_tracked:
                            restriction_results.append(r)
                            restrictions_tracked.append(r["label"])

    top_results = []
    top_tracked = find_top_recommendation(cuisines_tracked, dishes_tracked, restrictions_tracked, meals_tracked)
    for t in top_tracked:
        cur.execute("SELECT * FROM recipe WHERE label=\"" + str(t) + "\";")
        top = cur.fetchall()
        for tt in top:
            top_results.append(tt)

    results = [top_results, meal_results, dish_results, cuisine_results, restriction_results, top_tracked, meals_tracked, dishes_tracked, cuisines_tracked, restrictions_tracked]
    return results

def find_top_recommendation(a, b, c, d):
    s1 = set(a)
    s2 = set(b)
    s3 = set(c)
    s4 = set(d)
    ab = s1.intersection(s2)
    abc = ab.intersection(s3)
    abcd = abc.intersection(s4)
    temp = list(abcd)
    return temp