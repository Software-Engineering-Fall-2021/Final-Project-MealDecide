import json
import os
import requests

def restaurants():

    parsed = []
    contact_parsed = []

    with open("./rs.json", "r") as read_file:
        data = json.load(read_file)
    
    list = data["data"]

    i = 1

    for r in list:
        entry = {}
        contact = {}
        restriction = {}

        if 'ad_size' in r:
            continue

        print("Entry is not an ad, continue.")

        entry['restaurant_id'] = i
        contact['restaurant_id'] = i

        try:
            entry['name'] = r['name']
        except KeyError:
            entry['name'] = None
        try:
            entry['rating'] = r['rating']
        except KeyError:
            entry['rating'] = None
        try:
            entry['price_level'] = r['price_level']
        except KeyError:
            entry['price_level'] = None
        
        entry['description'] = r['description']
        if len(r['subcategory']) > 0:
            entry['subcategory'] = r['subcategory'][0]['key']
        else:
            entry['subcategory'] = None
        contact['phone'] = r['phone']
        contact['website'] = r['website']
        try:
            contact['email'] = r['email']
        except KeyError:
            contact['email'] = None
        contact['address'] = r['address']

        entry["restriction_description"] = ""
        for e in r['dietary_restrictions']:
            
            if e["name"] == "Vegetarian Friendly":
                entry['restriction_description'] = entry["restriction_description"] + " " + "Vegetarian"
            
            if e["name"] == "Vegan Options":
                entry['restriction_description'] = entry["restriction_description"] + " " + "Vegan"
                
            if e["name"] == "Gluten Free Options":
                entry['restriction_description'] = entry["restriction_description"] + " " + "Gluten Free"
                
        entry['establishment_type'] = r['establishment_types'][0]['name']

        cuisines = ""
        cuisine = ""
        for c in r['cuisine']:
            if (c['name'] != "Vegetarian Friendly") and (c['name'] != "Vegan Options") and (c['name'] != "Gluten Free Options"):
                cuisines = c['name'] + ", " + cuisines
        
        cuisine = cuisines[:len(cuisines) - 2]
        entry['cuisine_description'] = cuisine
                

        parsed.append(entry)
        contact_parsed.append(contact)
        i = i + 1
    
    print(str(parsed))

    with open("./restaurant.json", "w") as write_file:
        data = json.dump(parsed, write_file)
        data = json.dump(contact_parsed, write_file)

def cuisine():
    parsed = []

    with open("./data/meals.json", "r") as read_file:
        data = json.load(read_file)
    
    list = data["data"]

    i = 1

    for r in list:
        entry = {}

        if 'ad_size' in r:
            continue

        print("Entry is not an ad, continue.")

        entry['restaurant_id'] = i
        try:
            entry['label'] = r['label']
        except KeyError:
            entry['label'] = None
        try:
            entry['count'] = r['count']
        except KeyError:
            entry['count'] = None
        try:
            entry['category'] = r['category']
        except KeyError:
            entry['category'] = None
        
        parsed.append(entry)
        i = i + 1
    
    print(str(parsed))

    with open("./data/meal.json", "w") as write_file:
        data = json.dump(parsed, write_file)

def restriction():
    parsed = []

    with open("./restriction.json", "r") as read_file:
        data = json.load(read_file)
    
    list = data["data"]

    i = 1

    for r in list:
        entry = {}

        if 'ad_size' in r:
            continue

        print("Entry is not an ad, continue.")

        entry['restriction_id'] = i
        try:
            entry['label'] = r
        except KeyError:
            entry['label'] = None
        entry["restaurant_count"] = 0
        entry["recipe_count"] = 0
        
        parsed.append(entry)
        i = i + 1
    
    print(str(parsed))

    with open("./restrict.json", "w") as write_file:
        data = json.dump(parsed, write_file)

def resta_by_restr():
    parsed = []

    with open("./restrict.json", "r") as read_file:
        restrict_data = json.load(read_file)
    
    with open("./restaurant.json", "r") as read_file:
        restaurant_data = json.load(read_file)
    
    restr = restrict_data["data"]
    resta = restaurant_data["data"]

    i = 1

    for r in resta:
        entry = {}
        entry['resta_id'] = r["restaurant_id"]

        if 'Vegetarian' in r['restriction_description']:
            entry["restr_id"] = 34
            parsed.append(entry)
        
        if 'Vegan' in r['restriction_description']:
            entry["restr_id"] = 33
            parsed.append(entry)
        
        if 'Gluten Free' in r['restriction_description']:
            entry["restr_id"] = 10
            parsed.append(entry)
    
    print(str(parsed))

    with open("./restrict_rest.json", "w") as write_file:
        data = json.dump(parsed, write_file)

def recip_by_restr():
    parsed = []

    with open("./restrict.json", "r") as read_file:
        restrict_data = json.load(read_file)
    
    with open("./recipie.json", "r") as read_file:
        recip_data = json.load(read_file)
    
    restr = restrict_data["data"]
    recip = recip_data["data"]

    i = 1
    j = 1

    for r in recip:
        map_id = j
        entry = {}
        entry['recip_id'] = r['recipe_id']

        for rst in restr:
            entry['recip_id'] = i
            entry['map_id'] = map_id
            if rst['label'] in r['dietLabels'] or rst['label'].lower() in r['cuisineType']:
                entry["restr_id"] = rst['restriction_id']
                parsed.append(entry)
                map_id = j+1
                entry = {}
            
        j = map_id + 1
        i = i + 1
    
    print(str(parsed))

    with open("./restrict_recip.json", "w") as write_file:
        data = json.dump(parsed, write_file)
    
def recip_by_cuisi():
    parsed = []

    with open("./meal.json", "r") as read_file:
        cuisine_data = json.load(read_file)
    
    with open("./recipie.json", "r") as read_file:
        recip_data = json.load(read_file)
    
    cuisi = cuisine_data["data"]
    recip = recip_data["data"]

    i = 1
    j = 1

    for r in recip:
        entry = {}
        entry['recip_id'] = r['recipe_id']

        for c in cuisi:
            if c['label'].lower() in r['cuisineType']:
                entry["cuisi_id"] = c['restaurant_id']
                parsed.append(entry)
                map_id = j+1
                entry = {}
        i = i + 1
    
    print(str(parsed))

    with open("./cuisi_recip.json", "w") as write_file:
        data = json.dump(parsed, write_file)


def queryRestaurant(offset):
    url = "https://travel-advisor.p.rapidapi.com/restaurants/list-in-boundary"

    querystring = {"bl_latitude":"41.565862","tr_latitude":"41.681105","bl_longitude":"88.145735","tr_longitude":"-88.001586","restaurant_tagcategory_standalone":"10591","restaurant_tagcategory":"10591","limit":"30","currency":"USD","open_now":"false","lunit":"km", "offset": str(offset), "lang":"en_US"}

    headers = {
        'x-rapidapi-host': "travel-advisor.p.rapidapi.com",
        'x-rapidapi-key': "97bdd0b262msh871fd82e2b688c9p1d9f78jsnfdcf37588290"
        }

    response = requests.request("GET", url, headers=headers, params=querystring)
    json_data = json.loads(response.text)
    restaurant_data = json_data["data"]
    result_count = json_data["paging"]["total_results"]
    return

queryRestaurant(0)