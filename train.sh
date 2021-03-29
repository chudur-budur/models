PROJ_HOME="$HOME/models"
MODEL_DIR="$HOME/experiments/models/retinanet-sp96-bs16-lr0.06"
CUDA_VISIBLE_DEVICES=1 PYTHONPATH=$PROJ_HOME \
    python $PROJ_HOME/official/vision/detection/main.py \
    --strategy_type=one_device \
    --num_gpus=1 \
    --model_dir="${MODEL_DIR?}" \
    --mode=train \
    --config_file="$PROJ_HOME/configs/retinanet-sp96-bs16-lr0.06.yaml"

