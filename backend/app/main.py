from fastapi import FastAPI

app = FastAPI()


@app.get("/root")
async def read_root():
    return {"API status": "Hello World!"}
