from fastapi import FastAPI,Request
import uvicorn

app = FastAPI()

@app.get("/index")
async def indx():
    name = 'root'
    return {"index":"index"}

if __name__ == "__main__":
    uvicorn.run("main:app", port= 8090,  reload=True)