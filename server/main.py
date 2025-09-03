from fastapi import FastAPI, WebSocket # type: ignore

from pydantic_models.chat_body import ChatBody 
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService
import numpy as np # type: ignore
import asyncio

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


# chat websocket
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        print(data)
        query = data.get("query")
        search_results =  search_service.web_search(query)

        sorted_results =  sort_source_service.sort_service(query, search_results)

        await asyncio.sleep(0.1)
        await websocket.send_json({
            'type': 'search_result',
            'data': sorted_results,
        })

        for chunk in llm_service.generate_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({
                'type': 'content',
                'data': chunk,
            })

    except Exception as e:
        print(f"Unexpected error occured: {e}")
    finally:
        await websocket.close()

# chat
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    print(body.query)
    # search the web and find the appropriate sources
    search_results =  search_service.web_search(body.query)

    # print(f"Search Results: {search_results}")

    # Sort the sources
    sorted_results =  sort_source_service.sort_service(body.query, search_results)

    # print(f"Sorted Results: {sorted_results}")

    # generate the response using LLM
    response = llm_service.generate_response(body.query, sorted_results)

    print(f"Response: {sorted_results}")
    return response