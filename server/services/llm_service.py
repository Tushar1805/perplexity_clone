import google.generativeai as genai  # type: ignore
from config import Settings

settings = Settings()

class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("gemini-2.0-flash-exp")

    async def generate_response(self, query: str, search_results: list[dict]):
        # context from web search
        context_text = "\n\n".join([
            f"Source {i+1} ({result['url']}): \n{result['content']}"
            for i, result in enumerate(search_results)
        ])

        # print("****************")
        # print(context_text)

        full_prompt = f"""
        Context from web search:
        {context_text}

        Query: {query}

        Please provide a comprehensive, detailed, well-cited, accurate response using the above context.
        Think and reason deeply. Ensure it answers the query the user is asking. Do not use your knowledge until it is absolutely necessary.
        """

        print("****************")
        print(full_prompt)

        # ✅ use async call
        response = await self.model.generate_content_async(full_prompt)

        return response.text
