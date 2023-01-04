from simple_salesforce import Salesforce
from datetime import datetime
import time
import math
  
# Authenticate to Salesforce
username='inzynier.matuszewski@playful-badger-u49kep.com'
password='majeranek8'
token='WAOCeEHUo33ArmXAlBox5hGTY'
sf = Salesforce(username=username, password=password, security_token=token)


for i in range(0,100):

    # returns current date and time
    now = datetime.now()
    timestamp = now.strftime("%Y-%m-%dT%H:%M:%S")

    temperature = math.sin(i)*100
    print("Time: %s, Temperature: %2d"%(timestamp, temperature))

    sf.Temperature__c.create({'Temperature__c':temperature, 'Timestamp__c': timestamp})
    print(sf)
    time.sleep(10)

print('Finito !')
