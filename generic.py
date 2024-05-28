from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time
from sqlalchemy import create_engine, text

# -------- SELENIUM config ---------
options = Options()
options.add_experimental_option("detach", True)
# options.add_argument('--headless')
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
# driver.maximize_window()

# -------- SqlAlchemy config -------
connection_string = "mysql+mysqlconnector://root:6F4LDiTvazP7Tk@127.0.0.1:3306/mock"
engine = create_engine(connection_string, echo=True)

# ------- opening, reading, storaging (on "stores") and closing the STORES table--------
with engine.connect() as connection:
    stores = connection.execute(text("SELECT * FROM stores"))
    # products = connection.execute(text("SELECT * FROM products"))

stores = list(stores.mappings())
# products = list(products.mappings())
# ------ uncomment to see all stores -----
# for e in stores:
#     print(e)

# ------------- searching mateus+rose(one product only) on 5 stores -------------
for store in stores:
    driver.get(store['search_url'] + 'mateus+rose')
    x_cookie = store['x_cookies']
    time.sleep(2)  # waits till the document loads entirely
    accept_cookies = driver.find_element("xpath", f"{x_cookie}")
    accept_cookies.click()
    # time.sleep(2)
    x_pdp_url = store['x_url']
    elements = driver.find_elements("xpath", f"{x_pdp_url}")
    # python list comprehension for list urls_lst: https://www.w3schools.com/python/python_lists_comprehension.asp
    urls_lst = [element.get_attribute("href") for element in elements]

    for url in urls_lst:
        driver.get(url)
        # time.sleep(2)
        print("Going to:", url)
        name = driver.find_element("xpath", store['x_name'])
        print("Name:", name.text)
        capacity = driver.find_element("xpath", store['x_capacity'])
        print("Capacity:", capacity.text)
        price = driver.find_element("xpath", store['x_price'])
        print("Price:", price.text)
        print("-------------------------------------------------------------------------------------------------------")
