import requests
import pandas as pd


REQUEST_URL = 'https://app.rakuten.co.jp/services/api/Travel/SimpleHotelSearch/20170426?'
APP_ID = '1067588218966362100'

params = {
    'format': 'json',
    'largeClassCode': 'japan',
    'middleClassCode': 'okinawa',
    'smallClassCode': 'nahashi',
    'applicationId': APP_ID
}

response = requests.get(REQUEST_URL, params)
print(response)
result = response.json