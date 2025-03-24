from fastapi import FastAPI

app = FastAPI() # 实例化FastAPI

@app.get('/')  # 路径操作装饰器
async def home():  # 路径操作函数
        return {"user_id":12345}

@app.get('/shop')
async def shop():
        return {"shop":"the information of shopping list"}

if __name__ == '__main__':
        import uvicorn
        uvicorn.run("fastapi_quickstart03:app", port = 8080, reload=True)