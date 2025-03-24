import pymysql

db = pymysql.connect(
    host='localhost',
    user='root',
    password='clm506108',
    database='school',
    port=3306
)
#
# cursor = db.cursor()
#
# cursor.execute("""
#     CREATE TABLE IF NOT EXISTS sqltest (
#         id INT PRIMARY KEY AUTO_INCREMENT,
#         name VARCHAR(255),
#         age INT
#     )
# """)
# cursor.execute("INSERT INTO sqltest (name, age) VALUES (%s, %s)", ("tome", 15))
# db.commit()
# db.close()

cursor = db.cursor()

data = [("Alice", 22),("Bob", 25),("Charlie", 30)]
cursor.executemany("INSERT INTO sqltest (name, age) VALUES (%s, %s)", data)
# cursor.execute("INSERT INTO sqltest (name, age) VALUES (%s, %s)", ("Bob", 25))
# cursor.execute("INSERT INTO sqltest (name, age) VALUES (%s, %s)", ("Charlie", 30))
db.commit()
db.close()

# 封装
# import pymysql
#
# # 配置数据库连接（通用）
# def get_connection():
#     return pymysql.connect(
#         host='localhost',
#         user='root',
#         password='clm506108',
#         database='school',
#         port=3306
#     )
#
# # 创建表（如果不存在）
# def create_table():
#     db = get_connection()
#     cursor = db.cursor()
#     cursor.execute("""
#         CREATE TABLE IF NOT EXISTS sqltest (
#             id INT PRIMARY KEY AUTO_INCREMENT,
#             name VARCHAR(255),
#             age INT
#         )
#     """)
#     db.commit()
#     db.close()
#
# # 插入数据
# def insert_data(data):
#     db = get_connection()
#     cursor = db.cursor()
#     cursor.executemany("INSERT INTO sqltest (name, age) VALUES (%s, %s)", data)
#     db.commit()
#     db.close()
#
# # 查询数据
# def fetch_all():
#     db = get_connection()
#     cursor = db.cursor()
#     cursor.execute("SELECT * FROM sqltest")
#     result = cursor.fetchall()
#     db.close()
#     return result
#
# # 删除表（如果需要）
# def drop_table():
#     db = get_connection()
#     cursor = db.cursor()
#     cursor.execute("DROP TABLE IF EXISTS sqltest")
#     db.commit()
#     db.close()
