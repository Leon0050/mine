from fastapi import FastAPI, APIRouter, Form, File,UploadFile
import uvicorn
import os
from typing import List,Optional
from pydantic import BaseModel, Field

app06 = APIRouter()
@app06.post("/file")
async def get_file(file:bytes =File()):
    # 适合单个小文件上传
    print("file", file)
    return {"file": len(file)}


@app06.post("/files")
async def get_files(files:List[bytes] =File()):
    #上传多个文件
    for file in files:
        print(len(file))
    return {"files": len(files)}

@app06.post("/Uploadfile")
async def get_file(file: UploadFile):
    # 适合大文件上传
    print("file", file)
    path = os.path.join("imags", file.filename)
    # 保存文件
    with open (path, "wb") as f:
        for line in f:
            f.write(line)
    return {"file": file.filename}


@app06.post("/Uploadfiles")
async def getuploadfiles(files: List[UploadFile]):
    # 多个大文件上传
    return {"filenames": file.filename for file in files}