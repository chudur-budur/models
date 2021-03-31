PROJ_HOME="$HOME/models"
MODEL_DIR="$HOME/experiments/models/retinanet-sp96-bs4-lr0.008"
CUDA_VISIBLE_DEVICES=1 TF_FORCE_GPU_ALLOW_GROWTH=true PYTHONPATH=$PROJ_HOME \
    python3 $PROJ_HOME/official/vision/detection/main.py \
    --strategy_type=one_device \
    --num_gpus=1 \
    --model_dir="${MODEL_DIR?}" \
    --mode=eval \
    --model=retinanet \
    --config_file="$PROJ_HOME/configs/retinanet-sp96-bs4-lr0.008.yaml"
