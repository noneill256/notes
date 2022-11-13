""" A traveling salesman has to visit clients. He got each client's address e.g. "432 Main Long Road St. Louisville OH 43071" as a list.
The basic zipcode format usually consists of two capital letters followed by a white space and five digits. The list of clients to visit was given as a 
string of all addresses, each separated from the others by a comma, e.g. :
"123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432".
To ease his travel he wants to group the list by zipcode.

Task
The function travel will take two parameters r (addresses' list of all clients' as a string) and zipcode and returns a string in the following format:
zipcode:street and town,street and town,.../house number,house number,...

The street numbers must be in the same order as the streets where they belong.
If a given zipcode doesn't exist in the list of clients' addresses return "zipcode:/"

Examples
r = "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432"
travel(r, "OH 43071") --> "OH 43071:Main Street St. Louisville,Main Long Road St. Louisville/123,432"
travel(r, "NY 56432") --> "NY 56432:High Street Pollocksville/786"
travel(r, "NY 5643") --> "NY 5643:/"
"""

zipcode = "AA 45522" # the zip code we're looking for
r = ("2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,"
  "2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,"
  "2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000")

# hey silly it's just one big long string don't worry about it!
# result should be: "AA 45522:Paris St. Abbeville,Paris St. Abbeville/67,670")
def travel(r, zipcode):
    streets = []
    nums = []
    addresses = r.split(',')
    for i in addresses:
    if ' '.join(i.split()[-2:]) == zipcode: # if the last two words in 
                                            # the address match the zipcode
        streets.append(' '.join(i.split()[1:-2]))
                        # append all but the first word (the number) and the state + zip code
                        # now we have an array for just the streets
        nums += i.split()[:1] # adding just the number part
                            # of the address
return '{}:{}/{}'.format(zipcode, ','.join(streets), ','.join(nums))
# each {} is replaced by its respective element in the format function!!


