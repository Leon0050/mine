from fastapi import FastAPI, APIRouter
import uvicorn

shop = APIRouter()  #子路由对象shop

@shop.get("/food")
def shop_food():
    return {"shop": "food"}

@shop.get("/bed", tags=["这是shop.bed测试"], summary="这是shop.bed测试!", description="这是shop.bed测试!!", response_description="这是shop.bed测试!!!")
def shop_bed():
    return {"shop": "bed"}