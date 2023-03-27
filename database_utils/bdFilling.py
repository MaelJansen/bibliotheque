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
        users = creationUsers()
        for user in users:
            print(user)
    except mysql.connector.Error as err:
        throw(err)

def creationUsers():
    import requests
    url = "https://randomuser.me/api/"
    dataParams = {'nat' : 'fr', 'results' : 50,'inc':'name,email,picture,login'}
    answer = requests.get(url, params=dataParams)
    for i in range(5):
        print(answer.json()['results'][i]['name']['first'])
        print(answer.json()['results'][i]['name']['last'])
        print(answer.json()['results'][i]['email'])
        print(answer.json()['results'][i]['picture']['large'])
        print(answer.json()['results'][i]['login']['password'])
    return None

def recuperationLivresApi():
    import requests
    url = "https://www.googleapis.com/books/v1/volumes?"
    dataParams = {'maxResults': 40, 'q': 'a'}
    answer = requests.get(url, params=dataParams)
    print(len(answer.json()['items']))

creationUsers()