from fastapi import APIRouter
from typing import Union, Optional
app02 = APIRouter()

# @app02.get('/jobs'/{xxx})   # xxx为路径参数， a,b 为查询参数
# async def get_jobs(xxx, a,b ):
#     return {"message": "msg"}

# 查询参数
# @app02.get('/jobs')
# async def get_jobs(kd, xl, gj):
#     # 基于kd, xl, gj三个查询参数，返回对应的职位信息
#     # 'http://127.0.0.1:8070/jobs?kd=python&xl=%E6%9C%AC%E7%A7%91&gj=3-5' \
#     # 三个键值对以&为分隔符
#     return {
#         "kd": kd,
#         "xl": xl,
#         "gj": gj
#     }

# 路径参数&查询参数同时使用
@app02.get('/jobs/{kd}')
async def get_jobs(kd, xl:Union[str, None] = None, gj:Optional[str]=None): #有默认参数即可填可不填，没有默认参数则必强制填写
    # 基于kd：路径参数, xl, gj：查询参数，返回对应的职位信息
    # xl: Union[str, None]表示类型为str或者None
    # xl: Union[str, None] = None,表示类型为str或者None,默认值为None
    # Optional是Union的简化；Optional[str] = None 等价于 Union[str, None] = None
    #'http://127.0.0.1:8070/jobs/python?xl=%E6%9C%AC%E7%A7%91&gj=3-5' \
    return {
        "kd": kd,
        "xl": xl,
        "gj": gj
    }

