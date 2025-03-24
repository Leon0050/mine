from datetime import datetime
from typing import List, Optional  # 类型提示注释
from pydantic import BaseModel

class User(BaseModel):
    id: int
    name: str= 'tom'
    signup_ts: Optional[datetime] = None
    friends: List[int]= []

external_data ={
    'id':123,
    'signup_ts':'2017-06-01 12:22',
    'friends':[1,2,'3']
}
user = User(**external_data)
print(user.id)
print(user.name)
print(repr(user.signup_ts))
print(user.friends)
print(repr(user))