from fastapi import APIRouter
from cruds.beverage_crud import *
from schemas.beverage_schema import Beverage

beverages_router = APIRouter(
    prefix='/beverages',
    tags=['beverages']
)

@beverages_router.post('/')
async def generate_new_beverage(beverage: Beverage):
    return await create(beverage)

@beverages_router.get('/')
async def list_beverages():
    return await read()

@beverages_router.get('/category/{category}')
async def list_beverages_by_category(category: str):
    return await read_by_category(category)

@beverages_router.get('/search/{name}')
async def list_beverages_by_name(name: str):
    return await read_by_name(name)

@beverages_router.patch('/{id}')
async def patch_existing_beverage(beverage: Beverage):
    return await update(beverage)

@beverages_router.delete('/{id}')
async def erase_existing_beverage(id: int):
    return await delete(id)

@beverages_router.patch('/{id}/activate')
async def activate_existing_beverage(id: int):
    return await activate_beverage(id)



    

