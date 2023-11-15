#!/usr/bin/env python
# coding: utf-8

# In[19]:


import pandas as pd
import spacy
from tqdm.auto import tqdm
from rake_nltk import Rake
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.feature_extraction import text
from textblob import TextBlob


# In[20]:


my_stop_words = text.ENGLISH_STOP_WORDS.union(["kellie","stacey","rebecca","rice","comment","marquita","just","management","henderson","response","don"])


# In[21]:


def get_top_n_words_tfidf(corpus, n=None):
    vec = TfidfVectorizer(stop_words=my_stop_words,ngram_range=
                         (2,3)).fit(corpus)
    bag_of_words = vec.transform(corpus)
    sum_words = bag_of_words.max(axis=0).toarray()
    words_freq = [(word, sum_words[0, idx],'Positive' if TextBlob(word).sentiment.polarity>0 else "Negative") for word, idx in     vec.vocabulary_.items()]
    words_freq =sorted(words_freq, key = lambda x: x[1], reverse=True)
    return words_freq[:n]


# In[22]:


def get_top_n_words_cv(corpus, n=None):
    vec = CountVectorizer(stop_words=my_stop_words,ngram_range=
                         (2,3)).fit(corpus)
    bag_of_words = vec.transform(corpus)
    sum_words = bag_of_words.sum(axis=0)
    words_freq = [(word, sum_words[0, idx],'Positive' if TextBlob(word).sentiment.polarity>0 else "Negative") for word, idx in     vec.vocabulary_.items()]
    words_freq =sorted(words_freq, key = lambda x: x[1], reverse=True)
    return words_freq[:n]


# In[23]:


wdm = pd.read_excel("c:/Users/jranj/Downloads/wdm competitors.xlsx",sheet_name="Henderson")


# In[24]:


wdm = wdm[wdm.review_text.notnull()].reset_index(drop=True)


# In[25]:


get_top_n_words_tfidf(wdm.review_text,n=20)


# In[26]:


get_top_n_words_cv(wdm.review_text,n=20)


# In[ ]:





# In[ ]:




