from dotenv import load_dotenv # type: ignore
from pydantic_settings import BaseSettings # type: ignore

load_dotenv()

class Settings(BaseSettings):
    TAVILY_API_KEY: str = ""
    GEMINI_API_KEY: str = ""