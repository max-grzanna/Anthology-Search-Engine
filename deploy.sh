docker build -t memory-qrels .
tira-run --output-directory ${PWD}/iranthology-dataset-tira --image memory-qrels --command '/irds_cli.sh --ir_datasets_id iranthology-memory --output_dataset_path $outputDir'
docker build -t ir-lab-milestone-02 .
tira-run --input-directory ${PWD}/iranthology-dataset-tira --output-directory ${PWD}/bm25-output --image ir-lab-milestone-02 --command '/workspace/run-pyterrier-notebook.py --input $inputDataset --output $outputDir --notebook /workspace/full-rank-pipeline.ipynb'
tira-run --output-directory ${PWD}/bm25-output --image memory-qrels --command 'diffir --dataset iranthology-memory --web $outputDir/run.txt > $outputDir/run.html'

tira-run --input-directory ${PWD}/bm25-output --image memory-qrels --command 'ir_measures iranthology-memory $inputDataset/run.txt nDCG@10 MRR P@10 Recall@100'