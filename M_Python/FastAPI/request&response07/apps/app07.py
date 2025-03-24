from fastapi import FastAPI, APIRouter,Form, File, UploadFile, Request
from pydantic import BaseModel
from typing import List,Optional
app07 = APIRouter()

@app07.post("/items")
async def items(request: Request):
    print("URL:", request.url)  # 获取url地址
    client_host = request.client.host if request.client else None
    client_port = request.client.host if request.client else None
    print("客户端IP地址", client_host)  # 获取客户端IP地址主机
    print("客户端IP地址", client_port)  # 获取客户端端口
    print("客户端代理请求头", request.headers.get("user-agent"))  # 获取客户端端口
    return {
        "请求URL：":request.url,
        "请求IP：":request.client.host,
        "请求端口：":request.client.port,
        # "cookies:":request.cookies,
        "cookies:": request.cookies.get("a"),
        "客户端宿主：": request.headers.get("user-agent")
    }

