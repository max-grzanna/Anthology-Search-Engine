docker build -t memory-qrels .
tira-run --output-directory ${PWD}/iranthology-dataset-tira --image memory-qrels --command '/irds_cli.sh --ir_datasets_id iranthology-memory --output_dataset_path $outputDir'

# milestone-02
docker build -t ir-lab-milestone-02 .
tira-run --input-directory ${PWD}/iranthology-dataset-tira --output-directory ${PWD}/bm25-output --image ir-lab-milestone-02 --allow-network true --command '/workspace/run-pyterrier-notebook.py --input $inputDataset --output $outputDir --notebook /workspace/full-rank-pipeline.ipynb'
tira-run --output-directory ${PWD}/bm25-output --image memory-qrels --allow-network true --command 'diffir --dataset iranthology-memory --web $outputDir/run.txt > $outputDir/run.html'
tira-run --input-directory ${PWD}/bm25-output --image memory-qrels --command 'ir_measures iranthology-memory $inputDataset/run.txt nDCG@10 MRR P@10 Recall@100'

# milestone-03-sdm
docker build -t ir-lab-milestone-03-sdm .
tira-run --input-directory ${PWD}/iranthology-dataset-tira --output-directory ${PWD}/bm25-sdm-output --image ir-lab-milestone-03-sdm --allow-network true --command '/workspace/run-pyterrier-notebook.py --input $inputDataset --output $outputDir --notebook /workspace/full-rank-pipeline-sdm.ipynb'
tira-run --output-directory ${PWD}/bm25-sdm-output --image memory-qrels --allow-network true --command 'diffir --dataset iranthology-memory --web $outputDir/run.txt > $outputDir/run.html'
tira-run --input-directory ${PWD}/bm25-sdm-output --image memory-qrels --command 'ir_measures iranthology-memory $inputDataset/run.txt nDCG@10 MRR P@10 Recall@100'
