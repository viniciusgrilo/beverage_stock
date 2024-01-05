from pydantic.main import BaseModel


class Beverage(BaseModel):
    id: int
    name: str
    price: float
    picture: str
    qtd: int
    category: str
    is_active: bool