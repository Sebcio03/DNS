from typing import AsyncGenerator

import pytest


@pytest.mark.asyncio
async def test_root(async_client: AsyncGenerator):
    r = await async_client.get("/", headers={"Content-Type": "application/json"})
    assert r.status_code == 200
    assert r.json() == {"API status": "Hello World!"}
