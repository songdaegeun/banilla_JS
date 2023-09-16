import requests
from bs4 import BeautifulSoup
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db=client.dbjungle

#매트릭스의 평점을 0으로 만들기
db.movies.update_one({'title':'매트릭스'}, {'$set': {'star':0}})