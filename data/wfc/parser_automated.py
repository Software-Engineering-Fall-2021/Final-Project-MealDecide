import requests
import json
import os

def streamlineRestaurants(data, offset):
    contact_info = []
    restaurant_info = []

    i = 1 + offset
    for r in data:
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

        try:
            contact['phone'] = r['phone']
        except KeyError:
            contact['phone'] = None
        
        try:
            contact['website'] = r['website']
        except KeyError:
            contact['website'] = None

        try:
            contact['email'] = r['email']
        except KeyError:
            contact['email'] = None
        
        try:
            contact['address'] = r['address']
        except KeyError:
            contact['address'] = None
        
        entry["restriction_description"] = ""
        for e in r['dietary_restrictions']:
            
            if e["name"] == "Vegetarian Friendly":
                entry['restriction_description'] = entry["restriction_description"] + ", " + "Vegetarian"
            
            if e["name"] == "Vegan Options":
                entry['restriction_description'] = entry["restriction_description"] + ", " + "Vegan"
                
            if e["name"] == "Gluten Free Options":
                entry['restriction_description'] = entry["restriction_description"] + ", " + "Gluten-Free"
                
        entry['establishment_type'] = r['establishment_types'][0]['name']

        cuisines = ""
        cuisine = ""
        for c in r['cuisine']:
            if (c['name'] != "Vegetarian Friendly") and (c['name'] != "Vegan Options") and (c['name'] != "Gluten Free Options"):
                cuisines = c['name'] + ", " + cuisines
        
        cuisine = cuisines[:len(cuisines) - 2]
        entry['cuisine_description'] = cuisine
                
        restaurant_info.append(entry)
        contact_info.append(contact)
        i = i + 1
    
    return restaurant_info, contact_info

def queryRestaurant(offset):
    url = "https://travel-advisor.p.rapidapi.com/restaurants/list-in-boundary"

    querystring = {"bl_latitude":"41.564056","tr_latitude":"41.721430","bl_longitude":"-88.178565","tr_longitude":"-88.006360","restaurant_tagcategory_standalone":"10591","restaurant_tagcategory":"10591","limit":"30","currency":"USD","open_now":"false","lunit":"km", "offset": str(offset), "lang":"en_US"}

    headers = {
        'x-rapidapi-host': "travel-advisor.p.rapidapi.com",
        'x-rapidapi-key': "LMAO_OOPS_EXPOSED_KEY_WE_DON'T_WANT_THAT_ON_GITHUB"
        }

    response = requests.request("GET", url, headers=headers, params=querystring)
    json_data = json.loads(response.text)
    result_count = json_data["paging"]["total_results"]
    
    restaurant_untracked = json_data["data"]
    restaurant_data, contact_data = streamlineRestaurants(restaurant_untracked, offset)
    
    return restaurant_data, contact_data

def localLoad():
    with open("./wfc/cuisine_reference.json", "r") as read_file:
        temp_cuisine = json.load(read_file)
    cuisine_reference = temp_cuisine["data"]

    with open("./wfc/restriction_reference.json", "r") as read_file:
        temp_restriction = json.load(read_file)
    restriction_reference = temp_restriction["data"]

    with open("./wfc/results/restaurant.json", "r") as read_file:
        temp_restaurant = json.load(read_file)
    restaurants = temp_restaurant

    restaurants_by_cuisine = []
    restaurants_by_restriction = []
    
    for r in restaurants:
        rc_listing = r["cuisine_description"].split(", ")
        for c in cuisine_reference:
            if c['label'] in rc_listing:
                cuisine_reference[cuisine_reference.index(c)]["restaurant_count"] = cuisine_reference[cuisine_reference.index(c)]["restaurant_count"] + 1
                restaurants_by_cuisine.append({"restaurant_id": r["restaurant_id"], "cuisine_id": c["restaurant_id"]})
    
    for r in restaurants:
        rrst_listing = r["restriction_description"].split(", ")
        for rst in restriction_reference:
            if rst['label'] in rrst_listing:
                restriction_reference[restriction_reference.index(rst)]["restaurant_count"] = restriction_reference[restriction_reference.index(rst)]["restaurant_count"] + 1
                restaurants_by_restriction.append({"restaurant_id": r["restaurant_id"], "restriction_id": rst["restriction_id"]})

    cuisine = [cuisine_reference]
    restriction = [restriction_reference]
    
    with open("./wfc/results/cuisine.json", "w") as write_file:
        data = json.dump(cuisine, write_file)

    with open("./wfc/results/restriction.json", "w") as write_file:
        data = json.dump(restriction, write_file)
    
    with open("./wfc/results/restaurant_by_cuisine.json", "w") as write_file:
        data = json.dump(restaurants_by_cuisine, write_file)

    with open("./wfc/results/restaurant_by_restriction.json", "w") as write_file:
        data = json.dump(restaurants_by_restriction, write_file)

def apiLoad():
    with open("./wfc/cuisine_reference.json", "r") as read_file:
        temp_cuisine = json.load(read_file)
    cuisine_reference = temp_cuisine["data"]

    with open("./wfc/restriction_reference.json", "r") as read_file:
        temp_restriction = json.load(read_file)
    restriction_reference = temp_restriction["data"]

    restaurants = []
    contacts = []
    restaurants_by_cuisine = []
    restaurants_by_restriction = []

    for i in range (0,10):
        offset = i * 30
        rest, cont = queryRestaurant(offset)
        restaurants.extend(rest)
        contacts.extend(cont)

    with open("./wfc/results/restaurant.json", "w") as write_file:
        data = json.dump(restaurants, write_file)
    
    with open("./wfc/results/contact.json", "w") as write_file:
        data = json.dump(contacts, write_file)
    
    for r in restaurants:
        rc_listing = r["cuisine_description"].split(", ")
        for c in cuisine_reference:
            if c['label'] in rc_listing:
                cuisine_reference[cuisine_reference.index(c)]["restaurant_count"] = cuisine_reference[cuisine_reference.index(c)]["restaurant_count"] + 1
                restaurants_by_cuisine.append({"restaurant_id": r["restaurant_id"], "cuisine_id": c["restaurant_id"]})
    
    for r in restaurants:
        rrst_listing = r["restriction_description"].split(", ")
        for rst in restriction_reference:
            if rst['label'] in rrst_listing:
                restriction_reference[restriction_reference.index(rst)]["restaurant_count"] = restriction_reference[restriction_reference.index(rst)]["restaurant_count"] + 1
                restaurants_by_restriction.append({"restaurant_id": r["restaurant_id"], "restriction_id": rst["restriction_id"]})

    cuisine = [cuisine_reference]
    restriction = [restriction_reference]
    
    with open("./wfc/results/cuisine.json", "w") as write_file:
        data = json.dump(cuisine, write_file)

    with open("./wfc/results/restriction.json", "w") as write_file:
        data = json.dump(restriction, write_file)
    
    with open("./wfc/results/restaurant_by_cuisine.json", "w") as write_file:
        data = json.dump(restaurants_by_cuisine, write_file)

    with open("./wfc/results/restaurant_by_restriction.json", "w") as write_file:
        data = json.dump(restaurants_by_restriction, write_file)


localLoad()
