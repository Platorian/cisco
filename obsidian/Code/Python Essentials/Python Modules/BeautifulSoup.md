Web Parser:

```python
import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup

url = input("Enter url: ")
html = urlib.request.urlopen(url.read())
# Create soup object that you can call like a function
soup = BeautifulSoup(html, "html.parser")

# Get anchor tags
tags = soup("a")
for tag in tags:
print(tag.get("href", None))
```

https://www.youtube.com/watch?v=GjKQ6V_ViQE

https://scrapingant.com/blog/beautifulsoup-cheatsheet

```python
# Scrap any website using :
# 1. Use the API
# 2. Tools like bs4

# Refer --
# https://www.crummy.com/software/BeautifulSoup/bs4/doc/


#  ---------------Step 0 [Requirements] ----------------------------
# CMD :
#  pip install requests
#  pip install bs4
#  pip install html5lib


#  --------------Step 1 [Get the HTML]---------------------------------
import requests
from bs4 import BeautifulSoup
url = "https://www.cricbuzz.com/live-cricket-scores/35612/1st-match-indian-premier-league-2021"

response = requests.get(url)
htmlContent = response.content 
# -- OR --
# htmlContent = response.text 
# print(htmlContent)

#  -----------Step 2 [Parse the HTML]--
mySoup = BeautifulSoup(htmlContent, 'html.parser')
# print(mySoup.prettify())  # All HTML content
# --OR--
# print(mySoup.get_text())  # Get All text
# --OR--
# i=0
# for e in mySoup.stripped_strings:
#     i+=1
#     print(i, end=" ")
#     print(e)
# --OR--
print(list(mySoup.stripped_strings)[146])
print(list(mySoup.stripped_strings)[147])


# --------------Imp funcs -- ---------------------

# [.get_text() , .prettify() , .strings , .stripped_strings]
# [ .tag.name , .tag['class'] , .tag['id'] , tag.attrs , .tag.stripped_strings , .tag.previous_sibling , .tag.next_sibling , tag.parents.name]


#------------------------ Types of objects ----------------

# -- 1. Beautiful Soup --
# print(type(mySoup))

# -- 2. Tag --
# title = mySoup.title
# title = mySoup.title.name
# title = mySoup.title.strings
# print(title)
# print(type(title))
# print(mySoup.script)

# -- 3. Navigable String --
# print(title.string)
# print(type(title.string))

# -- 4. Comment --
# m = "<p><!-- This is my comment --></p>"
# mySoup2 = BeautifulSoup(m)
# print(mySoup2.p)
# print(mySoup2.p.string)
# print(type(mySoup2.p.string))
#     -- OR --
# from bs4 import Comment
# comments = mySoup.find_all(string=lambda text: isinstance(text, Comment))
# print(comments)



#  ---------------------------Step 3 [HTML Tree Traversal]-----------------------------------

#  -- General search --
# paras = mySoup.find_all('p')
# print(paras)

# -- Find All elements having attr id --
# print(mySoup.find_all(id=True))

#  -- Search by id or class --
# print(mySoup.find_all('p', class_= 'lead'))
# idTag = mySoup.find(id = 'navbarSupportedContent')
# print(idTag.prettify())
# for e in idTag.stripped_strings:
#     print(e)


# -- Complex filter --
# import re
# regx = re.compile("t$")
# for tag in mySoup.find_all(regx):
#     print(tag.name)


# -- Links --
# anchors = mySoup.find_all('a')
# print(anchors)
# s = set()
# for a in anchors:
#     if a.get('href') != '#':
#         link = "https://codewithharry.com" + a.get('href')
#         s.add(link)
# for e in s:
#     print(e)

# -- All attributes of a tag --
# inp = mySoup.input.attrs
# print(inp)
# -- or --
# p = mySoup.find('p')
# print(p)
# print(p['class'])
# print(p['id'])
# print(p['href'])


# --Get the text of p of HTML page--
# print(mySoup.find('p').get_text()
# pTags = mySoup.find_all('p')
# for e in pTags: 
#     print (e.get_text())

# -- Parents --
# print(idTag.parent)
# for e in idTag.parents:
#     print(e.name)

#  -- Siblings --
# clsTag = mySoup.find(class_='form-group')
# print(clsTag.previous_sibling.previous_sibling)
# print(" ")
# print(clsTag.next_sibling.next_sibling)


# ----Get required element---
# e = mySoup.select('p')
# e = mySoup.select('#navbarSupportedContent')
# e = mySoup.select('.form-group')
# e = mySoup.select("a#link2")
# e = mySoup.select('a[href]')  
# e = mySoup.select('a[href="http://example.com/elsie"]')  
# e = mySoup.select("html head title")  # heirarchy
# e = mySoup.select('p:nth-of-type(3)')
# print(e)
# print(e[0].get_text())

#  -- Other Imp --
# del tag['class']
# del tag['id']
# mySoup.a.append("Bar")     # bar is appended to <a>tag contents
# j = mySoup.a.insert(3, "Bar")     # bar is appended to <a>tag contents at 3 index position
# print(mySoup.a.get_text())
```

Basic

```python
# https://www.crummy.com/software/BeautifulSoup/bs4/doc/
from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')


soup.title # <title>The Dormouse's story</title>
soup.title.name # u'title'
soup.title.string # u'The Dormouse's story'
soup.title.parent.name # u'head'

#various finder
css_soup.select("p.strikeout.body") # css finder
soup.p # <p class="title"><b>The Dormouse's story</b></p>
soup.p['class'] # u'title'
soup.a # <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>
soup.find_all('a') # [<a ..>, ..]
soup.find(id="link3") # <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>
for link in soup.find_all('a'):
    print(link.get('href')) # http://example.com/elsi, # http://example.com/lacie
```

Search

```python
search.pyhttps://www.crummy.com/software/BeautifulSoup/bs4/doc/
#-------------------------
# css selector
#-------------------------
css_soup.select("p.strikeout.body")
soup.select("p nth-of-type(3)") # 3rd child
soup.select("head > title")
soup.select("p > a:nth-of-type(2)") 
soup.select("p > #link1") # direct child
soup.select("#link1 ~ .sister")  # sibling
soup.select('a[href]') # existence of an attribute
soup.select_one(".sister")

# attribute value
soup.select('a[href="http://example.com/elsie"]') # exact attribute
soup.select('a[href^="http://example.com/"]') # negative match
soup.select('a[href$="tillie"]') # end match
soup.select('a[href*=".com/el"]') # middle match


#-------------------------
# basic
#-------------------------
soup.find_all('b') # match by tag
soup.find_all(re.compile("^b")) # match by tag using regex
soup.find_all(["a", "b"]) # match by tag in list

# function (complex condition)
def has_class_but_no_id(tag):
  return tag.has_attr('class') and not tag.has_attr('id')
soup.find_all(has_class_but_no_id)


#-------------------------
# find_all_api
#-------------------------
find_all(name, attrs, recursive, string, limit, **kwargs)

soup.find_all("title") # tag condition
soup.find_all("p", "title") # tag and attr
# [<p class="title"><b>The Dormouse's story</b></p>]
soup.find_all("a")

# keyword arguments
soup.find_all(id="link2")
soup.find_all(href=re.compile("elsie"), id='link1')
soup.find(string=re.compile("sisters")) # text contain sisters

# css class (class is researved keyword)
soup.find_all("a", class_="sister")
```

Navigation

```python
#-----------------------------
# going up/down/side
#-----------------------------
# ----- going down ----- 
soup.head# <head><title>The Dormouse's story</title></head>
soup.title# <title>The Dormouse's story</title>
soup.body.b # <b>The Dormouse's story</b>
soup.a # <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>
soup.find_all('a')
# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
#  <a class="sister" href="http:

# children = contents
head_tag.contents # [<title>The Dormouse's story</title>]
head_tag.children # [<title>The Dormouse's story</title>]

# descendants (all of a tag’s children, recursively)
for child in head_tag.descendants:
  print(child)
  
# .string is tricky
head_tag.contents # [<title>The Dormouse's story</title>]
head_tag.string # u'The Dormouse's story' (because head tag has only one child)
print(soup.html.string) # None (because html has many children)

# whitespace removed strings
for string in soup.stripped_strings:
  print(repr(string))
  
  
# ----- going up ----- 
title_tag.parent # <head><title>The Dormouse's story</title></head>
# going up recursively
link.parents # [ p, body, html, [document], None]


# ----- sideway ----- 
# sibling = include text node
sibling_soup.b.next_sibling
sibling_soup.c.previous_sibling

# multiple
sibling_soup.b.next_siblings
sibling_soup.c.previous_siblings

# element = not include text node
sibling_soup.b.next_element
sibling_soup.c.previous_element
sibling_soup.b.next_elements
sibling_soup.c.previous_elements
```

https://pytutorial.com/how-to-get-text-method-beautifulsoup/