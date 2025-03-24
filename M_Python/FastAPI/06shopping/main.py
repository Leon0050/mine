# include_router
from fastapi import FastAPI, APIRouter
import uvicorn

# app01:shop（子路由）, app02:user(子路由)
from apps.app01.urls import shop
from apps.app02.urls import user

app = FastAPI()

app.include_router(shop, prefix="/shop", tags=["购物中心接口"])  # 将shop子路由加入全局路由中
app.include_router(user, prefix="/user", tags=["用户中心接口"])  # 将user子路由加入全局路由中

if __name__ == "__main__":
    uvicorn.run("main:app", port=8070, reload=True)
