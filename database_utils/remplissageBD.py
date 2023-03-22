'''
    File used to fill the database
'''

def remplissageBD():
    '''
        Database filling
    '''
    import mysql.connector
    from mysql.connector import errorcode
    import random
    import datetime
    import time

    # Connexion à la base de données
    try:
        cnx = mysql.connector.connect(user='root', password='root', host=''
                                        , database='projet')
        
    except mysql.connector.Error as err:
        throw(err)

def creationUsers():
    return None

def recuperationLivresApi():
    import requests
    url = "https://www.googleapis.com/books/v1/volumes?q=''"
    params = {'limit': 10, 'offset': 0}
    answer = requests.get(url, params=params)
    print(answer.json())

recuperationLivresApi()