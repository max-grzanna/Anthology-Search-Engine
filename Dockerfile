FROM webis/tira-ir-datasets-starter:0.0.54
WORKDIR /

RUN apk add jq libffi-dev

COPY ./requirements.txt /
RUN pip3 install -r requirements.txt

COPY anthology.py ir-anthology-processed.jsonl milestone_one.ipynb  anthology-topics.xml /usr/lib/python3.8/site-packages/ir_datasets/datasets_in_progress/

ENTRYPOINT [ "/irds_cli.sh" ]
