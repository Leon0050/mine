import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost',
    port = 3306,
    user = 'root',
    password = 'clm506108' ,
    database='company'
)
cursor = connection.cursor()
# cursor.execute('INSERT INTO `branch` VALUES(5, `qq`, NULL);')
cursor.execute('SELECT * FROM `branch`;')
records = cursor.fetchall()
for r in records:
    print(r)

cursor.close()
connection.close()