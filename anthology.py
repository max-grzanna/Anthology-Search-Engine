import ir_datasets
from ir_datasets.formats import JsonlDocs, TrecXmlQueries, TrecQrels
from typing import NamedTuple, Dict
from ir_datasets.util.download import RequestsDownload
from ir_datasets.datasets.base import Dataset

DATASET_URL = 'https://raw.githubusercontent.com/max-grzanna/Anthology-Search-Engine/main/data/processed/'


class IrAnthologyDocument(NamedTuple):
    doc_id: str
    abstract: str
    title: str
    authors: list
    year: str
    booktitle: str

    def default_text(self):
        return self.title + ' ' + self.abstract

ir_datasets.registry.register('iranthology-memory', 
    Dataset(
        JsonlDocs(ir_datasets.util.PackageDataFile(path='datasets_in_progress/ir-anthology-processed.jsonl'), doc_cls=IrAnthologyDocument, lang='en'),
        TrecXmlQueries(ir_datasets.util.PackageDataFile(path='datasets_in_progress/anthology-topics.xml'), lang='en')
))