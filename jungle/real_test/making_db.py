from pymongo import MongoClient

# client = MongoClient('localhost', 27017)
client = MongoClient('mongodb://sdg:0000@3.38.190.194',27017)

db = client.test_db
collection= db.test_collection

def insert_document(ls):
    collection.drop()
    for i in ls:
        title = i + "번째 제목을 입력합니다."
        text = i + "번째 내용을 입력합니다."

        dic={ "title": title,  "text": text}
        collection.insert_one(dic)

ls = ["첫", "두", "세", "네", "다섯"]
insert_document(ls)