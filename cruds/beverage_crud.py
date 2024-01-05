from core.db import database
from schemas.beverage_schema import Beverage

async def create(beverage: Beverage):
    query = f"INSERT INTO beverage(id, name, price, picture, qtd, category) VALUES (DEFAULT, '{beverage.name}', {beverage.price}, '{beverage.picture}', {beverage.qtd}, '{beverage.category}') RETURNING id;"
    return database.execute_change(query)

async def read():
    query = "SELECT * FROM beverage;"
    return database.execute_select(query)

async def read_by_category(category: str):
    query = f"SELECT * FROM beverage WHERE category LIKE '%{category.title()}%';"
    return database.execute_select(query)

async def read_by_name(name: str):
    query = f"SELECT * FROM beverage WHERE name LIKE '%{name.title()}%';"
    return database.execute_select(query)

async def update(beverage: Beverage):
    query = f"UPDATE beverage SET name='{beverage.name}', price={beverage.price}, picture='{beverage.picture}', qtd={beverage.qtd}, category='{beverage.category}' WHERE id={beverage.id};"
    database.cur.execute(query)
    return database.check(beverage.id)

async def delete(id: int): #soft delete
    query = f"UPDATE beverage SET is_active = false WHERE id= {id};"
    database.cur.execute(query)
    return database.check(id)

async def activate_beverage(id: int): #reverses the delete action
    query = f"UPDATE beverage SET is_active = true WHERE id= {id};"
    database.cur.execute(query)
    return database.check(id)

