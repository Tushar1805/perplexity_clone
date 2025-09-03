from typing import List
from sentence_transformers import SentenceTransformer # type: ignore
import numpy as np # type: ignore

class SortSourceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-miniLM-L6-v2")

    def sort_service(self, query: str, search_results: List[dict]):
        try:
            relevant_docs = []
            query_embedding =  self.embedding_model.encode(query)

            for res in search_results:
                content = res.get('content')
                if not content:
                    continue  # or set content = "" if you prefer to keep it

                res_embedding = self.embedding_model.encode(content)

                similarity = float(np.dot(query_embedding, res_embedding)/(np.linalg.norm(query_embedding) * np.linalg.norm(res_embedding)))

                res['relevance_score'] = similarity
                # print(similarity)

                if(similarity > 0.3):
                    relevant_docs.append(res)

            return sorted(relevant_docs, key=lambda x: x['relevance_score'], reverse=True)
        except Exception as e:
            print(e)