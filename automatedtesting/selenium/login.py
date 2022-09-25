# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

# Start the browser and login with standard_user
print ('Starting the browser...\n')
options = ChromeOptions()
options.add_argument("--headless") 
driver = webdriver.Chrome(options=options)
driver.get('https://www.saucedemo.com/')
print ('Browser started successfully. Navigating to the demo page to login.\n')

# Login method
def login (user, password):
    print("\nInside login method, taking in the user creadentials to login...\n")
    driver.find_element_by_css_selector("input[id='user-name']").send_keys(user)
    print("Username entered\n")
    driver.find_element_by_css_selector("input[id='password']").send_keys(password)
    print("Password entered\n Logging in...\n")
    driver.find_element_by_css_selector("input[id='login-button']").click()
    print("User successfully logged in\n")

# add and remove items method
def addandremoveItems():
    print("\nAdding all items to the cart...\n")
    all_items=driver.find_elements_by_css_selector("button[class='btn btn_primary btn_small btn_inventory']")
    count=0
    for item in all_items:
        item_name=item.get_property('name')
        item.click()
        print(item_name + " got added to cart\n")
        count=count+1
    
    print("All items added to cart, total number of items in cart = " + str(count))

    all_items_incart=driver.find_elements_by_css_selector("button[class='btn btn_secondary btn_small btn_inventory']")

    print("\nNow, removing all items from the cart...\n")
    for item in all_items_incart:
        cart_item_name=item.get_property('name')
        item.click()
        print(cart_item_name + " got remoed from cart\n")    
        count=count-1

    print("All items removed from cart, total number of items in cart = " + str(count))  

login ('standard_user', 'secret_sauce')
addandremoveItems()