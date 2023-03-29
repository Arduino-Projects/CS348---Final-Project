import requests




userID = 0

def carList():
    print("Please enter the filters for your search, or enter 0/Nothing for no specific filter")
    make_year = input("What make year are you looking for newer than: ")
    odometer_max = input("What is the maximum odometer reading you want: ")
    make_name = input("What is the name of the make you want: ")

    if make_year == "":
        make_year = 0
    if odometer_max == "":
        odometer_max = 0
    
    print()
    print()
    
    data = {"make_year": make_year, "odometer_max": odometer_max, "make_wanted": make_name}
    response = requests.get("http://localhost:8800/carsFiltered", data)

    print("Here is the result of your query: ")
    print()

    if(len(response.json()[0]) == 0):
        print("No results!")

    for k in response.json()[0]:
        print("ID: " + str(k['cid']))
        print("Make: " + str(k['year']) + " " + k['make'])
        print("Price: " + k['price'])
        print("Sold: " + k['sold'])
        print("Description: " + k['desc'])
        print()
    
    print()
    print()
    
    print("Would you like to:")
    print("1. Search again")
    print("2. See reviews on Sellers")
    print("3. Go back home")
    print("")
    inp = input("")
    if inp == '1':
        carList()
    elif inp == '2':
        reviews()
    else:
        return
    
def reviews():
    print()
    print()
    inp = input("Please enter the ID of the car for the seller you'd like to see reviews for: ")
    print()
    print()
    print("Here are the reviews for the seller of this car: ")
    
    data = {"car_id": inp}
    response = requests.get("http://localhost:8800/reviews", data)
    
    print()
    
    if(len(response.json()[0]) == 0):
        print("No results!")

    for k in response.json()[0]:
        print("Rating: " + str(k['rating']) + " stars")
        print("Date: " + k['date'][:10])
        print("Review: " + k['review'])
        print()
    
    print()
    print()
    
    print("Would you like to:")
    print("1. Search again")
    print("2. See reviews on Sellers")
    print("3. Go back home")
    print("")
    inp = input("")
    if inp == '1':
        carList()
    elif inp == '2':
        reviews()
    else:
        return


def ownOrders():
    data = {"buyer": userID}
    response = requests.get("http://localhost:8800/orders", data)
    
    print()

    if(len(response.json()[0]) == 0):
        print("No results!")

    for k in response.json()[0]:
        print("ID: " + str(k['cid']))
        print("Make: " + str(k['year']) + " " + k['make'])
        print("Price: " + k['price'])
        print("Sold: " + k['sold'])
        print("Description: " + k['desc'])
        print()
    
    print()
    print()

    print("Would you like to:")
    print("1. See, add, and modify reviews on Sellers")
    print("2. Go back home")
    print("")
    inp = input("")
    if inp == '1':
        ownReviews()
    else:
        return

def ownReviews():
    print()
    print()
    inp = input("Enter the ID of the car of the seller you want reviews on: ")

    data = {"car_id": inp}
    response = requests.get("http://localhost:8800/reviews", data)
    
    print()
    
    if(len(response.json()[0]) == 0):
        print("No results!")

    for k in response.json()[0]:
        print("Review ID: " + str(k['rid']))
        print("Rating: " + str(k['rating']) + " stars")
        print("Date: " + k['date'][:10])
        print("Review: " + k['review'])
        print()
    
    print()
    print()
    
    print("Would you like to:")
    print("1. Add a review")
    print("2. Modify a review")
    print("3. Delete a review")
    print("4. Go Home")
    inp = input("")
    if inp == '1':
        carList()
    elif inp == '2':
        reviews()
    elif inp == '3':
        deleteReview()
    else:
        return

def deleteReview():
    print()
    print()
    inp = input("Enter the ID of the review you want to delete: ")

    data = {"comment_id": inp}
    response = requests.get("http://localhost:8800/deleteComment", data)
    
    print("Deleted!")
    print("Would you like to:")
    print("1. Modify another review for the same car?")
    print("2. Modify another review for a different car?")
    print("3. Go home")
    inp = input("")
    if inp == '1':
        deleteReview()
    elif inp == '2':
        ownReviews()
    else:
        return


def ownCarsForSale():

    temp = 2


print("Welcome to The Auto Shop!")
userID = input("Please log in with your ID number: ")
print("")
print("Thank you! Please choose one of the below options (enter 1,2,3):")
print("")
print("1. See cars available for purchase")
print("2. View your cars for sale")
print("3. View your order history")
print("4. Close App")
print()
inp = input()

while(True):
    if inp == '1':
        print("")
        print("")
        carList()
        inp = ""
    elif inp == '2':
        print("")
        print("")
        ownCarsForSale()
        inp = ""
    elif inp == '3':
        print("")
        print("")
        ownOrders()
        inp = ""
    elif inp == '4':
        print("")
        print("")
        print("Thank you for using The AutoShop!")
        break
    else:
        print("")
        print("Please choose one of the below options (enter 1,2,3):")
        print("")
        print("1. See cars available for purchase")
        print("2. View your cars for sale")
        print("3. View your order history")
        print("4. Close App")
        print("")
        inp = input()

