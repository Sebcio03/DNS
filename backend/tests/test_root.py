from typing import AsyncGenerator

import pytest


@pytest.mark.asyncio
async def test_root(async_client: AsyncGenerator):
    headers = {"Content-Type": "application/json"}
    r = await async_client.get("/root", headers=headers)
    assert r.status_code == 200
    assert r.json() == {"API status": "Hello World!"}
