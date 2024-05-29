from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time
from sqlalchemy import create_engine, text
from lxml import etree

# -------- SELENIUM config ---------
options = Options()
options.add_experimental_option("detach", True)
options.add_argument('--headless')
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
# driver.maximize_window()

# -------- SqlAlchemy config -------
connection_string = "mysql+mysqlconnector://root:6F4LDiTvazP7Tk@127.0.0.1:3306/mock"
engine = create_engine(connection_string, echo=True)

# ------- addressing STORE table's rows(db) to the variable store--------
with engine.connect() as connection:
    stores = connection.execute(text("SELECT * FROM stores"))
    # products = connection.execute(text("SELECT * FROM products"))

stores = list(stores.mappings())
products = {'name': 'mateus+rose'}  # TODO: change to the line underneath


# products = list(products.mappings())


def take_screenshot(url: str, xpath: str, file_name: str) -> None:
    driver.get(url)
    time.sleep(2)  # waits till the content load
    driver.maximize_window()
    body = driver.find_element("xpath", xpath)
    body.screenshot(f'{file_name}')


def handle_start_page(search_url: str, product_name: str, x_cookie: str) -> None:
    driver.get(search_url + product_name)
    time.sleep(2)  # waits till the document loads entirely TODO "method to wait content to load instead of sleep"
    # take_screenshot(search_url + product_name, '//body', 'test.png')
    try:
        driver.find_element("xpath", f"{x_cookie}")
        accept_cookies = driver.find_element("xpath", f"{x_cookie}")
        accept_cookies.click()
    except:
        pass


# ------------- searching mateus+rose(one product only) on 5 stores -------------
urls_lst = []
for store in stores:
    # uncomment to test each store separately according to "enable" column in DB
    if store['enabled'] == 0:
        continue
    for product in products:
        # iterates on the products pages(url)
        handle_start_page(store['search_url'], products['name'], store['x_cookies'])
        x_pdp_url = store['x_url']
        elements = driver.find_elements("xpath", f"{x_pdp_url}")
        urls_lst = [element.get_attribute("href") for element in elements]

    for url in urls_lst:
        driver.get(url)
        # driver.add_cookie({"age_gate": '18'})
        time.sleep(2)
        soup = driver.page_source
        dom = etree.HTML(str(soup))

        print("-->Going to:", store['name'], url)
        name = dom.xpath(store['x_name'])[0]
        try:
            print("Name:", name.text)
        except AttributeError:
            print("Name:", name)
        capacity = dom.xpath(store['x_capacity'])[0]
        try:
            print("Capacity:", capacity.text)
        except AttributeError:
            print("Capacity:", capacity)
        price = dom.xpath(store['x_price'])[0]
        try:
            print("Price:", price.text)
        except AttributeError:
            print("Price:", price)

        print("------------------------------------------------------------------------------------------"
              "------------------------------------------------------------------------------------------")
