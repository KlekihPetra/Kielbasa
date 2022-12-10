from simple_salesforce import Salesforce
# Import datetime class from datetime module
from datetime import datetime
  
  
# returns current date and time
now = datetime.now()
timestamp = now.strftime("%H:%M:%S")
print("Timestamp = ", timestamp)

username='inzynier.matuszewski@playful-badger-u49kep.com'
password='majerenek8'
token='S76hROSKooFHOlfkdcEKd8dr'
sf = Salesforce(username=username, password=password, security_token=token)

sf.Temperature__c.create({'Temperature__c':666, 'Timestamp__c': timestamp})

print(sf)
print('Finito !')
