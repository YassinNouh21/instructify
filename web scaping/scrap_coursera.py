from multiprocessing.connection import wait
from random import Random, random
import time
import uuid
from faker import Faker
from xml.dom.minidom import Element
from bs4 import BeautifulSoup
from faker import Faker
from requests import request
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
BASE_URL = "https://www.coursera.org"


# instructor
fake_names = ["Jett Skiles",
              "Mariah Lynch",
              "Alyce Heidenreich DDS",
              "Alexandre Mitchell",
              "Carlotta Franecki",
              "Hollie Smith", ]

# createdDate


def fake_date_create():
    fake = Faker()
    fake_date_create = fake.date_between(start_date='-3y', end_date='-5m')
    return fake_date_create

# price


def fake_price():
    random = Random()
    return int(random.randrange(500, 2000, 300))

# duration


def fake_duration():
    random = Random()
    return int(random.randrange(500, 2000, 200))


options = webdriver.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging'])
options.binary_location = "C:\\Program Files\\Google\\Chrome Beta\\Application\\chrome.exe"

driver = webdriver.Chrome(
    options=options, service=Service(executable_path='D:\\chrome_drive\\chromedriver.exe'))

content = driver.get(
    f"{BASE_URL}/search?query=Chemistry&index=prod_all_launched_products_term_optimization&entityTypeDescription=Specializations")
print(driver.page_source)
driver.maximize_window()
soup = BeautifulSoup(driver.page_source, "html.parser")

# courseName
courses_name = soup.find_all("h2", class_="cds-1 css-cru2ji cds-3")
# imgUrl
courses_img = soup.find_all("div", class_="css-17z2etb")
# url
global_courses_url = soup.find_all(
    "a", attrs={"data-click-key": "search.search.click.search_card"})


def content_extractor(url):
    content = driver.get(url)
    time.sleep(3)
    soup = BeautifulSoup(driver.page_source, "html.parser")
    contents = soup.find_all("h3", class_="headline-3-text bold m-t-1 m-b-2")
    content_list = []
    # content
    for content in contents:
        content_json = {}
        content_json["topic"] = content.text
        content_json["duration"] = fake_duration().__str__()
        content_list.append(content_json)
    return content_list


def category_adder(name, courses_id_list, db):
    temp = {}
    temp['name'] = name
    temp['categoryId'] = uuid.uuid4().__str__()
    temp['imgUrl'] = 'https://dummyimage.com/50x50/000/'
    for i in courses_id_list:
        ids.append(i['courseId'])
    temp['courseId'] = ids
    db.collection('categories').document(temp['categoryId']).set(temp)


courses_url = []
global_json = [{}]
for i in global_courses_url:
    courses_url.append(i.get("href"))

cred = credentials.Certificate("private_key.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

random = Random()
global_json_list = []
courses_id = []
for name in range(len(courses_name)):
    temp = {}
    temp['courseName'] = courses_name[name].text
    temp['createdDate'] = fake_date_create().__str__()
    temp['instructor'] = random.choice(fake_names)
    temp['duration'] = fake_duration()
    temp['price'] = fake_price()
    temp['imgUrl'] = courses_img[name].find("img").get("src")
    temp['content'] = content_extractor(f'{BASE_URL}{courses_url[name]}')
    temp['courseId'] = uuid.uuid4().__str__()
    courses_id.append(temp['courseId'])
    doc_ref = db.collection('courses').document(temp['courseId']).set(temp)
    global_json_list.append(temp)
ids = []
category_adder(name='Dynamics', courses_id_list=global_json_list, db=db)

driver.close()
