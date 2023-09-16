# 이름, 썸네일, 최근출연작, 영화정보 URL
from bs4 import BeautifulSoup
import requests
from pymongo import MongoClient

# client = MongoClient('localhost', 27017)
client = MongoClient('mongodb://sdg:0000@3.38.190.194',27017)

db = client.my_db
collection= db.moviestar_collection


def get_url():
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
    html = requests.get('https://movie.naver.com/movie/sdb/rank/rpeople.nhn', headers=headers)
    soup = BeautifulSoup(html.text, 'html.parser')

    urls=[]
    moviestar_a_tag_ls = soup.select("#old_content > table > tbody > tr > td.title > a")
    for moviestar_a_tag in moviestar_a_tag_ls:
        if moviestar_a_tag is not None:
            url = "https://movie.naver.com"+ moviestar_a_tag["href"]
            urls.append(url)
    return urls

def insert_star(url):
    html = requests.get(url)
    soup = BeautifulSoup(html.text, 'html.parser')
    a_tag = soup.select_one("#content > div.article > div.mv_info_area > div.mv_info.character > h3 > a")
    if a_tag is not None:
        name = a_tag.text
        shumnail_url = soup.select_one("#content > div.article > div.mv_info_area > div.poster > img")["src"]
        recent_art = soup.select_one("#content > div.article > div.mv_info_area > div.mv_info.character > dl > dd > a").text
        moviestar_dic={ "name":name ,  "shumnail_url":shumnail_url, "recent_art":recent_art, "personal_info_url":url, "like":0}
        collection.insert_one(moviestar_dic)
    
def insert_all():
    collection.drop()
    urls = get_url()
    for url in urls:
        insert_star(url)

insert_all()