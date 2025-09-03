from pydantic import BaseModel # type: ignore

class ChatBody(BaseModel):
    query: str