from fastapi import FastAPI, APIRouter
import uvicorn

user = APIRouter()  #子路由对象user

@user.post("/login")
def user_login():
    return {"user": "login"}

@user.post("/reg")
def user_reg():
    return {"user": "reg"}