from fastapi import FastAPI

app = FastAPI(title="AI-BOS API", version="1.0.0")

@app.get("/")
def read_root():
    return {"message": "Welcome to AI-BOS (AI Business Operating System) API"}
