FROM webis/tira-ir-datasets-starter:0.0.54

COPY anthology.py data/processed/anthology-qrels.txt data/processed/anthology-topics.xml  data/processed/anthology-documents.jsonl /usr/lib/python3.8/site-packages/ir_datasets/datasets_in_progress/

ENTRYPOINT [ "/irds_cli.sh" ]
