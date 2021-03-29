PROJ_HOME="$HOME/models"
MODEL_DIR="$HOME/experiments/models/retinanet-sp96-bs6-lr0.04"
CUDA_VISIBLE_DEVICES=1 TF_FORCE_GPU_ALLOW_GROWTH=true PYTHONPATH=$PROJ_HOME \
    python $PROJ_HOME/official/vision/detection/main.py \
    --strategy_type=mirrored \
    --num_gpus=2 \
    --all_reduce_alg=nccl \
    --model_dir="${MODEL_DIR?}" \
    --mode=train \
    --config_file="$PROJ_HOME/configs/retinanet-sp96-bs6-lr0.04.yaml"

