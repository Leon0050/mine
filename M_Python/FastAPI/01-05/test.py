from fastapi import FastAPI
from pydantic import BaseModel
app = FastAPI()

# @app.get('/')
# async def root():
#     return{'information': "就是玩"}

# 路径参数
@ app.get('/user/{username}')
async def username(username: str):  # 动态路径参数
    return f"the username is : {username}"

# 查询参数
@ app.get('/search')
async def read_item(keyword: str= ""):
    return f"用户搜索了关键字: {keyword}"

# body
class Loginform(BaseModel):
    username: str
    password: str

@ app.post('/login')
async def login(body: Loginform):
    username, password = body.username, body.password
    if username == 'admin' and password == '123456':
        token = {'status': 'login', 'username':'admin'}
        return token
    else:
        return {'error':"用户名或者密码错误"}