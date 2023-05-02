import ir_datasets
from ir_datasets.formats import JsonlDocs, TrecXmlQueries
from typing import NamedTuple
from ir_datasets.datasets.base import Dataset

class IrAnthologyDocument(NamedTuple):
    doc_id: str
    abstract: str
    title: str
    authors: list
    year: str
    booktitle: str

    def default_text(self):
        return self.title + ' ' + self.abstract

ir_datasets.registry.register('iranthology-memory', Dataset(
import ir_datasets
from ir_datasets.formats import JsonlDocs, TrecXmlQueries
from typing import NamedTuple
from ir_datasets.datasets.base import Dataset


class IrAnthologyDocument(NamedTuple):
    doc_id: str
    abstract: str
    title: str
    authors: list
    year: str
    booktitle: str

    def default_text(self):
        return self.title + ' ' + self.abstract


ir_datasets.registry.register('iranthology-tutors', Dataset(
    JsonlDocs(ir_datasets.util.PackageDataFile(path='datasets_in_progress/anthology-qrels.jsonl'),
              doc_cls=IrAnthologyDocument, lang='en'),
    TrecXmlQueries(ir_datasets.util.PackageDataFile(path='datasets_in_progress/anthology-topics.xml'), lang='en')
))