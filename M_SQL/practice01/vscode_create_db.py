import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost',
    port = 3306,
    user = 'root',
    password = 'clm506108' 
)
cursor = connection.cursor()

cursor.execute('CREATE DATABASE `qq`;')

cursor.execute('SHOW DATABASES')
records = cursor.fetchall()
for r in records:
    print(r)

cursor.execute('USE `sql_tutorial`;')
cursor.execute('CREATE TABLE `qq`(qq INT);')

cursor.close()
connection.close()