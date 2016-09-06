# -*- coding: utf-8 -*-
__author__ = 'User'
import urllib2
from bs4 import BeautifulSoup, NavigableString
from random import randint
from time import sleep
import re

def strip_tags(html, invalid_tags):
    soup = BeautifulSoup(html, "lxml")
    for tag in soup.findAll(True):
        if tag.name in invalid_tags:
            s = ""
            for c in tag.contents:
                if not isinstance(c, NavigableString):
                    c = strip_tags(unicode(c), invalid_tags)
                s += unicode(c)
            tag.replaceWith(s)
    return soup

dictionary = {'En', 'av', 'politimennene', 'grep', 'tak', 'i', 'henne', 'og', 'dyttet'}

# TODO: use XSLT rather than simply outputting the text
for word in dictionary:
    url = 'http://www.nob-ordbok.uio.no/perl/ordbok.cgi?OPP=%s&ant_bokmaal=5&ant_nynorsk=5&bokmaal=+&ordbok=bokmaal'
    url %= word
    print url
    sleep(randint(1, 7))
    definition_page = BeautifulSoup(urllib2.urlopen(url).read(), "lxml")
    articles = definition_page.findAll("div", {"class": "artikkel"})
    last_article_counter = len(articles) - 1
    last_article = articles[last_article_counter]
    looked_up_word = last_article.findAll("span", {"class": "oppslagsord b"})[0].text
    print looked_up_word
    synonym = last_article.findAll("div", {"class": "tyding utvidet"})
    if len(synonym) > 0: # complex words
        synonym = synonym[0].text
    else:  # simple words
        synonym = last_article.findAll("span", {"class": "utvidet"})[0].text
    synonym = re.sub('^[0-9]', '', synonym)
    print synonym
