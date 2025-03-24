from fastapi import FastAPI, APIRouter, Form
import uvicorn
from pydantic import Field, BaseModel
from typing import List, Optional

app05 = APIRouter()

@app05.post("/regin")
async def reg(username:str=Form(), password:str=Form()):
    print(f"username:{username}, password:{password}")
    # 注册，实现数据库的添加操作
    return {
        "username":username
    }
