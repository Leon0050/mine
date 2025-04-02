from fastapi import FastAPI,Request
import uvicorn
from fastapi.templating import Jinja2Templates
import os

app = FastAPI()
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
templates = Jinja2Templates(directory=os.path.join(BASE_DIR, "templates"))
@app.get("/index")
async def index(request: Request):
    # name = 'LInc'.upper()
    pi = 3.1415926
    name = 'LInc'
    age = 32
    book = ["a", 'b', "c"]
    user = {"name":"Linc","age":25, "gender": "Man"}
    hello = "hello world"

    # return {"name":name}
    return templates.TemplateResponse("index.html",# 模版文件
                                      {
                                            "request":request, # 请求对象
                                            "name":name, # 传递的参数
                                            "age":age,
                                          "books":book,
                                          "user" : user,
                                          "Pi": pi,
                                          "Hello": hello

                                      }, # context上下文对象,一个字典
                                      )

if __name__ == "__main__":
    uvicorn.run("main:app", port= 8090,  reload=True)