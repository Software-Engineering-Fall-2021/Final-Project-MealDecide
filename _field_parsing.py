# Function used to format names to pass as a parameter list to the wheel decide function.
# ACCEPTS: LIST (category_tracked, list of restaurant names)
# RETURNS: STR (CSV formatted list of restaurant names)
def convert_wheel_names(names):
    final = []
    for x in names: # Remove the funky stuff.
        a = x.replace(", ", "-")
        b= a.replace(", ", "-")
        c = b.replace("'", "-")
        d = c.replace("&", "and")
        e = d.replace(" ", "-")
        final.append(e)
    name = ",".join(final) # Rejoin them.

    return name

# Function used to format names to covert a string price like "$" or "$$ - $$$" to corresponding integers like 1 and [2,3]
# ACCEPTS: STR (price_level)
# RETURNS: LIST [INT (minimum), INT (maximum)]
def convert_price_to_int(px):
    initial = px.split(" - ")
    if len(initial) > 1: # Check if it's a single price level provided, if it's not proceed with the stuff below.
        min = initial[0]
        max = initial[1]
        fmin = 0
        fmax = 0

        for dollarsign in min: # Convert $ -> 1
            if dollarsign == "$":
                fmin = fmin + 1

        for dollarsign in max: # Convert $ -> 1
            if dollarsign == "$":
                fmax = fmax + 1

        price = fmin, fmax

    else: # If it's a single price_level like "$", do this and return min=max with respective int like [1,1]
        initprice = initial[0]
        fprc = 0
        for dollarsign in initprice:
            if dollarsign == "$":
                fprc = fprc + 1
        
        price = fprc, fprc

    return price

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