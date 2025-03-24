from fastapi import APIRouter
from typing import Union,Optional,List
from pydantic import BaseModel,Field, field_validator
from datetime import date

app04 = APIRouter()
@ app04.get("/design", tags=["app04中自己设计的"], summary="designed by myself")
async def get_design():
    return {"data":"the homework designed by me"}
