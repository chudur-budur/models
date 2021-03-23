PROJ_HOME="$HOME/models"
MODEL_DIR="$HOME/experiments/models/retinanet"
PYTHONPATH=$PROJ_HOME python3 $PROJ_HOME/official/vision/detection/main.py \
    --strategy_type=mirrored \
    --num_gpus=2 \
    --model_dir="${MODEL_DIR?}" \
    --mode=train \
    --config_file="$PROJ_HOME/configs/retinanet.yaml"

