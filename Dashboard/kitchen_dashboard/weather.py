import urllib
import urllib.request
from bs4 import BeautifulSoup
import requests
from datetime import date

#build api url
t = str(date.today())
urla ="http://www.bbc.co.uk/weather/en/2644037/daily/"
urlb ="?day="

url = urla+t+urlb+"0"
page = urllib.request.urlopen(url)
soup = BeautifulSoup(page, "html5lib")
rise_set = soup.find('div', attrs={'class':'sunrise-sunset'})
sunrise = rise_set.find('span', attrs={'class':'sunrise'}).text
sunset = rise_set.find('span', attrs={'class':'sunset'}).text

print(sunrise, sunset)
