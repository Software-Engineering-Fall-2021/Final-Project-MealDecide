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