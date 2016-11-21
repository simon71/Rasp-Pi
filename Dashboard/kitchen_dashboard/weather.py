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

#sun rise and sunset
# rise_set = soup.find('div', attrs={'class':'sunrise-sunset'})
# sunrise = rise_set.find('span', attrs={'class':'sunrise'}).text
# sunset = rise_set.find('span', attrs={'class':'sunset'}).text

#last updated
# a = soup.find('div', attrs={'class':'detail-container group'})
# last_update = a.p.text

tr = soup.find('table')
tr_bdy = tr.find('tbody')

print(url)



# a=soup.find('tr', attrs={'class':'time'})
# b=a.findAll('th', attrs={'class':'value hours-1'})
# for c in b:
#     d = c.find('span', attrs={'class':'hour'}).text
#     print(d)
# hr = b.find('span', attrs={'class':'hour'})
# print(b)
