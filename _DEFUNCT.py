import json

# These are the remains of a file once meant to do location-based searches for API integration.

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


