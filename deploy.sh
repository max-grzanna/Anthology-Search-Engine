tira-run \
    --output-directory ${PWD}/data \
    --image anthology-ir-dataset \
    --allow-network true \
    --command '/irds_cli.sh --ir_datasets_id anthologies --output_dataset_path $outputDir'