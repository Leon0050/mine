from fastapi import FastAPI
import uvicorn

app = FastAPI()
@app.get('./item',
         tags=["这是items测试接口"],
         summary="这是items的summary",
         description = "this is items 测试description..",
         response_description ="this is items 测试description！",
         deprecated=False
         )
async def test():
    return{'method':"items"}

if __name__ == "__main__":
    uvicorn.run('路径操作装饰器方法参数05:app', port=8000, reload=True)


