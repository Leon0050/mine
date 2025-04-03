from fastapi import FastAPI, APIRouter
import uvicorn

app = FastAPI()
router = APIRouter()



if __name__ == "__main__":
    uvicorn.run("main:app", port = 8090, reload=True)