from typing import AsyncGenerator, Generator

import pytest
from app.main import app
from fastapi.testclient import TestClient
from httpx import AsyncClient


@pytest.fixture()
def client() -> Generator:
    yield TestClient(app)


@pytest.fixture()
async def async_client() -> AsyncGenerator:
    async with AsyncClient(app=app, base_url="http://localhost/") as ac:
        yield ac
