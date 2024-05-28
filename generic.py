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
driver.maximize_window()

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

# ----------- testing xpaths ---------
# searching mateus+rose(one product only) on 4 stores
for e in stores:
    urls_lst = []
    driver.get(e['search_url'] + 'mateus+rose')
    x_cookie = e['x_cookies']
    time.sleep(2)
    accept_cookies = driver.find_element("xpath", f"{x_cookie}")
    accept_cookies.click()
    # time.sleep(2)
    x_pdp_url = e['x_url']
    urls = driver.find_elements("xpath", f"{x_pdp_url}")
    for url in urls:
        urls_lst.append(url.text)
    print(urls_lst)
