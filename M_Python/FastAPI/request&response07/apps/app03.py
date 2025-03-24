from fastapi import FastAPI, APIRouter
from typing import Union, Optional,List
from pydantic import BaseModel, Field, field_validator
from datetime import date
app03 = APIRouter()

class Addr(BaseModel):
    city : str
    street: str
    @field_validator("city")
    def city_must_alpha(cls, value):
        assert value.isalpha(), "city必须是字母"
        return value

class User(BaseModel): # 三个类型限制（BaseModel:数据校验模型）
    name: str
    age: int = Field(default=1, gt=0, lt=100) # 0<age<100， gt:greater than, lt:less than
    birth: Union[date, None] = None # 表明该字段是可选的
    friends:List[int] = []  # 默认值为空列表
    description: Optional[str] =None
    addr: Addr

    # name: str = Field(pattern="^a")  #以a开头
    @field_validator("name")
    def name_must_alpha(cls, value):
        assert value.isalpha(), "name必须是字母"
        return value

class Data(BaseModel):
    data: List[User]  # 嵌套组合

@app03.post('/user')
async def user(user:User):
    print(user, type(user))
    print(user.name, user.age, user.birth)
    print(user.model_dump())
    return user

@app03.post('/data')
async def data(data:Data):
    return data