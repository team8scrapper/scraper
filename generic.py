from defusedxml import lxml
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.remote.webelement import WebElement
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.wait import WebDriverWait
import time
from sqlalchemy import create_engine, text
from lxml import etree
import types
import db_mock
import json

# -------- SELENIUM config ---------
options = Options()
options.add_experimental_option("detach", True)
# options.add_argument('--headless')  # Uncomment this section to run the app HEADLESS
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
driver.maximize_window()

# -------- SqlAlchemy config -------
connection_string = "mysql+mysqlconnector://root:6F4LDiTvazP7Tk@127.0.0.1:3306/mock"
engine = create_engine(connection_string, echo=True)

# ------- addressing STORE table's rows(db) to the variable store--------
# with engine.connect() as connection:
#     products = connection.execute(text("SELECT * FROM products"))
#     stores = connection.execute(text("SELECT * FROM stores"))


# products = list(products.mappings())

# --------------  *MANUAL DB CONFIG* ------------------
# stores = db_mock.get_stores_db_mock()
products = db_mock.get_products_db_mock()

# ------------ making the .json the DB ---------------
with open("template.json", 'r') as fd:
    stores = fd.read()

stores = json.loads(stores)


def take_screenshot(url: str, xpath: str, file_name: str) -> None:
    driver.get(url)
    driver.maximize_window()
    body = driver.find_element("xpath", xpath)
    wait = WebDriverWait(driver, timeout=4)
    wait.until(lambda d: body.is_displayed())
    body.screenshot(f'{file_name}')


def gather_pdp_urls(store) -> list:
    global urls_lst
    x_pdp_url = store['x_url']
    urls_element = driver.find_elements("xpath", f"{x_pdp_url}")
    if urls_element:
        urls_lst = [element.get_attribute("href") for element in urls_element]

    return urls_lst


def handle_start_page(stores) -> None:
    # stores_name = stores['name']
    # take_screenshot(search_url + product_name, '//body', f'screenshots/{stores_name}.png')
    cookies = stores['x_cookies']
    try:
        driver.find_element("xpath", f"{cookies}")
        accept_cookies = driver.find_element("xpath", f"{cookies}")
        wait = WebDriverWait(driver, timeout=4)
        wait.until(lambda d: accept_cookies.is_displayed())
        accept_cookies.click()
    except:
        pass


def objxs_pdp_builder(urls_list) -> list:
    objxs_list = []
    for url in urls_list:
        driver.get(url)

        soup = driver.page_source
        dom = etree.HTML(str(soup))
        # print("-->Going to:", store['name'], url)
        # wait = WebDriverWait(driver, timeout=4)
        # wait.until(lambda d: name.is_displayed())
        # time.sleep(2)

        name = get_text(dom.xpath(store['x_name']))
        capacity = get_text(dom.xpath(store['x_capacity']))
        price = get_text(dom.xpath(store['x_price']))

        objxs_list.append({'name': f'{name}', 'capacity': f'{capacity}', 'price': f'{price}'})
    print(f"\n{len(objxs_list)} object(s) created: ", objxs_list)
    print("--------------------------------------------------------------------------------------------------------"
          "-------------------------------------------------------------------")
    return objxs_list


def get_text(x_path_value):
    while True:
        if isinstance(x_path_value, etree._Element):
            return x_path_value.text.strip()
        elif isinstance(x_path_value, list):
            if x_path_value:
                x_path_value = x_path_value[0]
                continue
            else:
                return ""
        else:
            return x_path_value.strip()


# ------------- searching 8 products on n stores -------------
for id, store in stores.items():
    urls_lst = []
    upper_name = (store['name']).upper()
    print(f"\nGoing for store: {upper_name}")
    for product in products:
        driver.get(store['search_url'] + product['name'])
        handle_start_page(store)
        time.sleep(3)
        urls_lst = gather_pdp_urls(store)
        print(f"\nSearching for product: {product['name']}")
        objxs_pdp_builder(urls_lst)
        urls_lst = []

print("---------------------------------...-->|Scraper is done|<--...----------------------------------------------")
