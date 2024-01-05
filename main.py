from core.db import database
from contextlib import asynccontextmanager
from fastapi import FastAPI
from routers.auth_routes import auth_router
from routers.beverages_routes import beverages_router


@asynccontextmanager
async def lifespan(app: FastAPI):
    pass
    yield
    database.commit_changes()
    database.close_connection()

app = FastAPI(lifespan=lifespan)

app.include_router(beverages_router)

@app.get("/")
async def root():
    return {"message": "Main page"}
