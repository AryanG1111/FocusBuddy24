import newspaper
from newspaper import news_pool, Article
import PIL
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
import requests
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from firebase_admin import storage
from PIL import Image
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import requests
from io import BytesIO
import schedule
import time
from datetime import datetime, timedelta

sentiment_analyzer = SentimentIntensityAnalyzer()
cred = credentials.Certificate('studybuddy-3dbec-firebase-adminsdk-b3v8b-c96c1aad6a.json')

firebase_admin.initialize_app(cred, {
    'storageBucket' : 'studybuddy-3dbec.appspot.com'
})
bucket = storage.bucket()
db = firestore.client()

collection_ref = db.collection(u'Articles')
our_stream = collection_ref.stream()
total = 1
summaries_file = open("gpt_summaries_train.txt", "w", encoding="utf-8")
full_file = open("gpt_full_train.txt", "w", encoding="utf-8")
for doc in our_stream:
    my_doc = doc.to_dict()
    summary = my_doc['summary']
    link = my_doc['articleLink']
    my_article = Article(link)
    my_article.download()
    my_article.parse()
    full_text = my_article.text
    summaries_file.write(summary)
    summaries_file.write("\n")
    full_file.write(my_article.text)
    print(f"Article number {total} with title: '{my_doc['Title']}' is processed.")
    total += 1
