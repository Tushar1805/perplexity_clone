from fastapi import FastAPI # type: ignore

from pydantic_models.chat_body import ChatBody 
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()

# chat
@app.post("/chat")
async def chat_endpoint(body: ChatBody):
    print(body.query)
    # search the web and find the appropriate sources
    search_results =  search_service.web_search(body.query)

    # print(f"Search Results: {search_results}")

    # Sort the sources
    sorted_results =  sort_source_service.sort_service(body.query, search_results)

    # print(f"Sorted Results: {sorted_results}")

    # generate the response using LLM
    response = await llm_service.generate_response(body.query, sorted_results)

    print(f"Response: {sorted_results}")
    return response