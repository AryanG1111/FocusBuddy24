import newspaper
from newspaper import news_pool
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

print('Script has begun running!')
nltk.download('vader_lexicon')
nltk.download('punkt')
Newspaper_links = [
        "https://www.washingtonpost.com/lifestyle/kidspost/",
        "https://www.dogonews.com/",
        "https://www.positive.news/",
        "https://lifebeyondnumbers.com/",
        "https://www.thegoodnewsmovement.com/category/good-news/", 
        "https://newsforkids.net/", 
        "https://youngzine.org/article_briefs", 
        "https://www.cbc.ca/kids/articles", 
        "https://www.edweek.org/", 
        "https://www.kiwikidsnews.co.nz/", 
        "https://www.snexplores.org/", 
        "https://www.smithsonianmag.com/videos/ask-smithsonian-whats-the-point-of-earwax/"
    ]


cred = credentials.Certificate('studybuddy-3dbec-firebase-adminsdk-b3v8b-c96c1aad6a.json')

firebase_admin.initialize_app(cred, {
    'storageBucket' : 'studybuddy-3dbec.appspot.com'
})
bucket = storage.bucket()
db = firestore.client()

def scheduled_job():
    all_articles = set()
    collection_ref = db.collection(u'Articles')
    our_stream = collection_ref.stream()
    for doc in our_stream:
        my_doc = doc.to_dict()
        all_articles.add(my_doc['Title'])
    sentiment_analyzer = SentimentIntensityAnalyzer()

    built_papers = [newspaper.build(link, memoize_articles = False) for link in Newspaper_links]
    news_pool.set(built_papers, threads_per_source = 2) #Number of threads = 2*len(Newspaper_links)
    news_pool.join()

    sentiment_analyzer = SentimentIntensityAnalyzer()
    def process_article(article):
        article_info = dict()
        if article.is_valid_url(): article_info["articleLink"] = article.url
        article_info["authors"] = article.authors
        article_info["Date"] = article.publish_date
        article_info["Title"] = article.title
        article_info["sentiment"] = sentiment_analyzer.polarity_scores(article.text)["compound"]

        article.nlp()
        article_info["summary"] = article.summary
        article_info["keywords"] = article.keywords
        if article.has_top_image(): 
            response = requests.get(article.top_image)
            try:
                image = Image.open(BytesIO(response.content))
                my_content = None
                with BytesIO() as f_png:
                    image.save(f_png, format="PNG")
                    my_content = f_png.getvalue()
                filename = article.title.replace(" ", "-")
                blob = bucket.blob(filename)
                blob.upload_from_string(my_content, content_type="image/png")
                article_info["imageLink"] = blob.generate_signed_url(datetime.now() + timedelta(days = 30))
            except PIL.UnidentifiedImageError:
                print(f"Image is corrupted for article with title: {article.title}")
        collection_ref = db.collection(u'Articles')
        doc_ref = collection_ref.document(article.title)
        doc_ref.set(article_info)
        return article_info["Title"]

    num_articles = 1
    for built_paper in built_papers:
        print(f"Number of Articles for {built_paper.brand}: {built_paper.size()}")
        for article in built_paper.articles: 
            article.parse() 
            if not article.is_valid_url() or article.text=="" or not article.is_valid_body(): continue 
            elif article.title not in all_articles:
                article_title = process_article(article)
                print(f"\tArticle number {num_articles} processed and message was '{article.download_exception_msg}'.")
                print(f"\tTitle of article was: {article_title}")
                num_articles+=1
                all_articles.add(article.title)
    print(f"Total number of articles: {len(all_articles)}")

ran_first = False
schedule.every(1).hour.do(scheduled_job)
while True:
    if not ran_first:
        scheduled_job()
        ran_first = True
    else:
        schedule.run_pending()
        time.sleep(5)
