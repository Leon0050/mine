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

@app08.get("/user")
async def get_user(user:UserIn):
    # 存到数据库
    return user
