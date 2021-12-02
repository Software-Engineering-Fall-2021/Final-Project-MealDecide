import json


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


def get_lat_lon(entry):
    lat = entry["latitude"]
    lon = entry["longitude"]
    return {"latitude": lat, "longtiude": lon}

def check_price(price_max, price_min):
    if (price_max is not None) and (price_min is not None) and (price_max >= price_min):
        price_range = (int(price_min) * "$") + " - " + (int(price_max) * "$")
        return [True, price_range]
    elif price_min > price_max:
        price_max = price_min
        price_range = (int(price_min) * "$") + " - " + (int(price_max) * "$")
        return [True, price_range]
    else:
        price_range = "ERROR: PLEASE PROVIDE A VALID MAX AND MIN PRICE RANGE"
        return [False, price_range]

def craft_search(cuisine, meal, context, speed, restrict):
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

    return [cuisine_search, subcategory_search, restriction_search]

def execute_search(cuisine_search, subcategory_search, restriction_search, price_min, price_max, cur):
    restriction_results = []
    if restriction_search:
        for restr in restriction_search:
            cur.execute("SELECT * FROM restaurant WHERE restaurant_id IN (SELECT resta_id FROM restaurant_by_restriction WHERE restr_id IN (SELECT restriction_id FROM Restriction WHERE label=\"" + str(restr) + "\"));")
            result = cur.fetchall()
            if result is not None:
                restriction_results.append(result)

    cuisine_results = []
    for cuisine in cuisine_search:
        if cuisine == "ALLAN":
            cur.execute("SELECT * FROM restaurant;")
            result = cur.fetchall()
            print(str(result))
            if result is not None:
                cuisine_results.append(result)
                break
        else:
            cur.execute("SELECT * FROM restaurant WHERE restaurant_id IN (SELECT rest_id FROM restaurant_by_cuisine WHERE cuisi_id IN (SELECT cuisine_id FROM Cuisine WHERE category=\"" + str(cuisine) + "\"));")
            result = cur.fetchall()
            if result is not None:
                cuisine_results.append(result)
    
    subcategory_results = []
    for subcat in subcategory_search:
        cur.execute("SELECT * FROM restaurant WHERE subcategory=\"" + str(subcat) + "\";")
        result = cur.fetchall()
        if result is not None:
            subcategory_results.append(result)
    
    price_results = []
    cur.execute("SELECT * FROM restaurant WHERE price_level LIKE \"" + str((int(price_min) * "$")) + "%\";")
    result = cur.fetchall()
    if result is not None:
        price_results.append(result)
    print("SELECT * FROM restaurant WHERE price_level LIKE \"%" + str((int(price_max) * "$")) + "\";")
    cur.execute("SELECT * FROM restaurant WHERE price_level LIKE \"%" + str((int(price_max) * "$")) + "\";")
    result = cur.fetchall()
    if result is not None:
        price_results.append(result)

    results = [cuisine_results, subcategory_results, restriction_results, price_results]
    print(str(results[0]))
    return results

def contact_info(rest_id, cur):
    contact_results = []
    print("SELECT * FROM contact WHERE restaurant_id=" + str(rest_id) + ";")
    cur.execute("SELECT * FROM contact WHERE restaurant_id=" + str(rest_id) + ";")
    result = cur.fetchall()
    print(str(result))
    if result is not None:
        contact_results.append(result)
    return contact_results
    