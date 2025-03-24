# include_router
from fastapi import FastAPI, APIRouter
import uvicorn
from fastapi.staticfiles import StaticFiles
from apps.app01 import app01
from apps.app02 import app02
from apps.app03 import app03
from apps.app04 import app04
from apps.app05 import app05
from apps.app06 import app06
from apps.app07 import app07
from apps.app08 import app08

app = FastAPI()

app.mount("/static", StaticFiles(directory="statics")) #静态文件夹挂载， directory与真实存放文件夹名保持一致

app.include_router(app01, tags=["01路径参数"]) # 将子路由对象导入全局路由对象
app.include_router(app02, tags=["02查询参数"])
app.include_router(app03, tags=["03请求体数据"]) # pydantic
app.include_router(app04, tags=["04自己设计框架"])
app.include_router(app05, tags=["05form表单数据"])
app.include_router(app06, tags=["06文件上传"])
app.include_router(app07, tags=["07 Request对象"])
app.include_router(app08, tags=["07 响应参数"])

if __name__ == "__main__":
    uvicorn.run("main:app", port=8070, reload=True)
