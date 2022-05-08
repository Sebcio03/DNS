from fastapi import FastAPI

app = FastAPI()

@app.get("/123")
def read_root():
    return {"API status": "Hello World!"}
