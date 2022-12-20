from selenium import webdriver

import pandas as pd
import time
import os
import datetime

USER = "se22836a"
PASS = "suqze4-fefdob-joVguz"

# ブラウザを開く
browser = webdriver.Chrome()
browser.implicitly_wait(3)

# ログインページにアクセス
url_login = "https://lms.omu.ac.jp/login/index.php"
browser.get(url_login)
time.sleep(3)
print("ログインページにアクセスしました")

# テキストボックスに文字を入力
element = browser.find_element("name","SM_UID")
element.clear()
element.send_keys(USER)
element = browser.find_element("name","SM_PWD")
element.clear()
element.send_keys(PASS)
print("フォームを送信")

# 入力したデータをクリック
browser.find_element("xpath","//*[@id="bg1"]/table[1]/tbody/tr[2]/td/form/table/tbody/tr[3]/td/input[1]").click()
time.sleep(3)
print("ログインボタンをクリック")

# ページにアクセス
url = "https://lms.omu.ac.jp/course/view.php?id=100"
time.sleep(3)
browser.get(url)
print(url+":ページにアクセスしました")

#　ダウンロードボタンをクリック
frm = browser.find_element("xpath","")
time.sleep(1)
frm.click()
print("ダウンロードボタンをクリック")


