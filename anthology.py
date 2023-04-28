import ir_datasets
from ir_datasets.formats import JsonlDocs, TrecXmlQueries, TrecQrels
from typing import NamedTuple, Dict
from ir_datasets.util.download import RequestsDownload
from ir_datasets.datasets.base import Dataset

DATASET_URL = "https://raw.githubusercontent.com/max-grzanna/data/processed"


class AnthologyDocument(NamedTuple):
    doc_id: str
    text: str
    letters: int

    def default_text(self):
        return self.text


ir_datasets.registry.register(
    "anthologies",
    Dataset(
        JsonlDocs(
            ir_datasets.util.Download(
                [RequestsDownload(DATASET_URL + "anthology-documents.jsonl")],
            ),
            doc_cls=AnthologyDocument,
            lang="en",
        ),
        TrecXmlQueries(
            ir_datasets.util.Download(
                [RequestsDownload(DATASET_URL + "anthology-topics.xml")],
            ),
            lang="en",
        ),
    ),
)
