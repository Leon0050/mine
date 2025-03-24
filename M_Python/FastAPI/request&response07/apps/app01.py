from fastapi import APIRouter
app01 = APIRouter()  # 实例化APIRouter

# @app01.get("/user/1", tags=["01路径参数"], summary="路径参数学习api接口app01")
# def get_user():
#     # id = 1
#     return {
#         "user_id": " 1"
#     }
# root user(路由匹配顺序)
@app01.get("/user/1")
def get_user():
    return {"user_id": "root_user"}

# 1.路径参数-将路径上的值做动态处理(可变动的值)
@app01.get("/user/{id}")
def get_user(id:int): # 强制作一个‘类型声明’
    print("id:",id, type(id))
    return {"user_id": id}

@app01.get("/article/{id}")
def get_article(id):
    print("id:",id)
    return {"article_id": id}
