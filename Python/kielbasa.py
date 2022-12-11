from simple_salesforce import Salesforce
from datetime import datetime
import time
import math
  
  


username='inzynier.matuszewski@playful-badger-u49kep.com'
password='yukka314'
token='5HIIMalRkhRYilPxmKbn3UCb'
sf = Salesforce(username=username, password=password, security_token=token)

for i in range(0,100):

    # returns current date and time
    now = datetime.now()
    timestamp = now.strftime("%Y-%m-%dT%H:%M:%S")
    print("Timestamp = ", timestamp)

    sf.Temperature__c.create({'Temperature__c':math.sin(i), 'Timestamp__c': timestamp})
    print(sf)
    time.sleep(10)

print('Finito !')
