import ir_datasets
from ir_datasets.formats import JsonlDocs, TrecXmlQueries, TrecQrels
from typing import NamedTuple, Dict
from ir_datasets.util.download import RequestsDownload
from ir_datasets.datasets.base import Dataset

DATASET_URL = 'https://raw.githubusercontent.com/max-grzanna/Anthology-Search-Engine/main/data/processed/'


class AnthologyDocument(NamedTuple):
    doc_id: str
    text: str
    letters: int

    def default_text(self):
        return self.text


ir_datasets.registry.register(
    'anthologies',
    Dataset(
        JsonlDocs(ir_datasets.util.PackageDataFile(
            path='datasets_in_progress/pangram-documents.jsonl'), 
            doc_cls=PangramDocument, 
            lang='en'
        ),
        TrecXmlQueries(ir_datasets.util.PackageDataFile(
            path='datasets_in_progress/pangram-topics.xml'), 
            lang='en'
        ),
        TrecQrels(ir_datasets.util.PackageDataFile(
            path='datasets_in_progress/pangram-qrels.txt'),
            {0: 'Not Relevant', 1: 'Relevant'}
            )
        ),
)
