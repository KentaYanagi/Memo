import mysql.connector

cnx = mysql.connector.connect(
    user = 'root',
    password = 'KuH68vG5c',
    host = 'localhost',
    port = '13306'
)
cursor = cnx.cursor()
cursor.execute('SELECT * FROM supu_db.users')

for id, name in cursor:
    print(f'{id}: {name}')

cursor.close()