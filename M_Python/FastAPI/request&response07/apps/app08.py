from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi import APIRouter
from pydantic import BaseModel, EmailStr
from typing import Union
app08 = APIRouter()

class UserIn(BaseModel):
    username:str
    password:str
    email:EmailStr
    full_name: str | None =None

# 响应内容应该与输入内容区分开
class UserOut(BaseModel):
    username:str
    email:EmailStr
    full_name: str | None =None

@app08.post("/user02", response_model=UserOut)
async def get_user(user:UserIn):
    # 存到数据库
    return user

