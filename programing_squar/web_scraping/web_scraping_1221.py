from bs4 import BeautifulSoup
import urllib.request as req

html = """
<html>
    <head>
        <meta charset="utf-8">
        <title>キノコード
        </title>
    </head>
    <body>
        <h1>こんにちは</h1>
    </body>
</html>
"""
parse_html = BeautifulSoup(html, 'html.parser')
print(parse_html)
print(parse_html.prettify())

url = "https://lms.omu.ac.jp/course/view.php?id=100"
response = req.urlopen(url)
parse_html = BeautifulSoup(response, 'html.parser')
print(parse_html)
print(parse_html.tittle)
print(parse_html.title.string)
print(parse_html.find_all('a'))
title_lists = parse_html.find_all('a')
title_lists[1:10]
title_lists[10].string
title_lists[10].attrs['href']
title_lists = []
url_lists = []
for i in 