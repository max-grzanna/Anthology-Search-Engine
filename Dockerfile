# We start from a docker image that already has all dependencies installed
FROM webis/tira-ir-starter-pyterrier:0.0.2-base

# We remove some non-required files from our starting image
RUN rm /workspace/*.ipynb /workspace/default_pipelines.py /workspace/pyterrier_cli.py

COPY *.ipynb /workspace/

ADD iranthology-dataset-tira /workspace/

RUN jupyter trust /workspace/*.ipynb

# For local development, we start a jupyter notebook by default
ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--ip", "0.0.0.0"]



# FROM webis/tira-ir-datasets-starter:0.0.54
# WORKDIR /

# RUN apk add jq libffi-dev

# COPY anthology.py ir-anthology-processed.jsonl milestone_one.ipynb  anthology-topics.xml anthology-qrels.txt /usr/lib/python3.8/site-packages/ir_datasets/datasets_in_progress/

# ENTRYPOINT [ "/irds_cli.sh" ]
