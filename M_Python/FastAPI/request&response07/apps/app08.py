from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi import APIRouter
from pydantic import BaseModel, EmailStr
from typing import Union,List


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

class Item(BaseModel):
    name:str
    description:str|None = None
    price:float
    tax:float = 10.5
    tags:List[str] = []

items = {
    "foo": {"name": "Foo", "price": 50.2},
    "bar": {"name": "Bar", "description": "The bartenders", "price": 62, "tax": 20.2},
    "baz": {"name": "Baz", "description": None, "price": 50.2, "tax": 10.5, "tags": []},
}



@app08.post("/user02", response_model=UserOut)
async def get_user(user:UserIn):
    # 存到数据库
    return user
# @app08.get("/items/{item_id}", response_model=Item, response_model_exclude_unset=True)
@app08.get("/items/{item_id}", response_model=Item, response_model_exclude_unset=False, response_model_exclude_defaults=False,response_model_exclude_none=True)
async def read_item(item_id: str):
    return items[item_id]

@app08.get("/items2{item_id}", response_model=Item, response_model_exclude={"tax"})
async def read_item2(item_id: str):
    return items[item_id]

@app08.get("/items3/{item_id}", response_model=Item, response_model_include={"name", "price"})
async def read_item(item_id: str):
    return items[item_id]