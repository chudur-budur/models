PROJ_HOME="$HOME/models"
MODEL_DIR="$HOME/experiments/models/retinaspinenet2017"
CUDA_VISIBLE_DEVICES=1 PYTHONPATH=$PROJ_HOME \
    python $PROJ_HOME/official/vision/detection/main.py \
    --strategy_type=mirrored \
    --num_gpus=2 \
    --model_dir="${MODEL_DIR?}" \
    --mode=train \
    --config_file="$PROJ_HOME/configs/retinaspinenet.yaml"

