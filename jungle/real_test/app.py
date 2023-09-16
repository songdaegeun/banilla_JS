from flask import Flask, render_template, jsonify, request
from pymongo import MongoClient  

app = Flask(__name__)

# client = MongoClient('localhost', 27017)
client = MongoClient('mongodb://sdg:0000@3.38.190.194',27017)

db = client.test_db
collection= db.test_collection

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/db/create', methods=['POST'])
def createCardlist():
    title = request.form['card_title']  
    text = request.form['card_text']  

    card_dic = {'title':title, 'text':text}
    collection.insert_one(card_dic)
    return jsonify({'result': 'success'})

@app.route('/db/update', methods=['POST'])
def updateCardlist():
    title = request.form['card_title']  
    text = request.form['card_text']  
    key = request.form['key']

    card_dic = {'title':title, 'text':text}
    collection.update_one({'title':key}, {"$set":card_dic})
    return jsonify({'result': 'success'})

@app.route('/db/read', methods=['GET'])
def readCardlist():
    readCollection = list(collection.find({}, {'_id': 0}))
    return jsonify({'result': 'success', 'cardlist': readCollection})

@app.route('/db/delete', methods=['POST'])
def deleteCard():
    title = request.form['card_title']  
    collection.delete_one({'title':title})
    return jsonify({'result': 'success'})


if __name__ == '__main__':
    app.run('0.0.0.0', port=5000, debug=True)



# making_db.py 내용 참고

# from pymongo import MongoClient

# # client = MongoClient('localhost', 27017)
# client = MongoClient('mongodb://sdg:0000@3.38.190.194',27017)

# db = client.test_db
# collection= db.test_collection

# def insert_document(ls):
#     collection.drop()
#     for i in ls:
#         title = i + "번째 제목을 입력합니다."
#         text = i + "번째 내용을 입력합니다."

#         dic={ "title": title,  "text": text}
#         collection.insert_one(dic)
    

# ls = ["첫", "두", "세", "네", "다섯"]
# insert_document(ls)