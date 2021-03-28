PROJ_HOME="$HOME/models"
MODEL_DIR="$HOME/experiments/models/spinenet-coco2017"
CUDA_VISIBLE_DEVICES=1 PYTHONPATH=$PROJ_HOME \
    python3 $PROJ_HOME/official/vision/detection/main.py \
    --strategy_type=one_device \
    --num_gpus=1 \
    --model_dir="${MODEL_DIR?}" \
    --mode=eval \
    --model=retinanet \
    --config_file="$PROJ_HOME/configs/spinenet.yaml"
